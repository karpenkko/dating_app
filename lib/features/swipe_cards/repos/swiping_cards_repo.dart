import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

import '../../../link.dart';
import '../../user_profile/models/user_model.dart';

class SwipingCardsRepo {
  Future<void> createSubscription(int? id, String date) async {
    var dio = Dio();
    Response response = await dio.post(
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

  Future<List<UserModel>> getSwipeCards() async {
    var dio = Dio();
    Response response = await dio.post(
      '$customLink/api/get_profiles',
    );
    if (response.statusCode == 200) {
      return response.data.map((data) => UserModel.fromJson(data)).toList();
    } else {
      throw Exception(response.statusMessage);
    }
  }

  Future<void> updateSubscription(int? id, String date) async {
    var dio = Dio();
    Response response = await dio.post(
      '$customLink/api/update_membership/$id',
      data: {
        "user_id": id,
        "membership": "premium",
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

  Future<void> likeUser(int? userId, int? likeId) async {
    var dio = Dio();
    Response response = await dio.post(
      '$customLink/api/profiles/$userId/like',
      data: {"user_liked_id": userId, "liked_user_id": likeId},
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

  static Future<void> fetchInitPaymentSheet(
      Map<String, dynamic>? paymentIntent) async {
    await Stripe.instance
        .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
                paymentIntentClientSecret: paymentIntent!['client_secret'],
                style: ThemeMode.light,
                merchantDisplayName: 'Abhi'))
        .then((value) {});
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
