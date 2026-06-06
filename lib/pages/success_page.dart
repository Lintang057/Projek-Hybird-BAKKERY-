import 'package:flutter/material.dart';
import '../main.dart'; 

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
              // DESAIN ASLIMU DIPERTAHANKAN
              Container(height: 140, width: 140, decoration: BoxDecoration(color: Colors.green.shade100, shape: BoxShape.circle), child: const Icon(Icons.check_circle, color: Colors.green, size: 90)),
              const SizedBox(height: 35),
              const Text("Congratulation!!", style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
              const SizedBox(height: 45),
              SizedBox(
                width: double.infinity, height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                  onPressed: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const MainPage()), (route) => false),
                  child: const Text("Next"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}