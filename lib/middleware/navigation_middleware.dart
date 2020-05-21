import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:vanilla/actions/open_about_screen_action.dart';
import 'package:vanilla/actions/open_account_setting_screen_action.dart';
import 'package:vanilla/actions/open_all_reviews_screen_action.dart';
import 'package:vanilla/actions/open_cart_screen_action.dart';
import 'package:vanilla/actions/open_delivery_screen_action.dart';
import 'package:vanilla/actions/open_home_screen_action.dart';
import 'package:vanilla/actions/open_login_screen_action.dart';
import 'package:vanilla/actions/open_menu_screen_action.dart';
import 'package:vanilla/actions/open_my_orders_screen_action.dart';
import 'package:vanilla/actions/open_payment_screen_action.dart';
import 'package:vanilla/actions/open_prelogin_screen_action.dart';
import 'package:vanilla/actions/open_promotion_details_screen_action.dart';
import 'package:vanilla/actions/open_search_appbar_screen_action.dart';
import 'package:vanilla/actions/open_signup_screen_action.dart';
import 'package:vanilla/model/app_state.dart';

import '../routes.dart';
import 'navigation_key.dart';

_route(String route, {bool isReplacement = false}) {
  Map<String, WidgetBuilder> r = routes();

  if (isReplacement == true) {
    navigatorKey.currentState.pushReplacementNamed(route);
  } else {
    navigatorKey.currentState.push(MaterialPageRoute(builder: r[route]));
  }
}

navigationMiddleware(Store<AppState> store, action, NextDispatcher next) {
  next(action);
  switch (action.runtimeType) {
    case OpenPreLoginScreenAction:
      _route("PreLoginScreen", isReplacement: true);
      break;
    case OpenLoginScreenAction:
      _route("LoginScreen", isReplacement: true);
      break;
    case OpenSignUpScreenAction:
      _route("SignUpScreen", isReplacement: true);
      break;
    case OpenHomeScreenAction:
      _route("HomeScreen", isReplacement: true);
      break;
    case OpenPaymentScreenAction:
      _route("PaymentScreen");
      break;
    case OpenPromotionDetailsScreenAction:
      _route("PromotionDetailsScreen");
      break;
    case OpenAboutScreenAction:
      _route("AboutAppsScreen");
      break;
    case OpenMenuScreenAction:
      _route("MenuScreen");
      break;
    case OpenAllReviewsScreenAction:
      _route("AllReviewsScreen");
      break;
    case OpenSearchAppbarScreenAction:
      _route("SearchAppbarScreen");
      break;
    case OpenDeliveryScreenAction:
      _route("DeliveryScreen");
      break;
    case OpenMyOrdersScreenAction:
      _route("MyOrdersScreen");
      break;
    case OpenCartScreenAction:
      _route("CartScreen");
      break;
    case OpenAccountSettingScreenAction:
      _route("AccountSettingScreen");
      break;
  }
}
