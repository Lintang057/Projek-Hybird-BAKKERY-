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
        title: const Text("Keranjang"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(

            children: [

              buildItem(
                "🍩",
                "Donat Pinkan Mambo",
                "Rp 9.000",
              ),

              buildItem(
                "🍞",
                "French Toast Delight",
                "Rp 8.000",
              ),

              buildItem(
                "🍪",
                "The Cowboy Cookie",
                "Rp 10.000",
              ),

              buildItem(
                "🥐",
                "Croissant Strawberry",
                "Rp 15.000",
              ),

              const SizedBox(height: 30),

              const Divider(),

              const SizedBox(height: 15),

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
                    "Rp 42.000",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                  ),

                  onPressed: () {

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Lanjut ke Pembayaran",
                        ),
                      ),
                    );

                  },

                  child: const Text(
                    "Checkout",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

            ],
          ),
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

        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
          )
        ],
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
                fontSize: 16,
              ),
            ),
          ),

          Text(
            price,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

        ],
      ),
    );
  }
}