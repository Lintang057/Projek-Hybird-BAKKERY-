// ============================
// lib/pages/cart_page.dart
// ============================

import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Pick Up Order"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            buildItem(
              "🍩",
              "Donat Pinkan Mambo",
              "Rp 8.000",
            ),

            buildItem(
              "🍪",
              "Cookies Matcha",
              "Rp 10.000",
            ),

            buildItem(
              "🥐",
              "Croissant Strawberry",
              "Rp 15.000",
            ),

            const Spacer(),

            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

              children: const [

                Text(
                  "Total",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "Rp 33.000",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(
                onPressed: () {},

                child: const Text("Order Now"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildItem(
      String emoji,
      String title,
      String price,
      ) {

    return Container(

      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(

        children: [

          Text(
            emoji,
            style: const TextStyle(fontSize: 45),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Text(price)

        ],
      ),
    );
  }
}