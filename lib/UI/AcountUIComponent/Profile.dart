import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vanilla/actions/open_about_screen_action.dart';
import 'package:vanilla/actions/open_account_setting_screen_action.dart';
import 'package:vanilla/actions/open_my_orders_screen_action.dart';
import 'package:vanilla/local/app_translation.dart';
import 'package:vanilla/middleware/navigation_key.dart';
import 'package:vanilla/model/app_state.dart';

import 'edit_profile.dart';

class profil extends StatefulWidget {
  @override
  _profilState createState() => _profilState();
}

/// Custom Font
var _txt = TextStyle(
  color: Colors.black,
  fontFamily: "Sans",
);

/// Get _txt and custom value of Variable for Name User
var _txtName = _txt.copyWith(fontWeight: FontWeight.w700, fontSize: 17.0);

/// Get _txt and custom value of Variable for Edit text
var _txtEdit = _txt.copyWith(color: Colors.black26, fontSize: 15.0);

/// Get _txt and custom value of Variable for Category Text
var _txtCategory = _txt.copyWith(
    fontSize: 14.5, color: Colors.black54, fontWeight: FontWeight.w500);

class _profilState extends State<profil> {
  @override
  Widget build(BuildContext context) {
    /// Declare MediaQueryData
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return StoreBuilder<AppState>(
        builder: (BuildContext ctx, Store<AppState> store) {
      return SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              /// Setting Header Banner
              Container(
                height: 240.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/img/headerProfile.png"),
                        fit: BoxFit.cover)),
              ),

              /// Calling _profile variable
              Padding(
                padding: EdgeInsets.only(
                  top: 185.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white, width: 2.5),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/img/womanface.jpg"))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            "Alisa Heart",
                            style: _txtName,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            navigatorKey.currentState.push(MaterialPageRoute(
                                builder: (context) => EditProfile()));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.edit,
                                    size: 18, color: Colors.black26),
                                VerticalDivider(
                                  width: 5,
                                ),
                                Text(
                                  AppTranslations.of(ctx).currentLanguage ==
                                          "ar"
                                      ? "تعديل البيانات"
                                      : "Edit Profile",
                                  style: _txtEdit,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 360.0),
                child: Column(
                  /// Setting Category List
                  children: <Widget>[
                    /// Call category class
//                  category(
//                    txt: "Notification",
//                    padding: 35.0,
//                    image: "assets/icon/notification.png",
//                    tap: () {
//                      Navigator.of(context).push(PageRouteBuilder(
//                          pageBuilder: (_, __, ___) => new notification()));
//                    },
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.only(
//                        top: 20.0, left: 85.0, right: 30.0),
//                    child: Divider(
//                      color: Colors.black12,
//                      height: 2.0,
//                    ),
//                  ),
//                  category(
//                    txt: "Payments",
//                    padding: 35.0,
//                    image: "assets/icon/creditAcount.png",
//                    tap: () {
//                      Navigator.of(context).push(PageRouteBuilder(
//                          pageBuilder: (_, __, ___) =>
//                              new creditCardSetting()));
//                    },
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.only(
//                        top: 20.0, left: 85.0, right: 30.0),
//                    child: Divider(
//                      color: Colors.black12,
//                      height: 2.0,
//                    ),
//                  ),
//                  category(
//                    txt: "Message",
//                    padding: 26.0,
//                    image: "assets/icon/chat.png",
//                    tap: () {
//                      Navigator.of(context).push(PageRouteBuilder(
//                          pageBuilder: (_, __, ___) => new chat()));
//                    },
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.only(
//                        top: 20.0, left: 85.0, right: 30.0),
//                    child: Divider(
//                      color: Colors.black12,
//                      height: 2.0,
//                    ),
//                  ),
                    category(
                      txt: AppTranslations.of(ctx).currentLanguage == "ar"
                          ? "طلباتى"
                          : "My Orders",
                      padding: 23.0,
                      image: "assets/icon/truck.png",
                      tap: () {
                        store.dispatch(OpenMyOrdersScreenAction());
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 30.0, right: 30.0),
                      child: Divider(
                        color: Colors.black12,
                        height: 2.0,
                      ),
                    ),
                    category(
                      txt: AppTranslations.of(ctx).currentLanguage == "ar"
                          ? "إعدادات الحساب"
                          : "Setting Acount",
                      padding: 30.0,
                      image: "assets/icon/setting.png",
                      tap: () {
                        store.dispatch(OpenAccountSettingScreenAction());
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 30.0, right: 30.0),
                      child: Divider(
                        color: Colors.black12,
                        height: 2.0,
                      ),
                    ),
//                  category(
//                    txt: "Call Center",
//                    padding: 30.0,
//                    image: "assets/icon/callcenter.png",
//                    tap: () {
//                      Navigator.of(context).push(PageRouteBuilder(
//                          pageBuilder: (_, __, ___) => new callCenter()));
//                    },
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.only(
//                        top: 20.0, left: 85.0, right: 30.0),
//                    child: Divider(
//                      color: Colors.black12,
//                      height: 2.0,
//                    ),
//                  ),
                    category(
                      padding: 38.0,
                      txt: AppTranslations.of(ctx).currentLanguage == "ar"
                          ? "عن التطبيق"
                          : "About App",
                      image: "assets/icon/aboutapp.png",
                      tap: () {
                        store.dispatch(OpenAboutScreenAction());
                      },
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 20.0)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

/// Component category class to set list
class category extends StatelessWidget {
  @override
  String txt, image;
  GestureTapCallback tap;
  double padding;

  category({this.txt, this.image, this.tap, this.padding});

  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0, right: 30.0, left: 30.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: padding, right: padding),
                  child: Image.asset(
                    image,
                    height: 25.0,
                  ),
                ),
                Text(
                  txt,
                  style: _txtCategory,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
