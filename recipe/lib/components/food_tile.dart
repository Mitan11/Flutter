import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe/models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final VoidCallback? onTap;
  const FoodTile({super.key, required this.food, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(left: 25),
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: Image.asset(food.imagePath, fit: BoxFit.contain)),
            SizedBox(height: 8),
            Text(
              food.name,
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              food.price,
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),

            SizedBox(height: 4),
            SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    food.price,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, size: 16, color: Colors.yellow.shade800),
                      Text(
                        food.rating,
                        style: TextStyle(color: Colors.grey.shade800),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
