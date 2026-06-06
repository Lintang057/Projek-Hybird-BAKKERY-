import 'package:flutter/material.dart';
import 'payment_page.dart';

class KeranjangPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const KeranjangPage({
    super.key,
    required this.cartItems,
  });

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  late List<Map<String, dynamic>> cartItems;

  @override
  void initState() {
    super.initState();
    cartItems = widget.cartItems;
  }

  int get totalHarga {
    return cartItems.fold(
      0,
      (sum, item) =>
          sum +
          ((item["price"] as int) *
              (item["qty"] as int)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 250, 234, 240),

      appBar: AppBar(
        title: const Text("Pembayaran"),
        centerTitle: true,
        backgroundColor:
            const Color.fromARGB(255, 223, 136, 165),
        foregroundColor: Colors.white,
      ),

      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                "Keranjang Kosong",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];

                return Container(
                  margin:
                      const EdgeInsets.only(bottom: 15),
                  padding:
                      const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Text(
                        item["emoji"] ?? "🍩",
                        style: const TextStyle(
                          fontSize: 40,
                        ),
                      ),

                      const SizedBox(width: 15),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              item["name"],
                              style:
                                  const TextStyle(
                                fontWeight:
                                    FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),

                            if (item["topping"] !=
                                    null &&
                                item["topping"]
                                    .toString()
                                    .isNotEmpty)
                              Text(
                                "Topping: ${item["topping"]}",
                              ),

                            Text(
                              "Rp ${item["price"]}",
                            ),
                          ],
                        ),
                      ),

                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.remove_circle,
                            ),
                            color: Colors.pink,
                            onPressed: () {
                              setState(() {
                                if (item["qty"] >
                                    1) {
                                  item["qty"]--;
                                }
                              });
                            },
                          ),

                          Text(
                            "${item["qty"]}",
                            style:
                                const TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          IconButton(
                            icon: const Icon(
                              Icons.add_circle,
                            ),
                            color: Colors.pink,
                            onPressed: () {
                              setState(() {
                                item["qty"]++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding:
                  const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Rp $totalHarga",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color.fromARGB(
                          255, 250, 51, 117),
                  foregroundColor:
                      Colors.white,
                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(
                            20),
                  ),
                ),
                onPressed:
                    cartItems.isEmpty
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    PaymentPage(
                                  items:
                                      cartItems,
                                ),
                              ),
                            );
                          },
                child: const Text(
                  "Checkout Sekarang",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}