import 'package:meta/meta.dart';
import 'package:vanilla/model/home_state.dart';

@immutable
class AppState {
  final bool isLoading;
  final HomeState homeState;
  AppState({this.isLoading = false, this.homeState});
}
