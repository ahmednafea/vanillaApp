import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vanilla/configs/app_colors.dart';
import 'package:vanilla/model/app_state.dart';
import 'package:vanilla/model/notificationsData.dart';

class notification extends StatefulWidget {
  @override
  _notificationState createState() => _notificationState();
}

class _notificationState extends State<notification> {
  final List<Post> items = [
    Post(
        image: "assets/img/Logo.png",
        id: 1,
        title: "Vanilla Shop",
        desc: "Thanks for downloaded Vanilla shop application"),
    Post(
        image: "assets/img/Logo.png",
        id: 2,
        title: "Vanilla Shop",
        desc: "Your Item Delivery"),
    Post(
        image: "assets/img/Logo.png",
        id: 3,
        title: "Vanilla Shop",
        desc: "Pending List Item Shoes"),
    Post(
        image: "assets/img/Logo.png",
        id: 4,
        title: "Vanilla Shop",
        desc: "Get 10% Discount for macbook pro 2018"),
  ];

  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return StoreBuilder<AppState>(
        builder: (BuildContext ctx, Store<AppState> store) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              "Notification",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                  color: Colors.black54,
                  fontFamily: "Gotik"),
            ),
            iconTheme: IconThemeData(color: Colors.black54),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.white,
          ),
          body: items.length > 0
              ? ListView.builder(
                  itemCount: items.length,
                  padding: const EdgeInsets.all(5.0),
                  itemBuilder: (context, position) {
                    return Dismissible(
                        key: Key(items[position].id.toString()),
                        onDismissed: (direction) {
                          setState(() {
                            items.removeAt(position);
                          });
                        },
                        background: Container(
                          color: AppColors.secondaryColor,
                        ),
                        child: Container(
                          height: 88.0,
                          child: Column(
                            children: <Widget>[
                              Divider(height: 5.0),
                              ListTile(
                                title: Text(
                                  '${items[position].title}',
                                  style: TextStyle(
                                      fontSize: 17.5,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 6.0),
                                  child: Container(
                                    width: 440.0,
                                    child: Text(
                                      '${items[position].desc}',
                                      style: new TextStyle(
                                          fontSize: 15.0,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.black38),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                leading: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 40.0,
                                      width: 40.0,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(60.0)),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  '${items[position].image}'),
                                              fit: BoxFit.cover)),
                                    )
                                  ],
                                ),
                                onTap: () =>
                                    _onTapItem(context, items[position]),
                              ),
                              Divider(height: 5.0),
                            ],
                          ),
                        ));
                  })
              : noItemNotifications());
    });
  }
}

void _onTapItem(BuildContext context, Post post) {
  Scaffold.of(context).showSnackBar(
      new SnackBar(content: new Text(post.id.toString() + ' - ' + post.title)));
}

class noItemNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      width: 500.0,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding:
                    EdgeInsets.only(top: mediaQueryData.padding.top + 100.0)),
            Image.asset(
              "assets/img/noNotification.png",
              height: 200.0,
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
            Text(
              "Not Have Notification",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.5,
                  color: Colors.black54,
                  fontFamily: "Gotik"),
            ),
          ],
        ),
      ),
    );
  }
}
