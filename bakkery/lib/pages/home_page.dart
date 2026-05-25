// ============================
// lib/pages/home_page.dart
// ============================

import 'package:flutter/material.dart';
import 'product_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final List products = [

      {
        "name": "Donat Pinkan Mambo",
        "price": "Rp 9.000",
        "image": "🍩",
      },

      {
        "name": "French Toast Delight",
        "price": "Rp 8.000",
        "image": "🍞",
      },

      {
        "name": "The Cowboy Cookie",
        "price": "Rp 10.000",
        "image": "🍪",
      },

      {
        "name": "Croissant Strawberry",
        "price": "Rp 15.000",
        "image": "🥐",
      },

    ];

    return Scaffold(

      appBar: AppBar(
        title: const Text("Bakery's"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Container(
              height: 180,
              width: double.infinity,

              decoration: BoxDecoration(
                color: Colors.pink.shade100,
                borderRadius: BorderRadius.circular(25),
              ),

              child: const Center(
                child: Text(
                  "Fresh Bakery Everyday 🧁",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Categories",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: GridView.builder(

                itemCount: products.length,

                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),

                itemBuilder: (context, index) {

                  return GestureDetector(

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailPage(
                            product: products[index],
                          ),
                        ),
                      );
                    },

                    child: Container(

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 10,
                          )
                        ],
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [

                          Text(
                            products[index]["image"],
                            style: const TextStyle(fontSize: 55),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            products[index]["name"],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(products[index]["price"])

                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}