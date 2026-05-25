// ============================
// lib/widgets/bottom_navbar.dart
// ============================

import 'package:flutter/material.dart';

import '../pages/cart_page.dart';
import '../pages/history_page.dart';
import '../pages/home_page.dart';
import '../pages/profile_page.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {

  int currentIndex = 0;

  final List pages = const [

    HomePage(),
    CartPage(),
    HistoryPage(),
    ProfilePage(),

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: pages[currentIndex],

      bottomNavigationBar: Container(

        decoration: BoxDecoration(

          color: Colors.white,

          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
            )
          ],

          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),

        child: BottomNavigationBar(

          currentIndex: currentIndex,

          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },

          type: BottomNavigationBarType.fixed,

          backgroundColor: Colors.white,

          selectedItemColor: Colors.pink,

          unselectedItemColor: Colors.grey,

          selectedFontSize: 13,
          unselectedFontSize: 12,

          elevation: 0,

          items: const [

            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: "Home",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.payment_rounded),
              label: "Pembayaran",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.history_rounded),
              label: "Riwayat",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: "Profil",
            ),

          ],
        ),
      ),
    );
  }
}