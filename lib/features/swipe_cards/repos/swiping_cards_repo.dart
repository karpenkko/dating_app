import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class SwipingCardsRepo {
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