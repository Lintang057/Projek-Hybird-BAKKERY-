import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'history_page.dart';

class QRPage extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final String paymentMethod;
  final int total;

  const QRPage({
    super.key,
    required this.items,
    required this.paymentMethod,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    // isi QR (bisa nanti diganti dari backend / invoice id)
    final String qrData = "PAY|$paymentMethod|$total";

    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Payment"),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "Scan untuk pembayaran",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // QR CODE
            QrImageView(
              data: qrData,
              size: 220,
              version: QrVersions.auto,
            ),

            const SizedBox(height: 20),

            Text("Metode: $paymentMethod"),
            Text("Total: Rp.$total"),

            const SizedBox(height: 30),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HistoryPage()
                  ),
                  (route) => false,
                );
              },
              child: const Text("Selesai"),
            ),
          ],
        ),
      ),
    );
  }
}