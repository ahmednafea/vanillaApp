import 'package:flutter/material.dart';
import 'package:vanilla/UI/LoginOrSignup/Login.dart';

import 'UI/AcountUIComponent/AboutApps.dart';
import 'UI/AcountUIComponent/MyOrders.dart';
import 'UI/AcountUIComponent/SettingAcount.dart';
import 'UI/BottomNavigationBar.dart';
import 'UI/CartUIComponent/CartLayout.dart';
import 'UI/CartUIComponent/Delivery.dart';
import 'UI/CartUIComponent/Payment.dart';
import 'UI/HomeUIComponent/Home.dart';
import 'UI/HomeUIComponent/PromotionDetail.dart';
import 'UI/HomeUIComponent/ReviewLayout.dart';
import 'UI/HomeUIComponent/Search.dart';
import 'UI/LoginOrSignup/ChoseLoginOrSignup.dart';
import 'UI/LoginOrSignup/Signup.dart';

Map<String, WidgetBuilder> _routes;

Map<String, WidgetBuilder> routes() {
  if (_routes == null) {
    _routes = {
      "PreLoginScreen": (context) => ChoseLogin(),
      "LoginScreen": (context) => loginScreen(),
      "SignUpScreen": (context) => Signup(),
      "HomeScreen": (context) => bottomNavigationBar(),
      "PaymentScreen": (context) => payment(),
      "PromotionDetailsScreen": (context) => promoDetail(),
      "SearchAppbarScreen": (context) => searchAppbar(),
      "DeliveryScreen": (context) => delivery(),
      "CartScreen": (context) => cart(),
      "AboutAppsScreen": (context) => aboutApps(),
      "MenuScreen": (context) => Menu(),
      "AllReviewsScreen": (context) => ReviewsAll(),
      "AccountSettingScreen": (context) => settingAcount(),
      "MyOrdersScreen": (context) => order()
    };
  }
  return _routes;
}
