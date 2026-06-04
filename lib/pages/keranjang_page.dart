// ============================
// lib/pages/keranjang_page.dart (PILIHAN EMOJI)
// ============================

import 'package:flutter/material.dart';
import 'payment_page.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({super.key});

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  // DATA SINKRON: Menggunakan emoji bulat besar yang sama dengan halaman Home
  List<Map<String, dynamic>> cartItems = [
    {
      "name": "Donat Pinkan Mambo",
      "price": 8000,
      "qty": 1,
      "image": "🍩"
    },
    {
      "name": "The Cowboy Cookie",
      "price": 10000,
      "qty": 1,
      "image": "🍪"
    },
    {
      "name": "Croissant Strawberry",
      "price": 15000,
      "qty": 1,
      "image": "🥐"
    },
  ];

  int calculateTotal() {
    int total = 0;
    for (var item in cartItems) {
      total += (item["price"] as int) * (item["qty"] as int);
    }
    return total;
  }

  String formatRupiah(int number) {
    String str = number.toString();
    String result = '';
    int count = 0;
    for (int i = str.length - 1; i >= 0; i--) {
      result = str[i] + result;
      count++;
      if (count == 3 && i != 0) {
        result = '.' + result;
        count = 0;
      }
    }
    return 'Rp ' + result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffdfcbb5), 
      appBar: AppBar(
        title: const Text(
          "Keranjang Belanja",
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'serif'),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: Color(0xffdbdbdb), 
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: cartItems.isEmpty
                  ? const Center(child: Text("Keranjang kamu kosong nih 🛒"))
                  : ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 14),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xffb59f95), 
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              // MENAMPILKAN EMOJI PERSIS SEPERTI DI HOME
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  item["image"],
                                  style: const TextStyle(fontSize: 35), // Ukuran pas untuk list keranjang
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item["name"],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                      maxLines: 2,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      formatRupiah(item["price"]),
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (item["qty"] > 1) {
                                          item["qty"]--;
                                        } else {
                                          cartItems.removeAt(index);
                                        }
                                      });
                                    },
                                    child: const Icon(Icons.remove_circle_outline, color: Colors.white70, size: 26),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      "${item["qty"]}",
                                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        item["qty"]++;
                                      });
                                    },
                                    child: const Icon(Icons.add_circle_outline, color: Colors.white70, size: 26),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ),
          Container(
            color: const Color(0xffdbdbdb),
            padding: const EdgeInsets.fromLTRB(25, 10, 25, 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Pembayaran:",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    Text(
                      formatRupiah(calculateTotal()),
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pink),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffb59f95),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      elevation: 0,
                    ),
                    onPressed: cartItems.isEmpty
                        ? null 
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentPage(totalHarga: calculateTotal()),
                              ),
                            );
                          },
                    child: const Text(
                      "Checkout",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}