import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

import '../../../link.dart';
import '../../user_profile/models/user_model.dart';

class SwipingCardsRepo {

  // var user_models = [UserModel.fromJson(data) for data in response.data];

  Future<void> createSubscription(int? id, String date) async {
    var dio = Dio();
    Response response = await dio.get(
      '$customLink/api/create_membership/$id',
      data: {
        "user_id": id,
        "membership": "free",
        "swipes_amount": 0,
        "start_date": date,
      },
    );
    if (response.statusCode == 200) {
      print(response.data);
    } else {
      throw Exception(response.statusMessage);
    }
  }

  static Future<Map<String, dynamic>> fetchPaymentIntent() async {
    try {
      Map<String, dynamic> body = {
        'amount': '20000',
        'currency': 'UAH',
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
          'Bearer sk_test_51PEWOMDzHaKgEVh4tUtBRrsU2pVI0DeNGg1H7ZwRDTAKW9xrV7iaYDkCICrpFYqNkaUntd9RDPkpvf5OCvb6BR9W00JapV2cF3',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  static Future<void> fetchInitPaymentSheet(Map<String, dynamic>? paymentIntent) async {

    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntent!['client_secret'],
            style: ThemeMode.light,
            merchantDisplayName: 'Abhi')).then((value) {});
  }

  static Future<void> fetchPresentPaymentSheet() async {

    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        print("Payment Successfully");
      });
    } catch (e) {
      print('$e');
    }
  }


}