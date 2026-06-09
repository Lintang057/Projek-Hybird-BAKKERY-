import 'package:flutter/material.dart';
import 'keranjang_page.dart';
import '../data/cart_data.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, dynamic> product;

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
    String priceString = widget.product["price"].toString();

    priceString = priceString
        .replaceAll("Rp", "")
        .replaceAll(".", "")
        .replaceAll(" ", "");

    return int.tryParse(priceString) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final toppings = widget.product["toppings"] ?? [];

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
                  style: const TextStyle(fontSize: 120),
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
                children: toppings
                    .map<Widget>((t) => buildVariant(t.toString()))
                    .toList(),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      if (quantity > 1) {
                        setState(() => quantity--);
                      }
                    },
                    icon: const Icon(Icons.remove_circle),
                    color: Colors.pink,
                    iconSize: 35,
                  ),

                  Text("$quantity",
                      style: const TextStyle(fontSize: 24)),

                  IconButton(
                    onPressed: () {
                      setState(() => quantity++);
                    },
                    icon: const Icon(Icons.add_circle),
                    color: Colors.pink,
                    iconSize: 35,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Text(
                "Total: Rp ${price * quantity}",
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
                          content: Text("Pilih topping terlebih dahulu"),
                        ),
                      );
                      return;
                    }

                    bool exists = false;

                    for (var cartItem in CartData.items) {
                      if (cartItem["name"] == widget.product["name"] &&
                          cartItem["topping"] == selectedTopping) {
                        cartItem["qty"] += quantity;
                        exists = true;
                        break;
                      }
                    }

                    if (!exists) {
                      CartData.items.add({
                        "name": widget.product["name"],
                        "topping": selectedTopping,
                        "price": price,
                        "qty": quantity,
                        "emoji": widget.product["image"],
                      });
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => KeranjangPage(
                          cartItems: CartData.items,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget buildVariant(String title) {
    return ChoiceChip(
      label: Text(title),
      selected: selectedTopping == title,
      onSelected: (value) {
        setState(() => selectedTopping = title);
      },
      selectedColor: Colors.pink.shade200,
      backgroundColor: Colors.pink.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}