import 'package:ecommercepro/app_provider.dart';
import 'package:ecommercepro/constants/constants.dart';
import 'package:ecommercepro/models/product_model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleFavouriteItems extends StatefulWidget {
  final ProductModel singleProduct;
  const SingleFavouriteItems({
    super.key,
    required this.singleProduct,
  });

  @override
  State<SingleFavouriteItems> createState() => _SingleFavouriteItemsState();
}

class _SingleFavouriteItemsState extends State<SingleFavouriteItems> {
  int qty = 1;
  @override
  void initState() {
    super.initState();
    qty = widget.singleProduct.qty ?? 1;
    setState(() {
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          11,
        ),
        border: Border.all(color: Colors.green, width: 3),
      ),
      child: Row(
        children: [
          Expanded(
              child: Container(
            height: 150,
            color: Theme.of(context).primaryColor.withOpacity(0.5),
            child: Image.network(
              widget.singleProduct.image,
            ),
          )),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.singleProduct.name,
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                AppProvider appProvider =
                                    Provider.of<AppProvider>(context,
                                        listen: false);
                                appProvider.removeFavouriteProduct(
                                    widget.singleProduct);
                                showMessage(
                                    "Removed to your wishlist successfully");
                              },
                              child: const Text(
                                "Remove to wishlist",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              "\$${widget.singleProduct.price.toString()}",
                              style: const TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
