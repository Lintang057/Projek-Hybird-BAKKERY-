// ============================
// lib/pages/success_page.dart
// ============================

import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Container(
                height: 140,
                width: 140,

                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  shape: BoxShape.circle,
                ),

                child: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 90,
                ),
              ),

              const SizedBox(height: 35),

              const Text(
                "Congratulation!!",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 15),

              const Text(
                "Your account is complete,\nplease enjoy your bakery menu from us",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 45),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),

                  onPressed: () {

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const BottomNavbar(),
                      ),
                          (route) => false,
                    );
                  },

                  child: const Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}