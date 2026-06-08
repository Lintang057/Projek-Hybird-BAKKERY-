import 'package:flutter/material.dart';
import 'payment_page.dart';

class ReorderPage extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const ReorderPage({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    int total = 0;

    for (var item in items) {
      total += (item["price"] as num).toInt() *
          (item["qty"] as num).toInt();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Beli Lagi"),
        backgroundColor: Colors.pink,
      ),

      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];

                return ListTile(
                  leading: Text(item["emoji"] ?? "🍩"),
                  title: Text(item["name"]),
                  subtitle: Text("Qty: ${item["qty"]}"),
                  trailing: Text(
                    "Rp ${item["price"] * item["qty"]}",
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Rp $total",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      padding: const EdgeInsets.all(15),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PaymentPage(items: items),
                        ),
                      );
                    },
                    child: const Text("Lanjut ke Pembayaran"),
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