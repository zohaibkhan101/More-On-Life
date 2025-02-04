import 'package:flutter/material.dart';


class SocialSignUpSection extends StatelessWidget {
  const SocialSignUpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Handle Google Sign-Up action
            print("Google Sign-Up clicked");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Google Icon
              Image.asset(
                'assets/google.png', // Path to your Google PNG image
                width: 24, // Adjust the width as needed
                height: 24, // Adjust the height as needed
              ),
              const SizedBox(width: 12), // Space between the icon and text

              // "Sign Up with Google" Text
              Text(
                "Sign Up with Google",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF36454F), // Text color
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}