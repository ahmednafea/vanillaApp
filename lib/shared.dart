import 'package:redux/redux.dart';

import 'model/app_state.dart';

class Shared {
  static String deviceToken;
  static Store<AppState> globalStore;
  static bool isFirstTime = true;

  static String savedLang;
}
