import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:vanilla/local/app_translation.dart';
import 'package:vanilla/model/product_response.dart';

Future<ProductResponse> getProductData(BuildContext ctx, String slug) async {
  var client = http.Client();
  print("Attempting to get home content from server");
  try {
    final response = await client
        .get("https://vanilla.sa/public/api/products/$slug", headers: {
      "Content-Type": "application/json",
    });
    if (response.statusCode == 200) {
      return compute(parseResponse, response.bodyBytes);
    } else {
      print(response.statusCode.toString());
      Fluttertoast.showToast(
          msg: AppTranslations.of(ctx).currentLanguage == "ar"
              ? "خطأ فى إستلام البيانات"
              : "Error in receiving data",
          backgroundColor: Colors.grey,
          textColor: Colors.red,
          fontSize: 16,
          toastLength: Toast.LENGTH_LONG);
      return null;
    }
  } catch (e) {
    print(e.toString());
  } finally {
    client.close();
  }
  return null;
}

ProductResponse parseResponse(responseBody) {
  if (responseBody != null)
    return ProductResponse.fromJson(json.decode(utf8.decode(responseBody)));
  else
    return null;
}
