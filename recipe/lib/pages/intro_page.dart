import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 130, 60, 55),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),
            Text(
              "SUSHI MAN",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset("images/sushi (1).png"),
            ),

            const SizedBox(height: 25),

            Text(
              "THE TASTE OF JAPANESE FOOD",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 44,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 25),

            Text(
              "Feel the taste of Japanese food with us. We have the best sushi in town.",
              style: TextStyle(color: Colors.grey.shade300, height: 2),
            ),

            const SizedBox(height: 25),
            Button(
              text: "Get Started",
              onTap: () {
                Navigator.pushNamed(context, "/menupage");
              },
            ),
          ],
        ),
      ),
    );
  }
}
