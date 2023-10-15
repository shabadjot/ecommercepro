import 'package:ecommercepro/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:ecommercepro/models/orders_model/order_model.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Your Orders",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder(
        future: FirebaseFirestoreHelper.instance.getUserOrder(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data!.isEmpty ||
              snapshot.data == null ||
              !snapshot.hasData) {
            return const Center(
              child: Text("No orders found"),
            );
          }
          return Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: ListView.builder(
                itemCount: snapshot.data!.length,
                padding: const EdgeInsets.all(12.0),
                itemBuilder: (context, index) {
                  OrderModel orderModel = snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        collapsedShape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2.3)),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2.3)),
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Expanded(
                                child: Container(
                              height: 80,
                              width: 80,
                              color: Theme.of(context).primaryColor,
                              child: Image.network(
                                orderModel.products[0].image,
                              ),
                            )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            orderModel.products[0].name,
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 12.0,
                                          ),
                                          orderModel.products.length > 1
                                              ? SizedBox.fromSize()
                                              : Column(
                                                  children: [
                                                    Text(
                                                      "Quantity Price: ${orderModel.products[0].qty.toString()}",
                                                      style: const TextStyle(
                                                        fontSize: 12.0,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 12.0,
                                                    ),
                                                  ],
                                                ),
                                          Text(
                                            "Total Price: \$${orderModel.totalPrice.toString()}",
                                            style: const TextStyle(),
                                          ),
                                          const SizedBox(
                                            height: 12.0,
                                          ),
                                          Text(
                                            "Order Status:${orderModel.status}",
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 12.0,
                                          ),
                                          orderModel.status == "Pending" ||
                                                  orderModel.status ==
                                                      "Delivery"
                                              ? ElevatedButton(
                                                  onPressed: () async {
                                                    await FirebaseFirestoreHelper
                                                        .instance
                                                        .updateOrder(orderModel,
                                                            "Cancel");
                                                    orderModel.status =
                                                        "Cancel";
                                                    setState(() {});
                                                  },
                                                  child: const Text(
                                                      "Cancel Order"),
                                                )
                                              : SizedBox.fromSize(),
                                          orderModel.status == "Delivery"
                                              ? ElevatedButton(
                                                  onPressed: () async {
                                                    await FirebaseFirestoreHelper
                                                        .instance
                                                        .updateOrder(orderModel,
                                                            "Completed");
                                                    orderModel.status =
                                                        "Completed";
                                                    setState(() {});
                                                  },
                                                  child: const Text(
                                                      "Delivered Order"),
                                                )
                                              : SizedBox.fromSize()
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // ignore: prefer_is_empty
                        children: orderModel.products.length > 0
                            ? orderModel.products.map((singleProduct) {
                                const Text("Product Details");
                                Divider(
                                  color: Theme.of(context).primaryColor,
                                );

                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12.0, top: 6.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Expanded(
                                          child: Container(
                                        height: 80,
                                        width: 80,
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.5),
                                        child: Image.network(
                                          singleProduct.image,
                                        ),
                                      )),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      singleProduct.name,
                                                      style: const TextStyle(
                                                        fontSize: 12.0,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 12.0,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text(
                                                          "Quantity Price: \$${singleProduct.qty.toString()}'",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      12.0),
                                                        ),
                                                        const SizedBox(
                                                          height: 12.0,
                                                        )
                                                      ],
                                                    ),
                                                    Text(
                                                      "Total Price: \$${singleProduct.price.toString()}",
                                                      style: const TextStyle(),
                                                    ),
                                                    const SizedBox(
                                                      height: 12.0,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList()
                            : []),
                  );
                }),
          );
        },
      ),
    );
  }
}
