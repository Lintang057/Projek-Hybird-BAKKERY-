// ============================
// lib/pages/history_page.dart
// ============================

import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffdfcbb5), // Warna cokelat/krem pastel atas
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 25),
            // Judul halaman bergaya klasik
            const Text(
              "Riwayat Pesanan",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'serif',
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),

            // Kontainer abu-abu melengkung di bagian bawah
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xffdbdbdb), // Warna latar belakang abu-abu sesuai mockup
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  children: [
                    // Menggunakan fungsi buildHistory milikmu yang sudah dipoles warnanya
                    buildHistory(
                      "Cookies Matcha Red Bean",
                      "10 Okt, 12.15",
                      "Rp 28.000",
                      "🍪", // Ditambahkan emoji agar tidak kosong
                    ),
                    buildHistory(
                      "The Cowboy Cookie",
                      "14 Okt, 10.10",
                      "Rp 21.000",
                      "🍩",
                    ),
                    buildHistory(
                      "French Toast Delight",
                      "27 Okt, 15.25",
                      "Rp 24.000",
                      "🍞",
                    ),
                    buildHistory(
                      "Bruno Mars Donuts",
                      "29 Okt, 13.56",
                      "Rp 18.000",
                      "🍩",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi pembantu milikmu dengan penyesuaian gaya & warna
  Widget buildHistory(
    String title,
    String date,
    String price,
    String emoji, // Ditambahkan parameter emoji untuk gambar kuenya
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffb59f95), // Warna kartu cokelat moka sesuai gambar kamu
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          // Kotak putih tempat foto menu kue
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            alignment: Alignment.center,
            child: Text(
              emoji,
              style: const TextStyle(fontSize: 35),
            ),
          ),
          const SizedBox(width: 14),

          // Area Teks Detail (Kiri) dan Tombol (Kanan Bawah)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tanggal pesanan (di paling atas menu)
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                
                // Nama Menu Kue
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                
                // Baris Harga dan Tombol "Pesan Lagi" oval kecil di bawahnya
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    // Tombol Oval Mini "pesan lagi" sesuai desain mockup
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xffe8ded4),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        "pesan lagi",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}