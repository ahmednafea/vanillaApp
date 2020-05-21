import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vanilla/local/app_translation.dart';
import 'package:vanilla/model/app_state.dart';
import 'package:vanilla/model/order_item.dart';

class orderDetails extends StatefulWidget {
  @override
  _orderState createState() => _orderState();
}

class _orderState extends State<orderDetails> {
  static var _txtCustom = TextStyle(
    color: Colors.black54,
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
    fontFamily: "Gotik",
  );
  var order = Order(
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
      ]);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return StoreBuilder<AppState>(
        builder: (BuildContext ctx, Store<AppState> store) {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              AppTranslations.of(ctx).currentLanguage == "ar"
                  ? "طلب #" + order.orderId.toString()
                  : "Order #" + order.orderId.toString(),
              style: _txtCustom,
            ),
            centerTitle: true,
            elevation: 0.0,
          ),
          body: ListView(children: <Widget>[
            SingleChildScrollView(
              child: Column(children: [
                Card(
                  elevation: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                                AppTranslations.of(ctx).currentLanguage == "ar"
                                    ? "تاريخ الطلب :"
                                    : "Order Date:",
                                style: _txtCustom),
                            VerticalDivider(),
                            Expanded(
                              flex: 1,
                              child: Text(
                                order.dateCreatedUtc
                                    .toLocal()
                                    .toString()
                                    .replaceAll(".000", ""),
                                style: _txtCustom,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                                AppTranslations.of(ctx).currentLanguage == "ar"
                                    ? "حالة الطلب :"
                                    : "Order Status:",
                                style: _txtCustom),
                            VerticalDivider(),
                            Expanded(
                              flex: 1,
                              child: Text(
                                order.orderStatus.nameEnglish,
                                style: _txtCustom,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                                AppTranslations.of(ctx).currentLanguage == "ar"
                                    ? "التوصيل :"
                                    : "Delivery Fees:",
                                style: _txtCustom),
                            VerticalDivider(),
                            Expanded(
                              flex: 1,
                              child: Text(
                                order.deliveryFee.toString() + " L.E",
                                style: _txtCustom,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                                AppTranslations.of(ctx).currentLanguage == "ar"
                                    ? "المبلغ الكلى :"
                                    : "Total Payment:",
                                style: _txtCustom),
                            VerticalDivider(),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "780 L.E",
                                style: _txtCustom,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  elevation: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                                AppTranslations.of(ctx).currentLanguage == "ar"
                                    ? "عنوان التوصيل :"
                                    : "Delivery Address:",
                                style: _txtCustom),
                            VerticalDivider(),
                            Expanded(
                              flex: 1,
                              child: Text(
                                order.deliveryInfo.city.nameEnglish +
                                    ", " +
                                    order.deliveryInfo.area +
                                    ", " +
                                    order.deliveryInfo.address,
                                style: _txtCustom,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                                AppTranslations.of(context).currentLanguage ==
                                        "ar"
                                    ? "المنتجات :"
                                    : "Products:",
                                style: _txtCustom),
                          ],
                        ),
                      ),
                      Card(
                        elevation: 2,
                        color: Colors.amber[100],
                        margin:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                      order.orderItems.first.nameEnglish,
                                      style: _txtCustom)),
                              Text(
                                  AppTranslations.of(ctx).currentLanguage ==
                                          "ar"
                                      ? order.orderItems.first.quantity
                                              .toString() +
                                          " قطعة"
                                      : order.orderItems.first.quantity
                                              .toString() +
                                          " Piece",
                                  style: _txtCustom),
                              VerticalDivider(
                                width: 20,
                              ),
                              Text(
                                  order.orderItems.first.price.toString() +
                                      " L.E",
                                  style: _txtCustom)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            )
          ]));
    });
  }
}
