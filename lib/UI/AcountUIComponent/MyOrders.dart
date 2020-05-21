import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vanilla/configs/app_colors.dart';
import 'package:vanilla/local/app_translation.dart';
import 'package:vanilla/middleware/navigation_key.dart';
import 'package:vanilla/model/app_state.dart';
import 'package:vanilla/model/order_item.dart';

import 'order_details.dart';

class order extends StatefulWidget {
  @override
  _orderState createState() => _orderState();
}

class _orderState extends State<order> {
  static var _txtCustom = TextStyle(
    color: Colors.black54,
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
    fontFamily: "Gotik",
  );
  var orderList = List<Order>();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return StoreBuilder<AppState>(onInit: (Store<AppState> store) {
      orderList.add(Order(
          orderId: 123,
          orderStatus: OrderStatus(
              id: 7, nameArabic: "تم التوصيل", nameEnglish: "Delivered"),
          dateCreatedUtc: DateTime(2019, 12, 7, 20, 30),
          deliveryFee: 20,
          deliveryInfo: DeliveryInfo(
              area: "New Cairo",
              city: OrderStatus(nameEnglish: "Cairo", nameArabic: ("القاهرة")),
              address: "17 Shanan st",
              deliverToName: "Alisa"),
          orderItems: [
            OrderItem(
                nameArabic: "عطر العود العربى",
                nameEnglish: "Arabic Aoud Perfume",
                id: 15,
                price: 380,
                productItemId: 111,
                quantity: 2)
          ]));
      orderList.add(Order(
          orderId: 124,
          orderStatus: OrderStatus(
              id: 7, nameArabic: "تم التوصيل", nameEnglish: "Delivered"),
          dateCreatedUtc: DateTime(2019, 12, 7, 20, 30),
          deliveryFee: 20,
          deliveryInfo: DeliveryInfo(
              area: "New Cairo",
              city: OrderStatus(nameEnglish: "Cairo", nameArabic: ("القاهرة")),
              address: "17 Shanan st",
              deliverToName: "Alisa"),
          orderItems: [
            OrderItem(
                nameArabic: "عطر العود العربى",
                nameEnglish: "Arabic Aoud Perfume",
                id: 15,
                price: 380,
                productItemId: 111,
                quantity: 2)
          ]));
      orderList.add(Order(
          orderId: 123,
          orderStatus: OrderStatus(
              id: 7, nameArabic: "تم التوصيل", nameEnglish: "Delivered"),
          dateCreatedUtc: DateTime(2019, 12, 7, 20, 30),
          deliveryFee: 20,
          deliveryInfo: DeliveryInfo(
              area: "New Cairo",
              city: OrderStatus(nameEnglish: "Cairo", nameArabic: ("القاهرة")),
              address: "17 Shanan st",
              deliverToName: "Alisa"),
          orderItems: [
            OrderItem(
                nameArabic: "عطر العود العربى",
                nameEnglish: "Arabic Aoud Perfume",
                id: 15,
                price: 380,
                productItemId: 111,
                quantity: 2)
          ]));
    }, builder: (BuildContext ctx, Store<AppState> store) {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              AppTranslations.of(ctx).currentLanguage == "ar"
                  ? "طلباتى"
                  : "My Orders",
            ),
            centerTitle: true,
            elevation: 0.0,
          ),
          body: Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10),
              child: ListView(children: <Widget>[
                SizedBox(height: 10.0),
                SingleChildScrollView(
                  child: Column(children: orderCardList()),
                )
              ])));
    });
  }

  List<Widget> orderCardList() {
    var list = List<Widget>();
    for (var order in orderList) {
      list.add(GestureDetector(
        onTap: () {
          navigatorKey.currentState
              .push(MaterialPageRoute(builder: (context) => orderDetails()));
        },
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(order.orderId.toString()),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(order.deliveryInfo.city.nameEnglish +
                          ", " +
                          order.deliveryInfo.area +
                          ", " +
                          order.deliveryInfo.address),
                      Divider(color: Colors.white, height: 2),
                      Text(
                        order.dateCreatedUtc
                            .toLocal()
                            .toString()
                            .replaceAll(".000", ""),
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                      Text(
                        order.orderStatus.nameEnglish,
                        style: TextStyle(color: AppColors.secondaryColor),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
    }
    return list;
  }
}

/// Constructor Data Orders
class qeueuItem extends StatelessWidget {
  @override
  static var _txtCustomOrder = TextStyle(
    color: Colors.black45,
    fontSize: 13.5,
    fontWeight: FontWeight.w600,
    fontFamily: "Gotik",
  );

  String icon, txtHeader, txtInfo, time;
  double paddingValue;

  qeueuItem(
      {this.icon, this.txtHeader, this.txtInfo, this.time, this.paddingValue});

  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 13.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(icon),
              Padding(
                padding: EdgeInsets.only(
                    left: 8.0,
                    right: mediaQueryData.padding.right + paddingValue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(txtHeader, style: _txtCustomOrder),
                    Text(
                      txtInfo,
                      style: _txtCustomOrder.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          color: Colors.black38),
                    ),
                  ],
                ),
              ),
              Text(
                time,
                style: _txtCustomOrder..copyWith(fontWeight: FontWeight.w400),
              )
            ],
          ),
        ],
      ),
    );
  }
}
