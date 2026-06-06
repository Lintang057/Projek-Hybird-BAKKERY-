import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {
  final VoidCallback onGoogleTap;
  final VoidCallback onAppleTap;
  const SocialButtons({
    super.key,
    required this.onGoogleTap,
    required this.onAppleTap,
  });

  @override
  Widget build(BuildContext context) {
    // each button is a rounded rectangle with icon center-left
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onGoogleTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
              side: const BorderSide(color: Color(0xFFE6E6E6)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/image/google.png', width: 24, height: 24),
                const SizedBox(width: 10),
                const Text('Google', style: TextStyle(color: Colors.black87)),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: onAppleTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
              side: const BorderSide(color: Color(0xFFE6E6E6)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/image/apple.png', width: 24, height: 24),
                const SizedBox(width: 10),
                const Text('Apple', style: TextStyle(color: Colors.black87)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
