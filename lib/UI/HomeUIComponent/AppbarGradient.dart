import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vanilla/UI/HomeUIComponent/Search.dart';
import 'package:vanilla/configs/app_colors.dart';
import 'package:vanilla/local/app_translation.dart';
import 'package:vanilla/model/app_state.dart';

class AppbarGradient extends StatefulWidget {
  @override
  _AppbarGradientState createState() => _AppbarGradientState();
}

class _AppbarGradientState extends State<AppbarGradient> {
  String CountNotice = "4";

  /// Build Appbar in layout home
  @override
  Widget build(BuildContext context) {
    /// Create responsive height and padding
    final MediaQueryData media = MediaQuery.of(context);
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return StoreBuilder<AppState>(
        builder: (BuildContext ctx, Store<AppState> store) {
      /// Create component in appbar
      return Container(
        padding: EdgeInsets.only(top: statusBarHeight),
        height: 58.0 + statusBarHeight,
        decoration: BoxDecoration(

            /// gradient in appbar
            gradient: LinearGradient(
                colors: [
                  AppColors.primaryColor,
                  AppColors.secondaryColor,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            /// if user click shape white in appbar navigate to search layout
            InkWell(
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (_, __, ___) => searchAppbar(),

                    /// transtation duration in animation
                    transitionDuration: Duration(milliseconds: 500),

                    /// animation route to search layout
                    transitionsBuilder:
                        (_, Animation<double> animation, __, Widget child) {
                      return Opacity(
                        opacity: animation.value,
                        child: child,
                      );
                    }));
              },

              /// Create shape background white in appbar (background treva shop text)
              child: Container(
                height: 37.0,
                width: 250.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    shape: BoxShape.rectangle),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 17.0)),
                    Image.asset(
                      "assets/img/search2.png",
                      height: 22.0,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                      left: 17.0,
                    )),
                    Padding(
                      padding: EdgeInsets.only(top: 3.0),
                      child: Text(
                        AppTranslations.of(ctx).currentLanguage == "ar"
                            ? "متجر فانيلا"
                            : "Vanilla Shop",
                        style: TextStyle(
                            fontFamily: "Popins",
                            color: Colors.black12,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.0,
                            fontSize: 16.4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              AppTranslations.of(ctx).currentLanguage == "ar"
                  ? "فانيلا"
                  : "Vanilla",
              style: TextStyle(
                  fontFamily: 'Berlin',
                  color: Colors.white,
                  letterSpacing: 0.0,
                  fontSize: 20),
            )
//          /// Icon chat (if user click navigate to chat layout)
//          InkWell(
//              onTap: () {
//                Navigator.of(context).push(
//                    PageRouteBuilder(pageBuilder: (_, __, ___) => new chat()));
//              },
//              child: Image.asset(
//                "assets/img/chat.png",
//                height: media.devicePixelRatio + 20.0,
//              )),
//
//          /// Icon notification (if user click navigate to notification layout)
//          InkWell(
//            onTap: () {
//              Navigator.of(context).push(PageRouteBuilder(
//                  pageBuilder: (_, __, ___) => new notification()));
//            },
//            child: Stack(
//              alignment: AlignmentDirectional(-3.0, -3.0),
//              children: <Widget>[
//                Image.asset(
//                  "assets/img/notifications-button.png",
//                  height: 24.0,
//                ),
//                CircleAvatar(
//                  radius: 8.6,
//                  backgroundColor: Colors.redAccent,
//                  child: Text(
//                    CountNotice,
//                    style: TextStyle(fontSize: 13.0, color: Colors.white),
//                  ),
//                )
//              ],
//            ),
//          ),
          ],
        ),
      );
    });
  }
}
