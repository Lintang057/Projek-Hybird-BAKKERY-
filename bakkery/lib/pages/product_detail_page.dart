// ============================
// lib/pages/product_detail_page.dart
// ============================

import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {

  final Map product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(),

      body: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Center(
              child: Text(
                product["image"],
                style: const TextStyle(
                  fontSize: 120,
                ),
              ),
            ),

            const SizedBox(height: 25),

            Text(
              product["name"],
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              product["price"],
              style: const TextStyle(
                fontSize: 22,
                color: Colors.pink,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Donat klasik yang lembut dan empuk. Cocok dinikmati kapan saja!",
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Pilih Topping",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Wrap(
              spacing: 12,
              runSpacing: 12,

              children: [

                buildVariant("Dark Chocolate"),
                buildVariant("Keju"),
                buildVariant("Matcha"),
                buildVariant("Strawberry"),
                buildVariant("Tiramisu"),
                buildVariant("Oreo Crunch"),

              ],
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                onPressed: () {},

                child: const Text(
                  "Tambah Pembelian",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

  // ============================
  // WIDGET VARIAN
  // ============================

  Widget buildVariant(String title) {

    return Container(

      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 12,
      ),

      decoration: BoxDecoration(

        color: Colors.pink.shade50,

        borderRadius: BorderRadius.circular(15),

        border: Border.all(
          color: Colors.pink.shade200,
        ),
      ),

      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}