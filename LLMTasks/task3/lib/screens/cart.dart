import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
   final List<Map<String, dynamic>> cart;
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
double calculateTotal() {
    double total = 0;
    return total;
  }

  void addItem(int index) {
    setState(() {
      widget.cart[index]["quantity"]++;
    });
  }

  void removeItem(int index) {
    setState(() {
           widget.cart[index]["quantity"]--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart Page")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cart.length,
              itemBuilder: (context, index) {
                final item = widget.cart[index];

                double itemTotal =
                    item["price"] * item["quantity"];

                return Card(
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Image.asset(
                          item.image,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),

                        SizedBox(width: 15),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                item["name"],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                              Text("₹${item["price"]}"),
                              Text("Total: ₹$itemTotal"),
                            ],
                          ),
                        ),

                        Row(
                          children: [
                            IconButton(
                              onPressed: () =>
                                  removeItem(index),
                              icon: Icon(Icons.remove),
                            ),
                            Text(
                              "${item["quantity"]}",
                              style:
                                  TextStyle(fontSize: 16),
                            ),
                            IconButton(
                              onPressed: () =>
                                  addItem(index),
                              icon: Icon(Icons.add),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Grand Total: ₹${calculateTotal()}",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}