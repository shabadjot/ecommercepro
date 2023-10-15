import 'package:ecommercepro/app_provider.dart';
import 'package:ecommercepro/constants/constants.dart';
import 'package:ecommercepro/models/product_model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleCartItems extends StatefulWidget {
  final ProductModel singleProduct;
  const SingleCartItems({
    super.key,
    required this.singleProduct,
  });

  @override
  State<SingleCartItems> createState() => _SingleCartItemsState();
}

class _SingleCartItemsState extends State<SingleCartItems> {
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
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          11,
        ),
        border: Border.all(color: Theme.of(context).primaryColor, width: 3),
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
                            Row(
                              children: [
                                CupertinoButton(
                                  onPressed: () {
                                    if (qty >= 1) {
                                      setState(() {
                                        qty--;
                                      });
                                      appProvider.updateQty(
                                          widget.singleProduct, qty);
                                    }
                                  },
                                  padding: EdgeInsets.zero,
                                  child: const CircleAvatar(
                                    maxRadius: 13,
                                    child: Icon(Icons.remove),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12.0,
                                ),
                                Text(
                                  qty.toString(),
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                CupertinoButton(
                                  onPressed: () {
                                    setState(() {
                                      qty++;
                                    });
                                    appProvider.updateQty(
                                        widget.singleProduct, qty);
                                  },
                                  child: const CircleAvatar(
                                    maxRadius: 13,
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ],
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                if (!appProvider.geFavouriteProductList
                                    .contains(widget.singleProduct)) {
                                  appProvider.addFavouriteProduct(
                                      widget.singleProduct);
                                } else {
                                  appProvider.removeFavouriteProduct(
                                      widget.singleProduct);
                                }
                              },
                              child: Text(
                                appProvider.geFavouriteProductList
                                        .contains(widget.singleProduct)
                                    ? "Remove to wishlist"
                                    : "Add to wishlist",
                                style: const TextStyle(
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
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        AppProvider appProvider =
                            Provider.of<AppProvider>(context, listen: false);
                        appProvider.removeCartProduct(widget.singleProduct);
                        showMessage("Product removed from cart successfully");
                      },
                      child: const CircleAvatar(
                        maxRadius: 13,
                        child: Icon(
                          Icons.delete,
                          size: 17,
                        ),
                      ),
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
