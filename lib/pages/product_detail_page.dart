// ============================
// lib/pages/product_detail_page.dart
// ============================

import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {

  final Map product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  String selectedTopping = "";
  int quantity = 1;

  int get price {
    String priceString = widget.product["price"];

    priceString = priceString
        .replaceAll("Rp", "")
        .replaceAll(".", "")
        .replaceAll(" ", "");

    return int.tryParse(priceString) ?? 0;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Center(
                child: Text(
                  widget.product["image"],
                  style: const TextStyle(
                    fontSize: 120,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Text(
                widget.product["name"],
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                widget.product["price"],
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

              const SizedBox(height: 30),

              const Text(
                "Jumlah Pesanan",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  IconButton(
                    onPressed: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                    icon: const Icon(Icons.remove_circle),
                    iconSize: 35,
                    color: Colors.pink,
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Text(
                      "$quantity",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    icon: const Icon(Icons.add_circle),
                    iconSize: 35,
                    color: Colors.pink,
                  ),

                ],
              ),

              const SizedBox(height: 20),

              Text(
                "Total: Rp ${(price * quantity).toString().replaceAllMapped(
                  RegExp(r'(\\d{1,3})(?=(\\d{3})+(?!\\d))'),
                  (Match m) => '${m[1]}.',
                )}",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),

              const SizedBox(height: 40),

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

                  onPressed: () {

                    if (selectedTopping.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Pilih topping terlebih dahulu",
                          ),
                        ),
                      );
                      return;
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Pesanan ditambahkan\n"
                          "Produk: ${widget.product["name"]}\n"
                          "Topping: $selectedTopping\n"
                          "Jumlah: $quantity\n"
                          "Total: Rp ${price * quantity}",
                        ),
                      ),
                    );

                  },

                  child: const Text(
                    "Tambah Pembelian",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),

              const SizedBox(height: 30),

            ],
          ),
        ),
      ),
    );
  }

  // ============================
  // WIDGET VARIAN
  // ============================

  Widget buildVariant(String title) {

    return ChoiceChip(

      label: Text(title),

      selected: selectedTopping == title,

      onSelected: (value) {
        setState(() {
          selectedTopping = title;
        });
      },

      selectedColor: Colors.pink.shade200,
      backgroundColor: Colors.pink.shade50,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: Colors.pink.shade200,
        ),
      ),
    );
  }
}