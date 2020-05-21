import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vanilla/actions/open_menu_screen_action.dart';
import 'package:vanilla/configs/app_colors.dart';
import 'package:vanilla/local/app_translation.dart';
import 'package:vanilla/model/BrandDataList.dart';
import 'package:vanilla/model/app_state.dart';

import '../../shared.dart';

class brandDetail extends StatefulWidget {
  @override

  /// Get data from BrandDataList.dart (List Item)
  /// Declare class
  final Brand brand;

  brandDetail(this.brand);

  _brandDetailState createState() => _brandDetailState(brand);
}

class _brandDetailState extends State<brandDetail> {
  /// set key for bottom sheet
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  /// Get data from BrandDataList.dart (List Item)
  /// Declare class
  final Brand brand;
  BuildContext ctx;

  _brandDetailState(this.brand);

  String notif = "Notifications";

  /// https://firebasestorage.googleapis.com/v0/b/beauty-look.appspot.com/o/Artboard%203.png?alt=media&token=dc7f4bf5-8f80-4f38-bb63-87aed9d59b95

  /// Custom text header for bottomSheet
  final _fontCostumSheetBotomHeader = TextStyle(
      fontFamily: "Berlin",
      color: Colors.black54,
      fontWeight: FontWeight.w600,
      fontSize: 16.0);

  /// Custom text for bottomSheet
  final _fontCostumSheetBotom = TextStyle(
      fontFamily: "Sans",
      color: Colors.black45,
      fontWeight: FontWeight.w400,
      fontSize: 16.0);

  /// Create Modal BottomSheet (SortBy)
  void _modalBottomSheetSort() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return SingleChildScrollView(
            child: new Container(
              height: 340.0,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  Text(
                      AppTranslations.of(ctx).currentLanguage == "ar"
                          ? "رتب بـ"
                          : "SORT BY",
                      style: _fontCostumSheetBotomHeader),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Container(
                    width: 500.0,
                    color: Colors.black26,
                    height: 0.5,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  InkWell(
                      onTap: () {
                        Shared.globalStore.dispatch(OpenMenuScreenAction());
                      },
                      child: Text(
                        AppTranslations.of(ctx).currentLanguage == "ar"
                            ? "الشهرة"
                            : "Popularity",
                        style: _fontCostumSheetBotom,
                      )),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    AppTranslations.of(ctx).currentLanguage == "ar"
                        ? "الأجدد"
                        : "New",
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    AppTranslations.of(ctx).currentLanguage == "ar"
                        ? "التخفيض"
                        : "Discount",
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    AppTranslations.of(ctx).currentLanguage == "ar"
                        ? "السعر : الأعلى -> الأقل"
                        : "Price: High-Low",
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    AppTranslations.of(ctx).currentLanguage == "ar"
                        ? "السعر : الأقل -> الأعلى"
                        : "Price: Log-High",
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                ],
              ),
            ),
          );
        });
  }

  /// Create Modal BottomSheet (RefineBy)
  void _modalBottomSheetFilter() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return SingleChildScrollView(
            child: new Container(
              height: 340.0,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  Text(
                      AppTranslations.of(ctx).currentLanguage == "ar"
                          ? "فلتر بـ"
                          : "SORT BY",
                      style: _fontCostumSheetBotomHeader),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Container(
                    width: 500.0,
                    color: Colors.black26,
                    height: 0.5,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  InkWell(
                      onTap: () {
                        Shared.globalStore.dispatch(OpenMenuScreenAction());
                      },
                      child: Text(
                        AppTranslations.of(ctx).currentLanguage == "ar"
                            ? "الشهرة"
                            : "Popularity",
                        style: _fontCostumSheetBotom,
                      )),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    AppTranslations.of(ctx).currentLanguage == "ar"
                        ? "الأجدد"
                        : "New",
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    AppTranslations.of(ctx).currentLanguage == "ar"
                        ? "التخفيض"
                        : "Discount",
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    AppTranslations.of(ctx).currentLanguage == "ar"
                        ? "السعر : الأعلى -> الأقل"
                        : "Price: High-Low",
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    AppTranslations.of(ctx).currentLanguage == "ar"
                        ? "السعر : الأقل -> الأعلى"
                        : "Price: Log-High",
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    /// Hero animation for image
    final hero = Hero(
      tag: 'hero-tag-${brand.id}',
      child: new DecoratedBox(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: new AssetImage(brand.img),
          ),
          shape: BoxShape.rectangle,
        ),
        child: Container(
          margin: EdgeInsets.only(top: 130.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[
                  new Color(0x00FFFFFF),
                  new Color(0xFFFFFFFF),
                ],
                stops: [
                  0.0,
                  1.0
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(0.0, 1.0)),
          ),
        ),
      ),
    );
    return StoreBuilder<AppState>(
        builder: (BuildContext ctx, Store<AppState> store) {
      this.ctx = ctx;
      return Scaffold(
        key: _key,
        body: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            /// Appbar Custom using a SliverAppBar
            SliverAppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
              expandedHeight: 380.0,
              elevation: 0.1,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    brand.name,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 17.0,
                        fontFamily: "Popins",
                        fontWeight: FontWeight.w700),
                  ),
                  background: Material(
                    child: hero,
                  )),
            ),

            /// Container for description to Sort and Refine
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 300.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30.0, left: 20.0, right: 20.0),
                              child: Text(
                                brand.desc,
                                style: TextStyle(
                                    fontFamily: "Popins",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.0,
                                    color: Colors.black54),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 40.0)),
//                            buttonCustom(
//                              color: Colors.blue,
//                              txt: "Message",
//                              ontap: () {
//                                Navigator.of(context).push(PageRouteBuilder(
//                                    pageBuilder: (_, __, ___) =>
//                                        new privatemessage(brand)));
//                              },
//                            ),
//                            Padding(padding: EdgeInsets.only(top: 10.0)),
//                            buttonCustom(
//                              color: Colors.indigoAccent,
//                              txt: notif,
//                              ontap: () {
//                                var snackBar = SnackBar(
//                                  content: Text(brand.name + " Notificated"),
//                                  action: SnackBarAction(
//                                      label: "Undo",
//                                      onPressed: () {
//                                        setState(() {
//                                          if (notif == "Notifications") {
//                                            notif = "Notificated";
//                                          } else {
//                                            (notif = "Notifications");
//                                          }
//                                        });
//                                      }),
//                                );
//                                setState(() {
//                                  if (notif == "Notifications") {
//                                    notif = "Notificated";
//                                  } else {
//                                    (notif = "Notifications");
//                                  }
//                                });
//                                _key.currentState.showSnackBar(snackBar);
//                              },
//                            )
                          ],
                        ),
                      ),
//                    Padding(padding: EdgeInsets.only(top: 15.0)),
                      Container(
                        height: 50.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12.withOpacity(0.1),
                                blurRadius: 1.0,
                                spreadRadius: 1.0),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InkWell(
                              onTap: _modalBottomSheetSort,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(Icons.arrow_drop_down),
                                  Padding(
                                      padding: EdgeInsets.only(right: 10.0)),
                                  Text(
                                    AppTranslations.of(ctx).currentLanguage ==
                                            "ar"
                                        ? "ترتيب"
                                        : "Sort",
                                    style: _fontCostumSheetBotomHeader,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  height: 45.9,
                                  width: 1.0,
                                  decoration:
                                      BoxDecoration(color: Colors.black12),
                                )
                              ],
                            ),
                            InkWell(
                              onTap: _modalBottomSheetFilter,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(Icons.arrow_drop_down),
                                  Padding(padding: EdgeInsets.only(right: 0.0)),
                                  Text(
                                    AppTranslations.of(ctx).currentLanguage ==
                                            "ar"
                                        ? "فلترة"
                                        : "Filter",
                                    style: _fontCostumSheetBotomHeader,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// Create Grid Item
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF656565).withOpacity(0.15),
                            blurRadius: 4.0,
                            spreadRadius: 1.0,
                          )
                        ]),
                    child: Wrap(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              height: mediaQueryData.size.height / 3.5,
                              width: 200.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(7.0),
                                      topRight: Radius.circular(7.0)),
                                  image: DecorationImage(
                                      image: AssetImage(brand.item.itemImg),
                                      fit: BoxFit.cover)),
                            ),
                            Padding(padding: EdgeInsets.only(top: 7.0)),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0),
                              child: Text(
                                brand.item.itemName,
                                style: TextStyle(
                                    letterSpacing: 0.5,
                                    color: Colors.black54,
                                    fontFamily: "Sans",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.0),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 1.0)),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0),
                              child: Text(
                                brand.item.itemPrice,
                                style: TextStyle(
                                    fontFamily: "Sans",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0, top: 5.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        brand.item.itemRatting,
                                        style: TextStyle(
                                            fontFamily: "Sans",
                                            color: Colors.black26,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.0),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: AppColors.secondaryColor,
                                        size: 14.0,
                                      )
                                    ],
                                  ),
                                  Text(
                                    brand.item.itemSale,
                                    style: TextStyle(
                                        fontFamily: "Sans",
                                        color: Colors.black26,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.0),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                childCount: 20,
              ),

              /// Setting Size for Grid Item
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250.0,
                mainAxisSpacing: 7.0,
                crossAxisSpacing: 7.0,
                childAspectRatio: 0.605,
              ),
            ),
          ],
        ),
      );
    });
  }
}

/// Class For Botton Custom
class buttonCustom extends StatelessWidget {
  String txt;
  Color color;
  GestureTapCallback ontap;

  buttonCustom({this.txt, this.color, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 45.0,
        width: 300.0,
        decoration: BoxDecoration(
          color: color,
        ),
        child: Center(
            child: Text(
          txt,
          style: TextStyle(color: Colors.white, fontFamily: "Sans"),
        )),
      ),
    );
  }
}
