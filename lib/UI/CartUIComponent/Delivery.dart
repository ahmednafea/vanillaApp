import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vanilla/actions/open_payment_screen_action.dart';
import 'package:vanilla/configs/app_colors.dart';
import 'package:vanilla/middleware/navigation_key.dart';
import 'package:vanilla/model/app_state.dart';

class delivery extends StatefulWidget {
  @override
  _deliveryState createState() => _deliveryState();
}

class _deliveryState extends State<delivery> {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
        builder: (BuildContext ctx, Store<AppState> store) {
      return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                navigatorKey.currentState.pop(false);
              },
              child: Icon(Icons.arrow_back)),
          elevation: 0.0,
          title: Text(
            "Delivery",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
                color: Colors.black54,
                fontFamily: "Gotik"),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black54),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Where are your ordered items shipped ?",
                    style: TextStyle(
                        letterSpacing: 0.1,
                        fontWeight: FontWeight.w600,
                        fontSize: 25.0,
                        color: Colors.black54,
                        fontFamily: "Gotik"),
                  ),
                  Padding(padding: EdgeInsets.only(top: 50.0)),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Pin Code",
                        hintText: "Pin Code",
                        hintStyle: TextStyle(color: Colors.black54)),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Locality",
                        hintText: "Locality",
                        hintStyle: TextStyle(color: Colors.black54)),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "City",
                        hintText: "City",
                        hintStyle: TextStyle(color: Colors.black54)),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "State",
                        hintText: "State",
                        hintStyle: TextStyle(color: Colors.black54)),
                  ),
                  Padding(padding: EdgeInsets.only(top: 80.0)),
                  InkWell(
                    onTap: () {
                      store.dispatch(OpenPaymentScreenAction());
                    },
                    child: Container(
                      height: 55.0,
                      width: 300.0,
                      decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(40.0))),
                      child: Center(
                        child: Text(
                          "Go to payment",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.5,
                              letterSpacing: 1.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
