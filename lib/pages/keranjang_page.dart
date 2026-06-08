import 'package:flutter/material.dart';
import 'payment_page.dart';
import 'product_detail_page.dart'; // <-- WAJIB IMPORT

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({super.key});

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  List<Map<String, dynamic>> cartItems = [
    {
      "name": "Donat Pinkan Mambo",
      "price": 9000,
      "qty": 1,
      "emoji": "🍩",
    },
    {
      "name": "Cookies Matcha Red",
      "price": 7000,
      "qty": 1,
      "emoji": "🍪",
    },
    {
      "name": "Croissant Strawberry",
      "price": 8000,
      "qty": 1,
      "emoji": "🥐",
    },
  ];

  int get totalHarga {
    return cartItems.fold(
      0,
      (sum, item) => sum + (item["price"] * item["qty"]) as int,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // <-- FIX NAVIGASI
          },
        ),
        centerTitle: true,
<<<<<<< HEAD
        title: const Text(
          "Keranjang",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
=======
        backgroundColor:
            Colors.pink,
        foregroundColor: Colors.white,
>>>>>>> 7e480cc (updategit branch -M main)
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: cartItems.length,
        itemBuilder: (ctx, i) {
          final item = cartItems[i];

          return Dismissible(
            key: Key(item['name']),
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              color: Colors.red,
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              setState(() => cartItems.removeAt(i));
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                leading: Text(
                  item["emoji"],
                  style: const TextStyle(fontSize: 30),
                ),
                title: Text(
                  item["name"],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Rp${item['price']}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () => setState(() {
                        if (item["qty"] > 1) item["qty"]--;
                      }),
                    ),
                    Text("${item['qty']}"),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: () => setState(() => item["qty"]++),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // TOTAL BOX (biar rapi kayak kamu minta sebelumnya)
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Rp$totalHarga",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                padding: const EdgeInsets.all(15),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PaymentPage(items: cartItems),
                ),
              ),
              child: const Text(
                "Checkout Sekarang",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}