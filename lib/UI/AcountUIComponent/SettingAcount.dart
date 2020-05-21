import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vanilla/local/app_translation.dart';
import 'package:vanilla/model/app_state.dart';

class settingAcount extends StatefulWidget {
  @override
  _settingAcountState createState() => _settingAcountState();
}

class _settingAcountState extends State<settingAcount> {
  static var _txtCustomHead = TextStyle(
    color: Colors.black54,
    fontSize: 17.0,
    fontWeight: FontWeight.w600,
    fontFamily: "Gotik",
  );

  static var _txtCustomSub = TextStyle(
    color: Colors.black38,
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
    fontFamily: "Gotik",
  );
  BuildContext ctx;
  String _appLang = "عربى";

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
        builder: (BuildContext ctx, Store<AppState> store) {
      this.ctx = ctx;
      return Scaffold(
        appBar: AppBar(
          title: Text(
            AppTranslations.of(ctx).currentLanguage == "ar"
                ? "إعدادات الحساب"
                : "Setting Acount",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
                color: Colors.black54,
                fontFamily: "Gotik"),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black54),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                setting(
                  head: AppTranslations.of(ctx).currentLanguage == "ar"
                      ? "الحساب"
                      : "Account",
                  sub1: AppTranslations.of(ctx).currentLanguage == "ar"
                      ? "العنوان"
                      : "Address",
                  sub2: AppTranslations.of(ctx).currentLanguage == "ar"
                      ? "الهاتف"
                      : "Telephone",
                  sub3: AppTranslations.of(ctx).currentLanguage == "ar"
                      ? "البريد الإلكترونى"
                      : "Email",
                ),
//              setting(
//                head: "Setting",
//                sub1: "Order Notifications",
//                sub2: "Discount Notifications",
//                sub3: "Credit Card",
//              ),
                ListTile(
                  title: Text(
                    AppTranslations.of(ctx).currentLanguage == "ar"
                        ? "اللغة"
                        : "Language",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: PopupMenuButton<int>(
                    child: ListTile(
                      leading: Icon(Icons.language),
                      title: Text(_appLang),
                      trailing: Icon(Icons.keyboard_arrow_down),
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: Text("عربى"),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text("English"),
                      ),
                    ],
                    onCanceled: () {
                      print("You have canceled the menu.");
                    },
                    elevation: 2,
                    offset: Offset(20, 80),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                    onSelected: (value) {
                      print("value:$value");
                      if (value == 1) {
                        setState(() {
                          _appLang = "عربى";
                          application.onLocaleChanged(
                              Locale(application.supportedLanguagesCodes[1]));
                        });
                      } else {
                        setState(() {
                          application.onLocaleChanged(
                              Locale(application.supportedLanguagesCodes[0]));
                          _appLang = "English";
                        });
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Container(
                    height: 50.0,
                    width: 1000.0,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 13.0, right: 20.0, left: 20.0, bottom: 15.0),
                      child: Text(
                        AppTranslations.of(ctx).currentLanguage == "ar"
                            ? "تسجيل الخروج"
                            : "Logout",
                        style: _txtCustomHead,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

class setting extends StatelessWidget {
  static var _txtCustomHead = TextStyle(
    color: Colors.black54,
    fontSize: 17.0,
    fontWeight: FontWeight.w600,
    fontFamily: "Gotik",
  );

  static var _txtCustomSub = TextStyle(
    color: Colors.black38,
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
    fontFamily: "Gotik",
  );

  String head, sub1, sub2, sub3;

  setting({this.head, this.sub1, this.sub2, this.sub3});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        height: 235.0,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0, top: 15.0),
                child: Text(
                  head,
                  style: _txtCustomHead,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Divider(
                  color: Colors.black12,
                  height: 0.5,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        sub1,
                        style: _txtCustomSub,
                      ),
                      Icon(
                        AppTranslations.of(context).currentLanguage == "ar"
                            ? Icons.keyboard_arrow_left
                            : Icons.keyboard_arrow_right,
                        color: Colors.black38,
                      )
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Divider(
                  color: Colors.black12,
                  height: 0.5,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        sub2,
                        style: _txtCustomSub,
                      ),
                      Icon(
                        AppTranslations.of(context).currentLanguage == "ar"
                            ? Icons.keyboard_arrow_left
                            : Icons.keyboard_arrow_right,
                        color: Colors.black38,
                      )
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Divider(
                  color: Colors.black12,
                  height: 0.5,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        sub3,
                        style: _txtCustomSub,
                      ),
                      Icon(
                        AppTranslations.of(context).currentLanguage == "ar"
                            ? Icons.keyboard_arrow_left
                            : Icons.keyboard_arrow_right,
                        color: Colors.black38,
                      )
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Divider(
                  color: Colors.black12,
                  height: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
