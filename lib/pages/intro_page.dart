import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 138, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),

            //shop name
            Text(
              "Fast Food",
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 28, color: Colors.white),
            ),

            const SizedBox(height: 25),

            //icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('lib/images/tea.png'),
            ),

            const SizedBox(height: 25),

            //title

            Text(
              "The Mumbai Life Line",
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 28, color: Colors.white),
            ),

            //subtitle
            Text(
              "Taste the Tradition",
              style: TextStyle(
                color: Colors.grey[200],
                height: 2,
              ),
            ),

            //get started button
          ],
        ),
      ),
    );
  }
}

//4.30