import 'dart:async';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:vanilla/actions/fetch_home_content_action.dart';
import 'package:vanilla/actions/fetch_search_data_action.dart';
import 'package:vanilla/actions/fill_home_data_action.dart';
import 'package:vanilla/actions/open_home_screen_action.dart';
import 'package:vanilla/actions/search_for_product_action.dart';
import 'package:vanilla/apis/home_api.dart';
import 'package:vanilla/apis/search_api.dart';
import 'package:vanilla/configs/app_colors.dart';
import 'package:vanilla/local/app_translation.dart';
import 'package:vanilla/model/app_state.dart';

homeMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is FetchHomeContentAction) {
    getHomeData(action.ctx).then((value) {
      if (value != null) {
        store.dispatch(FillHomeDataAction(homeData: value));
        Timer(Duration(seconds: 2), () {
          store.dispatch(OpenHomeScreenAction());
        });
      } else {
        showDialog(
            context: action.ctx,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: AppColors.primaryColor, width: 2)),
                title: Text(
                  AppTranslations.of(context).text("error"),
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      AppTranslations.of(context).currentLanguage == "ar"
                          ? "حدث خطأ أثناء التحميل\nيرجى التحقق من اتصالك بالإنترنت وإعادة المحاولة."
                          : "An error occurred during loading\nplease check your internet connection and try again.",
                      textAlign: TextAlign.center,
                    ),
                    FlatButton(
                      child: Text(
                        "محاولة مرة أخرى",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.secondaryColor, fontSize: 20),
                      ),
                      onPressed: () {
                        store.dispatch(FetchHomeContentAction(ctx: action.ctx));
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              );
            });
      }
    });
  } else if (action is SearchForProductAction) {
    getSearchData(action.context, action.word).then((val) {
      store.dispatch(FetchSearchDataAction(data: val.products));
    });
  }
  next(action);
}
