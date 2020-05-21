import 'package:vanilla/actions/fetch_search_data_action.dart';
import 'package:vanilla/actions/fill_home_data_action.dart';
import 'package:vanilla/model/home_state.dart';

HomeState homeReducer(HomeState state, action) {
  if (action is FillHomeDataAction) {
    return state.copyWith(
        categories: action.homeData.categories,
        banners: action.homeData.banners,
        sliders: action.homeData.sliders);
  } else if (action is FetchSearchDataAction) {
    state.searchData = [];
    return state.copyWith(searchData: action.data);
  }
  return state;
}
