// ============================
// lib/pages/signup_page.dart
// ============================

import 'package:flutter/material.dart';
import 'success_page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: Padding(
          padding: const EdgeInsets.all(24),

          child: ListView(

            children: [

              const SizedBox(height: 40),

              const Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),

              buildField(
                "Username",
                Icons.person,
              ),

              const SizedBox(height: 20),

              buildField(
                "Email",
                Icons.email,
              ),

              const SizedBox(height: 20),

              buildField(
                "Password",
                Icons.lock,
                true,
              ),

              const SizedBox(height: 20),

              buildField(
                "Repassword",
                Icons.lock_outline,
                true,
              ),

              const SizedBox(height: 35),

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

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SuccessPage(),
                      ),
                    );
                  },

                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  const Text("Already have account? "),

                  GestureDetector(

                    onTap: () {
                      Navigator.pop(context);
                    },

                    child: const Text(
                      "Log in",
                      style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )

                ],
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget buildField(
      String hint,
      IconData icon,
      [bool obscure = false]
      ) {

    return TextField(

      obscureText: obscure,

      decoration: InputDecoration(

        hintText: hint,

        prefixIcon: Icon(icon),

        filled: true,
        fillColor: Colors.white,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),

        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
        ),
      ),
    );
  }
}