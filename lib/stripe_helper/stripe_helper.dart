// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:ecommercepro/app_provider.dart';
import 'package:ecommercepro/constants/constants.dart';
import 'package:ecommercepro/constants/routes.dart';
import 'package:ecommercepro/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:ecommercepro/screens/custom_bottom_bar/custom_bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class StripeHelper {
  static StripeHelper instance = StripeHelper();

  Map<String, dynamic>? paymentIntent;
  Future<void> makePayment(String amount, BuildContext context) async {
    try {
      paymentIntent = await createPaymentIntent(amount, 'USD');

      var gpay = const PaymentSheetGooglePay(
          merchantCountryCode: "US", currencyCode: "USD", testEnv: true);

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent![
                      'client_secret'], //Gotten from payment intent
                  style: ThemeMode.light,
                  merchantDisplayName: 'Shabadjot Singh',
                  googlePay: gpay))
          .then((value) {});

      //STEP 3: Display Payment sheet
      displayPaymentSheet(context);
    } catch (err) {
      showMessage(err.toString());
    }
  }

  Future<bool> displayPaymentSheet(BuildContext context) async {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    try {
      await Stripe.instance.presentPaymentSheet().then((value) async {
        bool value = await FirebaseFirestoreHelper.instance
            .uploadOrderedProductFirebase(
                appProvider.getBuyProdctList, context, "Paid");

        appProvider.clearBuyProduct();
        if (value) {
          Future.delayed(const Duration(seconds: 2), () {
            Routes.instance
                .push(widget: const CustomBottomBar(), context: context);
          });
        }
      });
      return true;
    } catch (e) {
      showMessage(e.toString());
      return false;
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51Nu2ZcKG9uJFiRKzKMUcCw7gvj1awLTWZSjChxawR8H1URvuk7Y4fbsY3V2DAmVHi1Hr4IHMNV5ea9VLHx2vouoT00CJ7IcE0i',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
