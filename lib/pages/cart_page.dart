import 'package:flutter/material.dart';
import 'payment_page.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final VoidCallback onClear;

  const CartPage({
    super.key,
    required this.items,
    required this.onClear,
  });

  int get totalHarga {
    return items.fold(
      0,
      (sum, item) =>
          sum + ((item["price"] as int) * (item["qty"] as int)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 250, 234, 240),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          // TOTAL BOX
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Rp $totalHarga",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // BUTTON PAYMENT
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 250, 51, 117),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: items.isEmpty
                  ? null
                  : () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PaymentPage(
                            items: items,
                          ),
                        ),
                      );
                      if (result == true) {
                        onClear();
                      }
                    },
              child: const Text(
                "Pembayaran",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}