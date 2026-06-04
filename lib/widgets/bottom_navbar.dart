// ============================
// lib/widgets/bottom_navbar.dart
// ============================

import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/keranjang_page.dart';
import '../pages/history_page.dart'; // Mengundang halaman riwayat yang baru dibuat

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const KeranjangPage(), // Halaman pertama (ikon keranjang/wadah kue)
      const HomePage(),      // Halaman kedua (ikon rumah)
      const HistoryPage(),   // Halaman ketiga (ikon profil/riwayat)
    ];

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: pages,
      ),
      bottomNavigationBar: Container(
        color: const Color(0xff5d4037), // Latar belakang cokelat tua sesuai gambar mockup Anda
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: BottomNavigationBar(
              backgroundColor: const Color(0xff5d4037), // Cokelat tua melamar tema bakery
              elevation: 0,
              currentIndex: currentIndex,
              showSelectedLabels: false,   // Hilangkan teks label agar hanya ikon murni
              showUnselectedLabels: false, // Sesuai dengan gambar mockup Anda
              selectedItemColor: Colors.white, // Ikon aktif warna putih terang
              unselectedItemColor: const Color(0xffa1887f), // Ikon mati warna cokelat muda pudar
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                  );
                });
              },
              // LOGO IKON DISESUAIKAN DENGAN GAMBAR TOOLS BAR ANDA
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined, size: 32), // Representasi wadah kue/keranjang kiri
                  activeIcon: Icon(Icons.shopping_bag, size: 32),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined, size: 34), // Ikon rumah tengah
                  activeIcon: Icon(Icons.home_rounded, size: 34),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_rounded, size: 32), // Ikon profil kanan untuk riwayat
                  activeIcon: Icon(Icons.person_rounded, size: 32),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}