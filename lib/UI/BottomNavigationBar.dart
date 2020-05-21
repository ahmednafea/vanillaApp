import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vanilla/UI/AcountUIComponent/Profile.dart';
import 'package:vanilla/UI/BrandUIComponent/BrandLayout.dart';
import 'package:vanilla/UI/CartUIComponent/CartLayout.dart';
import 'package:vanilla/UI/HomeUIComponent/Home.dart';
import 'package:vanilla/configs/app_colors.dart';
import 'package:vanilla/local/app_translation.dart';
import 'package:vanilla/model/app_state.dart';

class bottomNavigationBar extends StatefulWidget {
  @override
  _bottomNavigationBarState createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
  int currentIndex = 0;

  /// Set a type current number a layout class
  Widget callPage(int current) {
    switch (current) {
      case 0:
        return Menu();
      case 1:
        return brand();
      case 2:
        return cart();
      case 3:
        return profil();
        break;
      default:
        return Menu();
    }
  }

  /// Build BottomNavigationBar Widget
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
        builder: (BuildContext ctx, Store<AppState> store) {
      return Scaffold(
        body: callPage(currentIndex),
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: AppColors.secondaryColor,
                textTheme: Theme.of(context).textTheme.copyWith(
                    caption:
                        TextStyle(color: Colors.black26.withOpacity(0.15)))),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              fixedColor: Colors.white,
              onTap: (value) {
                currentIndex = value;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: 23.0,
                    ),
                    title: Text(
                      AppTranslations.of(ctx).currentLanguage == "ar"
                          ? "الرئيسية"
                          : "Home",
                      style:
                          TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shop),
                    title: Text(
                      AppTranslations.of(ctx).currentLanguage == "ar"
                          ? "علامات تجارية"
                          : "Brand",
                      style:
                          TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    title: Text(
                      AppTranslations.of(ctx).currentLanguage == "ar"
                          ? "عربة التسوق"
                          : "Cart",
                      style:
                          TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      size: 24.0,
                    ),
                    title: Text(
                      AppTranslations.of(ctx).currentLanguage == "ar"
                          ? "الحساب"
                          : "Acount",
                      style:
                          TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
                    )),
              ],
            )),
      );
    });
  }
}
