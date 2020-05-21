import 'package:vanilla/configs/app_colors.dart';
import 'package:vanilla/local/app_translation.dart';
import 'package:vanilla/model/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class searchAppbar extends StatefulWidget {
  @override
  _searchAppbarState createState() => _searchAppbarState();
}

class _searchAppbarState extends State<searchAppbar> {
  /// Popular Keyword Item
  var _sugestedText = Container(
    height: 145.0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20.0),
          child: Text(
            "Populer Keyword",
            style: TextStyle(fontFamily: "Gotik", color: Colors.black26),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 20.0)),
        Expanded(
            child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 20.0)),
            KeywordItem(
              title: "Iphone X",
              title2: "Mackbook",
            ),
            KeywordItem(
              title: "Samsung",
              title2: "Apple",
            ),
            KeywordItem(
              title: "Note 9",
              title2: "Nevada",
            ),
            KeywordItem(
              title: "Watch",
              title2: "PC",
            ),
          ],
        ))
      ],
    ),
  );

  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
        builder: (BuildContext ctx, Store<AppState> store) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Color(0xFF6991C7),
          ),
          title: Text(
            AppTranslations.of(ctx).currentLanguage == "ar" ? "بحث" : "Search",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
                color: Colors.black54,
                fontFamily: "Gotik"),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /// Caliing a variable
                  Padding(
                    padding: const EdgeInsets.only(right: 50.0, left: 20.0),
                    child: Text(
                      AppTranslations.of(ctx).currentLanguage == "ar"
                          ? "أهلا ، أنا فانيلا\nهل تريد البحث ؟"
                          : "Hello, i am Vanilla. What would you like to search ?",
                      style: TextStyle(
                          letterSpacing: 0.1,
                          fontWeight: FontWeight.w600,
                          fontSize: 27.0,
                          color: Colors.black54,
                          fontFamily: "Gotik"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 35.0, right: 20.0, left: 20.0),
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 15.0,
                                spreadRadius: 0.0)
                          ]),
                      child: Center(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 10.0),
                          child: Theme(
                            data: ThemeData(hintColor: Colors.transparent),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.search,
                                    color: Color(0xFF6991C7),
                                    size: 28.0,
                                  ),
                                  hintText:
                                      AppTranslations.of(ctx).currentLanguage ==
                                              "ar"
                                          ? "ماذا تريد ؟"
                                          : "what do you want?",
                                  hintStyle: TextStyle(
                                      color: Colors.black54,
                                      fontFamily: "Gotik",
                                      fontWeight: FontWeight.w400)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
//                _sugestedText,
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      height: 250.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              AppTranslations.of(ctx).currentLanguage == "ar"
                                  ? "المفضلة"
                                  : "Favorite",
                              style: TextStyle(
                                  fontFamily: "Gotik", color: Colors.black26),
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              padding: EdgeInsets.only(top: 20.0, bottom: 2.0),
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                /// Get class FavoriteItem
                                Padding(padding: EdgeInsets.only(left: 20.0)),
                                FavoriteItem(
                                  image: "assets/img/img4.png",
                                  title: "Amouage Dia",
                                  Salary: "\$ 10",
                                  Rating: "4.8",
                                  sale: "923 Sale",
                                ),
                                Padding(padding: EdgeInsets.only(left: 20.0)),
                                FavoriteItem(
                                  image: "assets/img/img6.png",
                                  title: "Reve D'Infini",
                                  Salary: "\$ 42",
                                  Rating: "4.2",
                                  sale: "892 Sale",
                                ),
                                Padding(padding: EdgeInsets.only(left: 20.0)),
                                FavoriteItem(
                                  image: "assets/img/img7.png",
                                  title: "Gucci Guilty",
                                  Salary: "\$ 30",
                                  Rating: "4.8",
                                  sale: "110 Sale",
                                ),
                                Padding(padding: EdgeInsets.only(right: 10.0)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0, top: 2.0))
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

/// Popular Keyword Item class
class KeywordItem extends StatelessWidget {
  @override
  String title, title2;

  KeywordItem({this.title, this.title2});

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 3.0),
          child: Container(
            height: 29.5,
            width: 90.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4.5,
                  spreadRadius: 1.0,
                )
              ],
            ),
            child: Center(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black54, fontFamily: "Sans"),
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 15.0)),
        Container(
          height: 29.5,
          width: 90.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4.5,
                spreadRadius: 1.0,
              )
            ],
          ),
          child: Center(
            child: Text(
              title2,
              style: TextStyle(
                color: Colors.black54,
                fontFamily: "Sans",
              ),
            ),
          ),
        ),
      ],
    );
  }
}

///Favorite Item Card
class FavoriteItem extends StatelessWidget {
  String image, Rating, Salary, title, sale;

  FavoriteItem({this.image, this.Rating, this.Salary, this.title, this.sale});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 2.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF656565).withOpacity(0.15),
                blurRadius: 4.0,
                spreadRadius: 1.0,
//           offset: Offset(4.0, 10.0)
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
                  height: 120.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7.0),
                          topRight: Radius.circular(7.0)),
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.cover)),
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    title,
                    style: TextStyle(
                        letterSpacing: 0.5,
                        color: Colors.black54,
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w500,
                        fontSize: 13.0),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 1.0)),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    Salary,
                    style: TextStyle(
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            Rating,
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
                        sale,
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
      ),
    );
  }
}
