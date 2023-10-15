import 'package:ecommercepro/app_provider.dart';
import 'package:ecommercepro/constants/constants.dart';
import 'package:ecommercepro/constants/routes.dart';
import 'package:ecommercepro/screens/cart_item_checkout/cart_item_checkout.dart';

import 'package:ecommercepro/screens/cart_screen/widgets/single_cart_item.dart';
import 'package:ecommercepro/widgets/primary-button/primary_button.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';

// ignore: unnecessary_import
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 180,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "COD Cash on Delivery",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\$${appProvider.totalPrice().toString()}",
                    style: const TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              PrimaryButton(
                title: "Checkout",
                onPressed: () {
                  appProvider.clearBuyProduct();
                  appProvider.addBuyProductCartList();
                  appProvider.clearCart();
                  if (appProvider.getBuyProdctList.isEmpty) {
                    showMessage("Your cart is empty");
                  } else {
                    Routes.instance.push(
                        widget: const CartItemCheckout(), context: context);
                  }
                },
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text(
          "Cart Screen",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: appProvider.getCartProductList.isEmpty
          ? const Center(
              child: Text("Your cart is empty"),
            )
          : ListView.builder(
              itemCount: appProvider.getCartProductList.length,
              padding: const EdgeInsets.all(12),
              itemBuilder: (ctx, index) {
                return SingleCartItems(
                  singleProduct: appProvider.getCartProductList[index],
                );
              }),
    );
  }
}
