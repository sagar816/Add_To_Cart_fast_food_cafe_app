import 'package:add_to_cart/components/button.dart';
import 'package:add_to_cart/components/food_tile.dart';
import 'package:add_to_cart/models/shop.dart';
import 'package:add_to_cart/pages/food_details_page.dart';
import 'package:add_to_cart/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // navigate to food item details page
  void navigateToFoodDetails(int index) {
    // get the shop and its menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailspage(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get the shop and its menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        // elevation: 0,
        leading: const Icon(Icons.menu),
        title:const Padding(
          padding: EdgeInsets.only(left: 55),
          child: Text("Mumbai Cafe"),
        ),
        actions: [
          // cart button
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cartpage');
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // promo banner
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(horizontal: 25),
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // promo message
                      Text(
                        "Get 32 % Promo",
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      // redeem Button
                      MyButton(
                        text: "Redeem",
                        onTap: () {},
                      )
                    ],
                  ),

                  //image
                  Image.asset(
                    'lib/images/burger.png',
                    height: 100,
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Search Here ..."),
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            // menu list
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Food Menu",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                    fontSize: 18),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            SizedBox(
                height: 230,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodMenu.length,
                  itemBuilder: (context, index) => FoodTile(
                    food: foodMenu[index],
                    onTap: () => navigateToFoodDetails(index),
                  ),
                )),

            const SizedBox(
              height: 20,
            ),

            //popular food
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
              padding: const EdgeInsets.all(20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // image
                    Row(
                      children: [
                        Image.asset(
                          'lib/images/burger.png',
                          height: 60,
                        ),

                        const SizedBox(
                          width: 20,
                        ),

                        // name and price
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //name
                            Text(
                              "Burger",
                              style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                            ),

                            const SizedBox(
                              height: 10,
                            ),

                            // price
                            Text(
                              "\₹60.00",
                              style: TextStyle(color: Colors.grey[700]),
                            )
                          ],
                        ),
                      ],
                    ),

                    // heart
                    Icon(
                      Icons.favorite_outline,
                      color: Colors.grey,
                      size: 28,
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
