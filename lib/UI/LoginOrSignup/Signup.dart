import 'dart:async';

import 'package:vanilla/UI/LoginOrSignup/LoginAnimation.dart';
import 'package:vanilla/actions/open_login_screen_action.dart';
import 'package:vanilla/configs/app_colors.dart';
import 'package:vanilla/configs/size_config.dart';
import 'package:vanilla/local/app_translation.dart';
import 'package:vanilla/model/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> with TickerProviderStateMixin {
  //Animation Declaration
  AnimationController sanimationController;
  AnimationController animationControllerScreen;
  Animation animationScreen;
  var tap = 0;
  String _gender = "الجنس";

  /// Dispose animationController
  @override
  void dispose() {
    super.dispose();
    sanimationController.dispose();
  }

  /// Playanimation set forward reverse
  Future<Null> _PlayAnimation() async {
    try {
      await sanimationController.forward();
      await sanimationController.reverse();
    } on TickerCanceled {}
  }

  /// Component Widget layout UI
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    mediaQueryData.devicePixelRatio;
    mediaQueryData.size.height;
    mediaQueryData.size.width;
    return StoreBuilder<AppState>(onInit: (Store<AppState> store) {
      sanimationController = AnimationController(
          vsync: this, duration: Duration(milliseconds: 500))
        ..addStatusListener((status) {
          if (status == AnimationStatus.dismissed) {
            setState(() {
              tap = 0;
            });
          }
        });
    }, builder: (BuildContext ctx, Store<AppState> store) {
      SizeConfig().init(ctx);
      return SafeArea(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                /// Set Background image in layout
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/img/backgroundgirl.png"),
                  fit: BoxFit.cover,
                )),
                child: Container(
                  /// Set gradient color in image
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(0, 0, 0, 0.3),
                        Color.fromRGBO(0, 0, 0, 0.6)
                      ],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                    ),
                  ),
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.safeBlockVertical * 4),
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: SizeConfig.safeBlockVertical * 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                  image:
                                      AssetImage("assets/img/logowithtext.png"),
                                  height: SizeConfig.safeBlockVertical * 8,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: AlignmentDirectional.center,
                            height: SizeConfig.safeBlockVertical * 10,
                            margin: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 8,
                                vertical: SizeConfig.safeBlockVertical),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.0),
                                color: Colors.white.withOpacity(0.7),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10.0, color: Colors.black12)
                                ]),
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 4,
                                vertical: SizeConfig.safeBlockVertical),
                            child: Theme(
                              data: ThemeData(
                                hintColor: Colors.transparent,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: AppTranslations.of(ctx)
                                                .currentLanguage ==
                                            "ar"
                                        ? "الاسم الأول"
                                        : "First Name",
                                    icon: Icon(
                                      Icons.person,
                                      color: Colors.black38,
                                    ),
                                    labelStyle: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockVertical * 2.5,
                                        fontFamily: 'Sans',
                                        letterSpacing: 0.3,
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600)),
                                keyboardType: TextInputType.text,
                              ),
                            ),
                          ),
                          Container(
                            alignment: AlignmentDirectional.center,
                            height: SizeConfig.safeBlockVertical * 10,
                            margin: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 8,
                                vertical: SizeConfig.safeBlockVertical),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.0),
                                color: Colors.white.withOpacity(0.7),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10.0, color: Colors.black12)
                                ]),
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 4,
                                vertical: SizeConfig.safeBlockVertical),
                            child: Theme(
                              data: ThemeData(
                                hintColor: Colors.transparent,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: AppTranslations.of(ctx)
                                                .currentLanguage ==
                                            "ar"
                                        ? "الاسم الأخير"
                                        : "Last Name",
                                    icon: Icon(
                                      Icons.person,
                                      color: Colors.black38,
                                    ),
                                    labelStyle: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockVertical * 2.5,
                                        fontFamily: 'Sans',
                                        letterSpacing: 0.3,
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600)),
                                keyboardType: TextInputType.text,
                              ),
                            ),
                          ),
                          Container(
                            alignment: AlignmentDirectional.center,
                            height: SizeConfig.safeBlockVertical * 10,
                            margin: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 8,
                                vertical: SizeConfig.safeBlockVertical),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.0),
                                color: Colors.white.withOpacity(0.7),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10.0, color: Colors.black12)
                                ]),
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 4,
                                vertical: SizeConfig.safeBlockVertical),
                            child: Theme(
                              data: ThemeData(
                                hintColor: Colors.transparent,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: AppTranslations.of(ctx)
                                                .currentLanguage ==
                                            "ar"
                                        ? "البريد الإلكترونى"
                                        : "Email",
                                    icon: Icon(
                                      Icons.mail_outline,
                                      color: Colors.black38,
                                    ),
                                    labelStyle: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockVertical * 2.5,
                                        fontFamily: 'Sans',
                                        letterSpacing: 0.3,
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600)),
                                keyboardType: TextInputType.text,
                              ),
                            ),
                          ),
                          Container(
                            alignment: AlignmentDirectional.center,
                            height: SizeConfig.safeBlockVertical * 10,
                            margin: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 8,
                                vertical: SizeConfig.safeBlockVertical),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.0),
                                color: Colors.white.withOpacity(0.7),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10.0, color: Colors.black12)
                                ]),
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 4,
                                vertical: SizeConfig.safeBlockVertical),
                            child: Theme(
                              data: ThemeData(
                                hintColor: Colors.transparent,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: AppTranslations.of(ctx)
                                                .currentLanguage ==
                                            "ar"
                                        ? "كلمة السر"
                                        : "Password",
                                    icon: Icon(
                                      Icons.lock_outline,
                                      color: Colors.black38,
                                    ),
                                    labelStyle: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockVertical * 2.5,
                                        fontFamily: 'Sans',
                                        letterSpacing: 0.3,
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600)),
                                keyboardType: TextInputType.text,
                              ),
                            ),
                          ),
                          Container(
                            alignment: AlignmentDirectional.center,
                            height: SizeConfig.safeBlockVertical * 10,
                            margin: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 8,
                                vertical: SizeConfig.safeBlockVertical),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.0),
                                color: Colors.white.withOpacity(0.7),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10.0, color: Colors.black12)
                                ]),
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 4,
                                vertical: SizeConfig.safeBlockVertical),
                            child: Theme(
                              data: ThemeData(
                                hintColor: Colors.transparent,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: AppTranslations.of(ctx)
                                                .currentLanguage ==
                                            "ar"
                                        ? "العنوان"
                                        : "Address",
                                    icon: Icon(
                                      Icons.place,
                                      color: Colors.black38,
                                    ),
                                    labelStyle: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockVertical * 2.5,
                                        fontFamily: 'Sans',
                                        letterSpacing: 0.3,
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600)),
                                keyboardType: TextInputType.text,
                              ),
                            ),
                          ),
                          Container(
                            alignment: AlignmentDirectional.center,
                            height: SizeConfig.safeBlockVertical * 10,
                            margin: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 8,
                                vertical: SizeConfig.safeBlockVertical),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.0),
                                color: Colors.white.withOpacity(0.7),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10.0, color: Colors.black12)
                                ]),
                            padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.safeBlockVertical),
                            child: Theme(
                              data: ThemeData(
                                hintColor: Colors.transparent,
                              ),
                              child: PopupMenuButton<int>(
                                child: ListTile(
                                  leading: Image.asset(
                                    "assets/icon/gender_icon.png",
                                    fit: BoxFit.cover,
                                    color: Colors.black38,
                                    height: SizeConfig.safeBlockVertical * 4,
                                    width: SizeConfig.safeBlockVertical * 4,
                                  ),
                                  title: Text(_gender),
                                  trailing: Icon(Icons.keyboard_arrow_down),
                                ),
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: 1,
                                    child: Text(AppTranslations.of(ctx)
                                                .currentLanguage ==
                                            "ar"
                                        ? "ذكر"
                                        : "Male"),
                                  ),
                                  PopupMenuItem(
                                    value: 2,
                                    child: Text(AppTranslations.of(ctx)
                                                .currentLanguage ==
                                            "ar"
                                        ? "أنثى"
                                        : "Female"),
                                  ),
                                ],
                                onCanceled: () {
                                  print("You have canceled the menu.");
                                },
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                color: AppColors.primaryColor,
                                offset:
                                    AppTranslations.of(ctx).currentLanguage ==
                                            "ar"
                                        ? Offset(-10, 100)
                                        : Offset(10, 100),
                                onSelected: (value) {
                                  print("value:$value");
                                  if (value == 1) {
                                    setState(() {
                                      _gender = AppTranslations.of(ctx)
                                                  .currentLanguage ==
                                              "ar"
                                          ? "ذكر"
                                          : "Male";
                                    });
                                  } else {
                                    setState(() {
                                      _gender = AppTranslations.of(ctx)
                                                  .currentLanguage ==
                                              "ar"
                                          ? "أنثى"
                                          : "Female";
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                          Container(
                            alignment: AlignmentDirectional.center,
                            height: SizeConfig.safeBlockVertical * 10,
                            margin: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 8,
                                vertical: SizeConfig.safeBlockVertical),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.0),
                                color: Colors.white.withOpacity(0.7),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10.0, color: Colors.black12)
                                ]),
                            padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.safeBlockVertical),
                            child: Theme(
                              data: ThemeData(
                                hintColor: Colors.transparent,
                              ),
                              child: PopupMenuButton<int>(
                                child: ListTile(
                                  leading: Icon(
                                    Icons.location_city,
                                    color: Colors.black38,
                                  ),
                                  title: Text("المدينة"),
                                  trailing: Icon(Icons.keyboard_arrow_down),
                                ),
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: 1,
                                    child: Text(AppTranslations.of(ctx)
                                                .currentLanguage ==
                                            "ar"
                                        ? "ذكر"
                                        : "Male"),
                                  ),
                                  PopupMenuItem(
                                    value: 2,
                                    child: Text(AppTranslations.of(ctx)
                                                .currentLanguage ==
                                            "ar"
                                        ? "أنثى"
                                        : "Female"),
                                  ),
                                ],
                                onCanceled: () {
                                  print("You have canceled the menu.");
                                },
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                color: AppColors.primaryColor,
                                offset:
                                    AppTranslations.of(ctx).currentLanguage ==
                                            "ar"
                                        ? Offset(-10, 100)
                                        : Offset(10, 100),
                                onSelected: (value) {
                                  print("value:$value");
                                  if (value == 1) {
                                    setState(() {
                                      _gender = AppTranslations.of(ctx)
                                                  .currentLanguage ==
                                              "ar"
                                          ? "ذكر"
                                          : "Male";
                                    });
                                  } else {
                                    setState(() {
                                      _gender = AppTranslations.of(ctx)
                                                  .currentLanguage ==
                                              "ar"
                                          ? "أنثى"
                                          : "Female";
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                          Container(
                            alignment: AlignmentDirectional.center,
                            height: SizeConfig.safeBlockVertical * 10,
                            margin: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 8,
                                vertical: SizeConfig.safeBlockVertical),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.0),
                                color: Colors.white.withOpacity(0.7),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10.0, color: Colors.black12)
                                ]),
                            padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.safeBlockVertical),
                            child: Theme(
                              data: ThemeData(
                                hintColor: Colors.transparent,
                              ),
                              child: PopupMenuButton<int>(
                                child: ListTile(
                                  leading: Icon(
                                    Icons.public,
                                    color: Colors.black38,
                                  ),
                                  title: Text("الدولة"),
                                  trailing: Icon(Icons.keyboard_arrow_down),
                                ),
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: 1,
                                    child: Text(AppTranslations.of(ctx)
                                                .currentLanguage ==
                                            "ar"
                                        ? "ذكر"
                                        : "Male"),
                                  ),
                                  PopupMenuItem(
                                    value: 2,
                                    child: Text(AppTranslations.of(ctx)
                                                .currentLanguage ==
                                            "ar"
                                        ? "أنثى"
                                        : "Female"),
                                  ),
                                ],
                                onCanceled: () {
                                  print("You have canceled the menu.");
                                },
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                color: AppColors.primaryColor,
                                offset:
                                    AppTranslations.of(ctx).currentLanguage ==
                                            "ar"
                                        ? Offset(-10, 100)
                                        : Offset(10, 100),
                                onSelected: (value) {},
                              ),
                            ),
                          ),
                          FlatButton(
                              padding: EdgeInsets.only(
                                  bottom: SizeConfig.safeBlockVertical),
                              onPressed: () {
                                store.dispatch(OpenLoginScreenAction());
                              },
                              child: Text(
                                AppTranslations.of(ctx).currentLanguage == "ar"
                                    ? "ألديك حساب ؟ سجل الدخول"
                                    : " Have Acount? Sign In",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: SizeConfig.safeBlockVertical * 2,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Sans"),
                              )),
                        ],
                      ),

                      /// Set Animaion after user click buttonLogin
                      tap == 0
                          ? InkWell(
                              splashColor: AppColors.primaryColor,
                              onTap: () {
                                setState(() {
                                  tap = 1;
                                });
                                _PlayAnimation();
                                return tap;
                              },
                              child: buttonBlackBottom(),
                            )
                          : LoginAnimation(
                              animationController: sanimationController.view,
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

/// textfromfield custom class
class textFromField extends StatelessWidget {
  bool password;
  String email;
  IconData icon;
  TextInputType inputType;

  textFromField({this.email, this.icon, this.inputType, this.password});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        height: 60.0,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            color: Colors.white.withOpacity(0.7),
            boxShadow: [BoxShadow(blurRadius: 10.0, color: Colors.black12)]),
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal * 4,
            vertical: SizeConfig.safeBlockVertical),
        child: Theme(
          data: ThemeData(
            hintColor: Colors.transparent,
          ),
          child: TextFormField(
            obscureText: password,
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: email,
                icon: Icon(
                  icon,
                  color: Colors.black38,
                ),
                labelStyle: TextStyle(
                    fontSize: SizeConfig.safeBlockVertical * 2.5,
                    fontFamily: 'Sans',
                    letterSpacing: 0.3,
                    color: Colors.black38,
                    fontWeight: FontWeight.w600)),
            keyboardType: inputType,
          ),
        ),
      ),
    );
  }
}

///ButtonBlack class
class buttonBlackBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Container(
        height: 55.0,
        width: 600.0,
        child: Text(
          AppTranslations.of(context).currentLanguage == "ar"
              ? "تسجيل حساب"
              : "Sign Up",
          style: TextStyle(
              color: Colors.white,
              letterSpacing: 0.2,
              fontFamily: "Sans",
              fontSize: 18.0,
              fontWeight: FontWeight.w800),
        ),
        alignment: FractionalOffset.center,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 15.0)],
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(colors: <Color>[
              AppColors.primaryColor,
              AppColors.secondaryColor
            ])),
      ),
    );
  }
}
