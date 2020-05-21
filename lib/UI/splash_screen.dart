import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vanilla/Library/intro_views_flutter-2.4.0/lib/Models/page_view_model.dart';
import 'package:vanilla/Library/intro_views_flutter-2.4.0/lib/intro_views_flutter.dart';
import 'package:vanilla/actions/fetch_home_content_action.dart';
import 'package:vanilla/actions/open_signup_screen_action.dart';
import 'package:vanilla/configs/app_colors.dart';
import 'package:vanilla/local/app_translation.dart';
import 'package:vanilla/middleware/navigation_key.dart';
import 'package:vanilla/model/app_state.dart';

import '../shared.dart';
import 'BottomNavigationBar.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

var _fontHeaderStyle = TextStyle(
    fontFamily: "Popins",
    fontSize: 21.0,
    fontWeight: FontWeight.w800,
    color: AppColors.secondaryColor,
    letterSpacing: 1.5);

var _fontDescriptionStyle = TextStyle(
    fontFamily: "Sans",
    fontSize: 15.0,
    color: Colors.black26,
    fontWeight: FontWeight.w400);

class _SplashScreenState extends State<SplashScreen> {
  bool _isSplash = true;

  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(onInitialBuild: (Store<AppState> store) {
      Shared.globalStore = store;
      Timer(Duration(seconds: 2), () {
        if (Shared.isFirstTime) {
          setState(() {
            _isSplash = false;
          });
        } else {
          store.dispatch(FetchHomeContentAction(ctx: context));
        }
      });
    }, builder: (BuildContext ctx, Store<AppState> store) {
      return _isSplash
          ? Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                /// Set Background image in splash screen layout (Click to open code)
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img/girl.png'),
                        fit: BoxFit.cover)),
                child: Container(
                  /// Set gradient black in image splash screen (Click to open code)
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                        Color.fromRGBO(0, 0, 0, 0.4),
                        Color.fromRGBO(0, 0, 0, 0.6)
                      ],
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter)),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 30.0),
                            ),

                            /// Text header "Welcome To" (Click to open code)
                            Text(
                              AppTranslations.of(ctx).currentLanguage == "ar"
                                  ? "مرحباً بك فى"
                                  : "Welcome to",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                                fontFamily: "Sans",
                                fontSize: 19.0,
                              ),
                            ),

                            /// Animation text Treva Shop to choose Login with Hero Animation (Click to open code)
                            Image.asset(
                              "assets/img/title_only.png",
                              width: 200,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Directionality(
              textDirection: AppTranslations.of(context).currentLanguage == "ar"
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              child: IntroViewsFlutter(
                [
                  PageViewModel(
                      pageColor: Colors.white,
                      iconColor: AppColors.primaryColor,
                      bubbleBackgroundColor: AppColors.primaryColor,
                      title: Text(
                        AppTranslations.of(ctx).currentLanguage == "ar"
                            ? "تطبيق فانيلا"
                            : 'Vanilla App',
                        style: _fontHeaderStyle,
                      ),
                      body: Container(
                        height: 250.0,
                        child: Text(
                            AppTranslations.of(ctx).currentLanguage == "ar"
                                ? "أهلاً بك فى تطبيق فانيلا"
                                : 'welcome in Vanilla application',
                            textAlign: TextAlign.center,
                            style: _fontDescriptionStyle),
                      ),
                      mainImage: Image.asset(
                        'assets/img/Logo.png',
                        height: 300.0,
                        width: 300.0,
                        alignment: Alignment.center,
                      )),
                  PageViewModel(
                      pageColor: Colors.white,
                      iconColor: AppColors.primaryColor,
                      bubbleBackgroundColor: AppColors.primaryColor,
                      title: Text(
                        AppTranslations.of(ctx).currentLanguage == "ar"
                            ? "إختر المنتج"
                            : 'Choose Product',
                        style: _fontHeaderStyle,
                      ),
                      body: Container(
                        height: 250.0,
                        child: Text(
                            AppTranslations.of(ctx).currentLanguage == "ar"
                                ? "اختر المنتجات أينما كنت مع هذا التطبيق لجعل الحياة أسهل"
                                : 'Choose products wherever you are with this application to make life easier',
                            textAlign: TextAlign.center,
                            style: _fontDescriptionStyle),
                      ),
                      mainImage: Image.asset(
                        'assets/imgIllustration/IlustrasiOnBoarding2.png',
                        height: 285.0,
                        width: 285.0,
                        alignment: Alignment.center,
                      )),
                  PageViewModel(
                      pageColor: Colors.white,
                      iconColor: AppColors.primaryColor,
                      bubbleBackgroundColor: AppColors.primaryColor,
                      title: Text(
                        AppTranslations.of(ctx).currentLanguage == "ar"
                            ? "إشترى المنتج"
                            : 'Buy Product',
                        style: _fontHeaderStyle,
                      ),
                      body: Container(
                        height: 250.0,
                        child: Text(
                            AppTranslations.of(ctx).currentLanguage == "ar"
                                ? "تسوق من آلاف العلامات التجارية في العالم في تطبيق واحد بأسعار مخفضة"
                                : 'Shop from thousand brands in the world in one application at throw away prices ',
                            textAlign: TextAlign.center,
                            style: _fontDescriptionStyle),
                      ),
                      mainImage: Image.asset(
                        'assets/imgIllustration/IlustrasiOnBoarding3.png',
                        height: 285.0,
                        width: 285.0,
                        alignment: Alignment.center,
                      )),
                ],
                pageButtonsColor: AppColors.secondaryColor,
                skipText: Text(
                  AppTranslations.of(ctx).currentLanguage == "ar"
                      ? "تخطى"
                      : "SKIP",
                  style: _fontDescriptionStyle.copyWith(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.0),
                ),
                doneText: Text(
                  AppTranslations.of(ctx).currentLanguage == "ar"
                      ? "تم"
                      : "DONE",
                  style: _fontDescriptionStyle.copyWith(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.0),
                ),
                onTapDoneButton: () {
                  store.dispatch(FetchHomeContentAction(ctx: context));
                },
                onTapSkipButton: () {
                  store.dispatch(FetchHomeContentAction(ctx: context));
                },
              ),
            );
    });
  }
}
