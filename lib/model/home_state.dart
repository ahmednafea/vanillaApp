import 'package:vanilla/model/models.dart';
import 'package:vanilla/model/search_response.dart';

class HomeState {
  List<Slider> sliders;
  List<Category> categories;
  List<BannerElement> banners;
  List<ProductModel> searchData;

  HomeState({this.sliders, this.categories, this.banners, this.searchData});

  HomeState copyWith(
      {List<Slider> sliders,
      List<Category> categories,
      List<BannerElement> banners,
      List<ProductModel> searchData}) {
    return HomeState(
        sliders: sliders ?? this.sliders,
        banners: banners ?? this.banners,
        categories: categories ?? this.categories,
        searchData: searchData ?? this.searchData);
  }
}
