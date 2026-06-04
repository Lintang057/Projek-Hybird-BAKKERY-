import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'login_page.dart';

class CoverPage extends StatelessWidget {
  const CoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [

          Image.asset(
            'assets/images/cover.jpeg',
            fit: BoxFit.cover,
          ),

          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Spacer(),

              // LOGO
              Image.asset(
                'assets/images/logo.png',
                height: 150,
              ),

              const SizedBox(height: 1),

              const Text(
                "Bakery's",
                style: TextStyle(
                  color: Color.fromARGB(255, 223, 201, 162),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Fresh Bread Everyday",
                style: TextStyle(
                  color: Color.fromARGB(255, 223, 201, 162),
                  fontSize: 18,
                ),
              ),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.all(55),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 218, 138, 85),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text("Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18),
                    ),
              ),
              ),
              ),

            ],
          )
        ],
      ),
    );
  }
}