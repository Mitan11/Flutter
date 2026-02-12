import 'package:flutter/material.dart';
import 'package:flutter_application_1/AppScaffold.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  List<Map<String, dynamic>> products = [
    {
      "product_image": "https://placehold.co/400/png",
      "product_name": "Example Product 1",
      "price": 100,
    },
    {
      "product_image": "https://placehold.co/400/png",
      "product_name": "Example Product 2",
      "price": 78,
    },
    {
      "product_image": "https://placehold.co/400/png",
      "product_name": "Example Product 3",
      "price": 654,
    },
    {
      "product_image": "https://placehold.co/400/png",
      "product_name": "Example Product 4",
      "price": 12,
    },
    {
      "product_image": "https://placehold.co/400/png",
      "product_name": "Example Product 5",
      "price": 89,
    },
    {
      "product_image": "https://placehold.co/400/png",
      "product_name": "Example Product 6",
      "price": 2000,
    },
    {
      "product_image": "https://placehold.co/400/png",
      "product_name": "Example Product 7",
      "price": 10000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Product Catalog",
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Product Catalog",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: 0.75,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            products[index]["product_image"],
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          products[index]["product_name"],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text("\$${products[index]["price"]}"),
                        SizedBox(height: 10),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
