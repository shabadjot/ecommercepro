import 'package:ecommercepro/app_provider.dart';
import 'package:ecommercepro/screens/favourite_screen/widget/single_favourite_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favourite Screen",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: appProvider.geFavouriteProductList.isEmpty
          ? const Center(
              child: Text("Your wishlist is empty"),
            )
          : ListView.builder(
              itemCount: appProvider.geFavouriteProductList.length,
              padding: const EdgeInsets.all(12),
              itemBuilder: (ctx, index) {
                return SingleFavouriteItems(
                  singleProduct: appProvider.getCartProductList[index],
                );
              }),
    );
  }
}
