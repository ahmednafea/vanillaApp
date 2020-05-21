import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vanilla/UI/BrandUIComponent/BrandDetail.dart';
import 'package:vanilla/actions/open_search_appbar_screen_action.dart';
import 'package:vanilla/local/app_translation.dart';
import 'package:vanilla/model/BrandDataList.dart';
import 'package:vanilla/model/app_state.dart';

import '../../shared.dart';

class brand extends StatefulWidget {
  @override
  _brandState createState() => _brandState();
}

class _brandState extends State<brand> {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
        builder: (BuildContext ctx, Store<AppState> store) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFFFFFFFF),
              elevation: 0.0,
              title: Padding(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Text(
                  AppTranslations.of(ctx).currentLanguage == "ar"
                      ? "العلامات التجارية"
                      : "Brands",
                  style: TextStyle(
                      fontFamily: "Gotik",
                      fontSize: 20.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w700),
                ),
              ),
              actions: <Widget>[
                InkWell(
                  onTap: () {
                    Shared.globalStore.dispatch(OpenSearchAppbarScreenAction());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Icon(
                      Icons.search,
                      size: 27.0,
                      color: Colors.black54,
                    ),
                  ),
                )
              ],
            ),
            body: Container(
              color: Colors.white,
              child: CustomScrollView(
                /// Create List Menu
                slivers: <Widget>[
                  SliverPadding(
                    padding: EdgeInsets.only(top: 0.0),
                    sliver: SliverFixedExtentList(
                        itemExtent: 145.0,
                        delegate: SliverChildBuilderDelegate(

                            /// Calling itemCard Class for constructor card
                            (context, index) => itemCard(brandData[index]),
                            childCount: brandData.length)),
                  ),
                ],
              ),
            )),
      );
    });
  }
}

/// Constructor for itemCard for List Menu
class itemCard extends StatelessWidget {
  /// Declaration and Get data from BrandDataList.dart
  final Brand brand;

  itemCard(this.brand);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
                pageBuilder: (_, __, ___) => new brandDetail(brand),
                transitionDuration: Duration(milliseconds: 500),
                transitionsBuilder:
                    (_, Animation<double> animation, __, Widget child) {
                  return Opacity(
                    opacity: animation.value,
                    child: child,
                  );
                }),
          );
        },
        child: Container(
          height: 130.0,
          width: 400.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          child: Hero(
            tag: 'hero-tag-${brand.id}',
            child: Material(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  image: DecorationImage(
                      image: AssetImage(brand.img), fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFABABAB).withOpacity(0.3),
                      blurRadius: 1.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Colors.black12.withOpacity(0.4),
                  ),
                  child: Center(
                    child: Text(
                      brand.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Berlin",
                        fontSize: 35.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
