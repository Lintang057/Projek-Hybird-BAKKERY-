// ============================
// lib/pages/history_page.dart
// ============================

import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Riwayat Pesanan"),
      ),

      body: ListView(

        padding: const EdgeInsets.all(20),

        children: [

          buildHistory(
            "Cookies Matcha Red Bean",
            "10 Okt, 12.15",
            "Rp 28.000",
          ),

          buildHistory(
            "French Toast Delight",
            "27 Okt, 15.25",
            "Rp 24.000",
          ),

          buildHistory(
            "Bruno Mars Donuts",
            "29 Okt, 13.56",
            "Rp 18.000",
          ),

        ],
      ),
    );
  }

  Widget buildHistory(
      String title,
      String date,
      String price,
      ) {

    return Container(

      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(

        children: [

          const CircleAvatar(radius: 30),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(date),

              ],
            ),
          ),

          Column(
            children: [

              Text(price),

              ElevatedButton(
                onPressed: () {},
                child: const Text("Pesan Lagi"),
              )

            ],
          )
        ],
      ),
    );
  }
}