import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe/components/FoodDetailsPage.dart';
import 'package:recipe/components/button.dart';
import 'package:recipe/components/food_tile.dart';
import 'package:recipe/models/food.dart';
import 'package:recipe/theme/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final List<Food> foodMenu = [
    Food(
      name: "Salmon Sushi",
      price: "\$15.99",
      imagePath: "images/sushi.png",
      rating: "4.5",
    ),
    Food(
      name: "Ramen",
      price: "\$12.99",
      imagePath: "images/sushi (2).png",
      rating: "4.7",
    ),
    Food(
      name: "Tempura",
      price: "\$10.99",
      imagePath: "images/sushi (3).png",
      rating: "4.3",
    ),
  ];

  void navigateToFoodDetails(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(food: foodMenu[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.grey.shade900),
        title: Text("Tokyo", style: TextStyle(color: Colors.grey.shade900)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Get 32% Promo",
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Button(text: "Redeem", onTap: () {}),
                  ],
                ),
                Image.asset('images/sushi (3).png', height: 100),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search here....",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Food Menu",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: SizedBox(
              height: 220, // Set a fixed height for the horizontal ListView
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder: (context, index) {
                  return FoodTile(
                    food: foodMenu[index],
                    onTap: navigateToFoodDetails,
                  );
                },
              ),
            ),
          ),

          SizedBox(height: 25),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('images/sushi (1).png', height: 60),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Salmon Eggs",
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text("\$21.00"),
                      ],
                    ),
                  ],
                ),
                Icon(Icons.favorite_outline, color: Colors.grey, size: 28),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
