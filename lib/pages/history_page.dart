import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  // Simulasi data histori yang aman
  final List<Map<String, dynamic>> orderHistory = [
    {
      "date": "05 Juni 2026",
      "items": "2x Donat Pinkan Mambo",
      "total": "Rp 16.000",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  ),
                );
              },
            ),
    );
  }
}