import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import '../database/database_helper.dart';
import 'product_detail_page.dart';
>>>>>>> 7e480cc (updategit branch -M main)

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
<<<<<<< HEAD
  // Simulasi data histori yang aman
  final List<Map<String, dynamic>> orderHistory = [
    {
      "date": "05 Juni 2026",
      "items": "2x Donat Pinkan Mambo",
      "total": "Rp 16.000",
    },
  ];
=======
  List<Map<String, dynamic>> history = [];

  @override
  void initState() {
    super.initState();
    loadHistory();
  }

  void loadHistory() async {
    final data = await DatabaseHelper.instance.getHistory();
    setState(() {
      history = data;
    });
  }
>>>>>>> 7e480cc (updategit branch -M main)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: AppBar(
        title: const Text("Riwayat Pesanan"),
        centerTitle: true,
      ),
      // Pengecekan aman: Jika orderHistory kosong, tampilkan pesan, jangan error
      body: orderHistory.isEmpty
          ? const Center(child: Text("Belum ada riwayat pesanan."))
          : ListView.builder(
              itemCount: orderHistory.length,
              itemBuilder: (context, index) {
                final order = orderHistory[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: const Icon(Icons.history, color: Colors.brown),
                    title: Text(order["date"] ?? "Tanggal tidak diketahui"),
                    subtitle: Text("${order["items"]}\nTotal: ${order["total"]}"),
                    isThreeLine: true,
=======
      appBar: AppBar(title: const Text("Riwayat Pesanan")),
      body: history.isEmpty
          ? const Center(child: Text("Belum ada pesanan"))
          : ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                final item = history[index];
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(item["image"], style: const TextStyle(fontSize: 30)),
                      const SizedBox(width: 10),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item["productName"],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(item["orderDate"]),
                        ],
                      ),
                    ],
                  ),

                  Column(
                    children: [

                      Text("Rp ${item["price"]}"),

                      const SizedBox(height: 8),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                        ),

                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductDetailPage(
                                product: {
                                  "name": item["productName"],
                                  "price": item["price"],
                                  "image": item["image"],
                                },
                              ),
                            ),
                          );
                        },

                        child: const Text(
                          "Beli Lagi",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              );

                return Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 5),
                    ],
                  ),
                  child: Row(
                    children: [
                      Text(item["image"], style: const TextStyle(fontSize: 30)),
                      const SizedBox(width: 10),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item["productName"],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(item["orderDate"]),
                          ],
                        ),
                      ),

                      Text("Rp ${item["price"]}"),
                    ],
>>>>>>> 7e480cc (updategit branch -M main)
                  ),
                );
              },
            ),
    );
  }
}