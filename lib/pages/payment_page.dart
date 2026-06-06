import 'package:flutter/material.dart';
import '../data/history_data.dart';
import 'history_page.dart';

class PaymentPage extends StatefulWidget {
  final List<Map<String, dynamic>> items;

  const PaymentPage({
    super.key,
    required this.items,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedPayment = "";

  @override
  Widget build(BuildContext context) {
    int total = 0;

    for (var item in widget.items) {
      total += (item["price"] as num).toInt() *
          (item["qty"] as num).toInt();
    }

    Widget paymentItem(String id, String title, IconData icon, Color color) {
      bool isSelected = selectedPayment == id;

      return GestureDetector(
        onTap: () {
          setState(() {
            selectedPayment = id;
          });
        },
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.green.shade100 : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? Colors.green : Colors.grey,
                  width: 2,
                ),
              ),
              child: Icon(
                icon,
                size: 40,
                color: isSelected ? Colors.green : color,
              ),
            ),
            const SizedBox(height: 5),
            Text(title),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              // 🔙 BACK ICON
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              // PICK UP ORDER
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 247, 73, 116),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    "Pick Up Order - Ambil di Toko",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // INFO TOKO
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.red),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "A BAKKERY'S \n📍 Jarak ± 1,2 km\n🟢 Siap diambil setelah pesanan selesai",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // METODE PEMBAYARAN
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Metode Pembayaran:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Pilih Metode Pembayaran",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 15),
                                ListTile(
                                  leading: Icon(Icons.account_balance_wallet),
                                  title: Text("GoPay"),
                                ),
                                ListTile(
                                  leading: Icon(Icons.payment),
                                  title: Text("ShopeePay"),
                                ),
                                ListTile(
                                  leading: Icon(Icons.account_balance),
                                  title: Text("OVO"),
                                ),
                                ListTile(
                                  leading: Icon(Icons.account_balance),
                                  title: Text("BCA"),
                                ),
                                ListTile(
                                  leading: Icon(Icons.account_balance),
                                  title: Text("BRI"),
                                ),
                                ListTile(
                                  leading: Icon(Icons.account_balance),
                                  title: Text("BNI"),
                                ),
                                ListTile(
                                  leading: Icon(Icons.account_balance),
                                  title: Text("Mandiri"),
                                ),
                                ListTile(
                                  leading: Icon(Icons.account_balance_wallet),
                                  title: Text("DANA"),
                                ),
                                ListTile(
                                  leading: Icon(Icons.wallet),
                                  title: Text("LinkAja"),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: const Text(
                      "lihat semuanya",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // QUICK PAYMENT
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  paymentItem("gopay", "Gopay",
                      Icons.account_balance_wallet, Colors.blue),
                  paymentItem("shopee", "ShopeePay",
                      Icons.payment, Colors.orange),
                  paymentItem("ovo", "OVO",
                      Icons.account_balance, Colors.purple),
                ],
              ),

              const SizedBox(height: 20),

              // LIST + TOTAL (BIAR BISA SCROLL)
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      // LIST PESANAN
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(Icons.shopping_cart),
                                Text("Total ${widget.items.length} item"),
                              ],
                            ),
                            const Divider(color: Colors.black),
                            ...widget.items.map(
                              (item) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "${item['qty']}x ${item['name']}",
                                      ),
                                    ),
                                    Text(
                                      "Rp.${(item['price'] as num) *
                                          (item['qty'] as num)}",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // TOTAL
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Rp.$total",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),

              // ORDER BUTTON (SUDAH FIX)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    backgroundColor: Colors.pink,
                  ),
                  onPressed: () {
                    if (selectedPayment.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Pilih metode pembayaran terlebih dahulu",
                          ),
                        ),
                      );
                      return;
                    }

                    HistoryData.orders.addAll(widget.items);
                    Navigator.pop(context);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HistoryPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "ORDER NOW",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}