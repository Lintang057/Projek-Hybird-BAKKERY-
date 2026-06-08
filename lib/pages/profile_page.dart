import 'package:flutter/material.dart';
import 'history_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          children: [

            const SizedBox(height: 20),

            // ================= AVATAR
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
              "User Bakery",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "user@email.com",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 35),

            // ================= MENU
            buildMenu(
              context,
              Icons.info_outline_rounded,
              "About",
              () {
                showDialog(
                  context: context,
                  builder: (_) => const AlertDialog(
                    title: Text("About App"),
                    content: Text(
                      "Aplikasi Bakery sederhana untuk pemesanan makanan.",
                    ),
                  ),
                );
              },
            ),

            buildMenu(
              context,
              Icons.reviews_rounded,
              "Ulasan",
              () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Fitur ulasan belum tersedia"),
                  ),
                );
              },
            ),

            buildMenu(
              context,
              Icons.logout_rounded,
              "Logout",
              () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Logout"),
                    content: const Text("Yakin ingin keluar?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Batal"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text("Logout"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // ================= MENU WIDGET
  Widget buildMenu(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap,
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
          child: Icon(icon, color: Colors.pink),
        ),

        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 18,
        ),

        onTap: onTap,
      ),
    );
  }
}