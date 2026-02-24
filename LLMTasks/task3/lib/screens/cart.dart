import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final List<Map<String, dynamic>> cart;
  const CartScreen({super.key, required this.cart});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Calculate the total price of all items in the cart
  double calculateTotal() {
    double total = 0;
    for (var item in widget.cart) {
      // Convert price to double (whether it's an int or double)
      double price = (item["price"] is double)
          ? item["price"]
          : (item["price"] as int).toDouble();

      total += price * (item["quantity"] as int);
    }
    return total;
  }

  // Add one item to the cart
  void addItem(int index) {
    setState(() {
      widget.cart[index]["quantity"]++;
    });
  }

  // Remove one item from the cart
  void removeItem(int index) {
    setState(() {
      if (widget.cart[index]["quantity"] > 1) {
        widget.cart[index]["quantity"]--;
      }
    });
  }

  // Delete an item from the cart
  void deleteItem(int index) {
    setState(() {
      widget.cart.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart Page")),
      body: widget.cart.isEmpty
          ? Center(child: Text("Your cart is empty", style: TextStyle(fontSize: 18)))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.cart.length,
                    itemBuilder: (context, index) {
                      final item = widget.cart[index];

                      // Safely convert the price to a double for calculation
                      double price = (item["price"] is double)
                          ? item["price"]
                          : (item["price"] as int).toDouble();
                      double itemTotal = price * (item["quantity"] as int);

                      return Card(
                        margin: EdgeInsets.all(10),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Image.asset(
                                item["image"],
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item["name"],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text("₹${price.toStringAsFixed(2)}"),
                                    Text("Total: ₹${itemTotal.toStringAsFixed(2)}"),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () => removeItem(index),
                                    icon: Icon(Icons.remove),
                                  ),
                                  Text(
                                    "${item["quantity"]}",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    onPressed: () => addItem(index),
                                    icon: Icon(Icons.add),
                                  ),
                                  IconButton(
                                    onPressed: () => deleteItem(index),
                                    icon: Icon(Icons.delete),
                                  ),
                                ],
                              ),
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
                    "Grand Total: ₹${calculateTotal().toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
    );
  }
}