import 'dart:async';

import 'package:vanilla/actions/open_home_screen_action.dart';
import 'package:vanilla/actions/open_login_screen_action.dart';
import 'package:vanilla/actions/open_signup_screen_action.dart';
import 'package:vanilla/configs/app_colors.dart';
import 'package:vanilla/configs/size_config.dart';
import 'package:vanilla/local/app_translation.dart';
import 'package:vanilla/model/app_state.dart';
import 'package:vanilla/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ChoseLogin extends StatefulWidget {
  @override
  _ChoseLoginState createState() => _ChoseLoginState();
}

/// Component Widget this layout UI
class _ChoseLoginState extends State<ChoseLogin> with TickerProviderStateMixin {
  /// Declare Animation
  AnimationController animationController;
  var tapLogin = 0;
  var tapSignup = 0;
  @override
  void initState() {
    super.initState();
    setState(() {
      Shared.isFirstTime = false;
    });
  }

  /// To dispose animation controller
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
    // TODO: implement dispose
  }

  /// Playanimation set forward reverse
  Future<Null> _Playanimation() async {
    try {
      await animationController.forward();
      await animationController.reverse();
    } on TickerCanceled {}
  }

  /// Component Widget layout UI
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    mediaQuery.devicePixelRatio;
    mediaQuery.size.height;
    mediaQuery.size.width;
    return StoreBuilder<AppState>(onInit: (Store<AppState> store) async {
      animationController = AnimationController(
          vsync: this, duration: Duration(milliseconds: 200))
        ..addStatusListener((status) {
          if (status == AnimationStatus.dismissed) {
            setState(() {
              tapLogin = 0;
              tapSignup = 0;
            });
          }
        });
    }, builder: (BuildContext ctx, Store<AppState> store) {
      SizeConfig().init(ctx);
      return Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: Stack(
          children: <Widget>[
            Image.asset("assets/img/SliderLogin4.png",
                fit: BoxFit.contain,
                height: mediaQuery.size.height,
                width: mediaQuery.size.width),
            Container(
              child: Container(
                /// Set gradient color in image (Click to open code)
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                      Color.fromRGBO(0, 0, 0, 0.4),
                      Color.fromRGBO(0, 0, 0, 0.6)
                    ],
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter)),

                /// Set component layout
                child: ListView(
                  padding: EdgeInsets.all(0.0),
                  children: <Widget>[
                    Container(
                      alignment: AlignmentDirectional.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: mediaQuery.padding.top + 50.0),
                          ),
                          Center(

                              /// Animation text treva shop accept from splashscreen layout (Click to open code)
                              child: Image.asset(
                            "assets/img/title_only.png",
                            width: 240,
                            color: Colors.white,
                          )),
                          Padding(
                            padding: EdgeInsets.only(
                                top: SizeConfig.safeBlockVertical * 6,
                                bottom: SizeConfig.safeBlockVertical * 16),
                            child: Text(
                              AppTranslations.of(ctx).currentLanguage == "ar"
                                  ? "أحصل على أفضل المنتجات فى فانيلا"
                                  : "Get best product in vanilla",
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "Sans",
                                  letterSpacing: 1.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        /// To create animation if user tap == animation play (Click to open code)
                        tapLogin == 0
                            ? Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: AppColors.secondaryColor,
                                  onTap: () {
                                    setState(() {
                                      tapLogin = 1;
                                    });
                                    _Playanimation();
                                    return tapLogin;
                                  },
                                  child: ButtonCustom(
                                      txt: AppTranslations.of(ctx)
                                                  .currentLanguage ==
                                              "ar"
                                          ? "تسجيل حساب"
                                          : "Signup"),
                                ),
                              )
                            : AnimationSplashSignUp(
                                animationController: animationController.view,
                              ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.safeBlockVertical * 4),
                            child: InkWell(
                              onTap: () {
                                store.dispatch(OpenHomeScreenAction());
                              },
                              child: Text(
                                AppTranslations.of(ctx).currentLanguage == "ar"
                                    ? "أو تخطى"
                                    : "OR SKIP",
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w100,
                                    fontFamily: "Sans",
                                    fontSize: 15.0),
                              ),
                            ),
                          ),
                        ),
                        tapSignup == 0
                            ? Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: AppColors.secondaryColor,
                                  onTap: () {
                                    setState(() {
                                      tapSignup = 1;
                                    });
                                    _Playanimation();
                                    return tapSignup;
                                  },
                                  child: ButtonCustom(
                                      txt: AppTranslations.of(ctx)
                                                  .currentLanguage ==
                                              "ar"
                                          ? "تسجيل الدخول"
                                          : "Login"),
                                ),
                              )
                            : AnimationSplashLogin(
                                animationController: animationController.view,
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

/// Button Custom widget
class ButtonCustom extends StatelessWidget {
  @override
  String txt;
  GestureTapCallback ontap;

  ButtonCustom({this.txt});

  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: AppColors.primaryColor,
        child: LayoutBuilder(builder: (context, constraint) {
          return Container(
            width: 300.0,
            height: 52.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.transparent,
                border: Border.all(color: AppColors.secondaryColor)),
            child: Center(
                child: Text(
              txt,
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 19.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Sans",
                  letterSpacing: 0.5),
            )),
          );
        }),
      ),
    );
  }
}

/// Set Animation Login if user click button login
class AnimationSplashLogin extends StatefulWidget {
  AnimationSplashLogin({Key key, this.animationController})
      : animation = Tween(
          end: 900.0,
          begin: 70.0,
        ).animate(CurvedAnimation(
            parent: animationController, curve: Curves.fastOutSlowIn)),
        super(key: key);

  final AnimationController animationController;
  final Animation animation;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Padding(
      padding: EdgeInsets.only(bottom: 60.0),
      child: Container(
        height: animation.value,
        width: animation.value,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          shape: animation.value < 600 ? BoxShape.circle : BoxShape.rectangle,
        ),
      ),
    );
  }

  @override
  _AnimationSplashLoginState createState() => _AnimationSplashLoginState();
}

/// Set Animation Login if user click button login
class _AnimationSplashLoginState extends State<AnimationSplashLogin> {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(onInit: (Store<AppState> store) {
      widget.animationController.addListener(() {
        if (widget.animation.isCompleted) {
          Shared.globalStore.dispatch(OpenLoginScreenAction());
        }
      });
    }, builder: (BuildContext ctx, Store<AppState> store) {
      return AnimatedBuilder(
        animation: widget.animationController,
        builder: widget._buildAnimation,
      );
    });
  }
}

/// Set Animation signup if user click button signup
class AnimationSplashSignUp extends StatefulWidget {
  AnimationSplashSignUp({Key key, this.animationController})
      : animation = Tween(
          end: 900.0,
          begin: 70.0,
        ).animate(CurvedAnimation(
            parent: animationController, curve: Curves.fastOutSlowIn)),
        super(key: key);

  final AnimationController animationController;
  final Animation animation;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Padding(
      padding: EdgeInsets.only(bottom: 60.0),
      child: Container(
        height: animation.value,
        width: animation.value,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          shape: animation.value < 600 ? BoxShape.circle : BoxShape.rectangle,
        ),
      ),
    );
  }

  @override
  _AnimationSplashSignUpState createState() => _AnimationSplashSignUpState();
}

/// Set Animation signup if user click button signup
class _AnimationSplashSignUpState extends State<AnimationSplashSignUp> {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(onInit: (Store<AppState> store) {
      widget.animationController.addListener(() {
        if (widget.animation.isCompleted) {
          Shared.globalStore.dispatch(OpenSignUpScreenAction());
        }
      });
    }, builder: (BuildContext ctx, Store<AppState> store) {
      return AnimatedBuilder(
        animation: widget.animationController,
        builder: widget._buildAnimation,
      );
    });
  }
}
