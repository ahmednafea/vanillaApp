import 'package:vanilla/model/app_state.dart';
import 'package:vanilla/reducer/home_reducer.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    homeState: homeReducer(state.homeState, action),
  );
}
