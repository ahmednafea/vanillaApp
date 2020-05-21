import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vanilla/UI/splash_screen.dart';
import 'package:vanilla/configs/app_colors.dart';
import 'package:vanilla/local/app_translation.dart';
import 'package:vanilla/middleware/home_middleware.dart';
import 'package:vanilla/middleware/navigation_key.dart';
import 'package:vanilla/middleware/navigation_middleware.dart';
import 'package:vanilla/model/app_state.dart';
import 'package:vanilla/reducer/app_state_reducer.dart';
import 'package:vanilla/routes.dart';
import 'package:vanilla/shared.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  runApp(VanillaApp());
}

loggingMiddleware(Store<AppState> store, action, NextDispatcher next) {
  print('${DateTime.now()} $action ');
  next(action);
}

AppState init() => AppState();

class VanillaApp extends StatefulWidget {
  VanillaAppState createState() => VanillaAppState();
}

class VanillaAppState extends State<VanillaApp> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  AppTranslationsDelegate _newLocaleDelegate;
  final store = Store<AppState>(appStateReducer,
      initialState: init(),
      middleware: [loggingMiddleware, homeMiddleware, navigationMiddleware]);

  Future<void> _checkFirstTime() async {
    final SharedPreferences prefs = await _prefs;
    Shared.isFirstTime = prefs.getBool('VanillaFirstTime') ?? true;
    Shared.savedLang = prefs.getString("VanillaLang") ?? "none";
    prefs.setBool('VanillaFirstTime', false);
  }

  @override
  void initState() {
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    application.onLocaleChanged = onLocaleChange;
    _checkFirstTime();
    super.initState();
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return StoreProvider(
        store: store,
        child: MaterialApp(
            title: "Vanilla",
            localizationsDelegates: [
              _newLocaleDelegate,
              const AppTranslationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              return supportedLocales.last;
            },
            supportedLocales: application.supportedLocales(),
            color: AppColors.primaryColor,
            theme: ThemeData(
              primaryColor: AppColors.primaryColor,
              accentColor: AppColors.secondaryColor,
            ),
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
            builder: (context, child) {
              return Directionality(
                  textDirection:
                      AppTranslations.of(context).currentLanguage == "ar"
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                  child: Builder(builder: (context) {
                    return MediaQuery(
                        child: child,
                        data: MediaQuery.of(context).copyWith(
                          textScaleFactor: 1.0,
                        ));
                  }));
            },
            routes: routes(),
            initialRoute: '/',
            navigatorKey: navigatorKey));
  }
}
