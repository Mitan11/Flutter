import 'package:flutter/material.dart';
import 'package:task3/screens/cart.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Map<String, dynamic>> products = [
    {"name": "Shoes", "price": 5999, "image": "assets/images/shoes.webp"},
    {"name": "Candles", "price": 499, "image": "assets/images/candle.jpg"},
    {"name": "Watch", "price": 9999, "image": "assets/images/watch.webp"},
    {"name": "EyeCover", "price": 299, "image": "assets/images/cover.jpg"}
  ];

  List<Map<String, dynamic>> cart = [];

  // Add to cart method
  void addToCart(Map<String, dynamic> product) {
    setState(() {
      int index = cart.indexWhere((item) => item["name"] == product["name"]);

      if (index >= 0) {
        cart[index]["quantity"]++;
      } else {
        cart.add({
          "name": product["name"],
          "price": product["price"],
          "image": product["image"],
          "quantity": 1,
        });
      }
    });

    // Show SnackBar after adding the product to the cart
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${product["name"]} added to the cart"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  // Method to open the cart screen
  void openCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartScreen(cart: cart),
      ),
    );
  }

  // Get the count of items in the cart
  int getCartCount() {
    int count = 0;
    for (var item in cart) {
      count += item["quantity"] as int;
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        actions: [
          IconButton(
            onPressed: openCart,
            icon: Stack(
              children: [
                Icon(Icons.shopping_cart, size: 28),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Text(
                      "${getCartCount()}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.72,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      product["image"],
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    Text(
                      product["name"],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "₹${product["price"]}",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () => addToCart(product),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text("Add to Cart"),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}