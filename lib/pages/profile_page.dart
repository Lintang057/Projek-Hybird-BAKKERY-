// ============================
// lib/pages/profile_page.dart
// ============================

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Profil"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(

          children: [

            const SizedBox(height: 20),

            Container(
              height: 110,
              width: 110,

              decoration: BoxDecoration(
                color: Colors.pink.shade100,
                shape: BoxShape.circle,
              ),

              child: const Icon(
                Icons.person,
                size: 60,
                color: Colors.pink,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Username",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "xxx@gmail.com",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 35),

            buildMenu(
              Icons.info_outline_rounded,
              "About",
            ),

            buildMenu(
              Icons.history_rounded,
              "Riwayat Pesanan",
            ),

            buildMenu(
              Icons.reviews_rounded,
              "Ulasan",
            ),

            buildMenu(
              Icons.logout_rounded,
              "Logout",
            ),

          ],
        ),
      ),
    );
  }

  Widget buildMenu(
      IconData icon,
      String title,
      ) {

    return Container(

      margin: const EdgeInsets.only(bottom: 18),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
          )
        ],
      ),

      child: ListTile(

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),

        leading: Container(

          padding: const EdgeInsets.all(10),

          decoration: BoxDecoration(
            color: Colors.pink.shade50,
            borderRadius: BorderRadius.circular(15),
          ),

          child: Icon(
            icon,
            color: Colors.pink,
          ),
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 18,
        ),

        onTap: () {},
      ),
    );
  }
}