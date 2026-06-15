import 'package:flutter/material.dart';
import 'login_page.dart';
import '../database/database_helper.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repasswordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    repasswordController.dispose();
    super.dispose();
  }

  Future<void> signUp() async {
    String username = usernameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String repassword = repasswordController.text.trim();

    // Cek field kosong
    if (username.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        repassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Semua data wajib diisi"),
        ),
      );
      return;
    }
final emailRegex =
    RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');

if (!emailRegex.hasMatch(email)) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text(
        "Masukkan email Gmail yang valid",
      ),
    ),
  );
  return;
}
    // Cek password sama
    if (password != repassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password dan Repassword tidak sama"),
        ),
      );
      return;
    }

    // Simpan ke database
    await DatabaseHelper.instance.insertUser({
      "username": username,
      "email": email,
      "password": password,
    });

    // Pindah halaman
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginPage(),
      ),
    );
  }

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
                controller: usernameController,
                hint: "Username",
                icon: Icons.person,
              ),

              const SizedBox(height: 20),

              buildField(
                controller: emailController,
                hint: "Email",
                icon: Icons.email,
              ),

              const SizedBox(height: 20),

              buildField(
                controller: passwordController,
                hint: "Password",
                icon: Icons.lock,
                obscure: true,
              ),

              const SizedBox(height: 20),

              buildField(
                controller: repasswordController,
                hint: "Repassword",
                icon: Icons.lock_outline,
                obscure: true,
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
                  onPressed: signUp,
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool obscure = false,
  }) {
    return TextField(
      controller: controller,
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