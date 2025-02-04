import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPrompt extends StatelessWidget {

  const LoginPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Have an account?',
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF36454F),
          ),
        ),
        const SizedBox(width: 4),
        TextButton(
          onPressed: () {
            // Handle login navigation
          },
          child: Text(
            'Log in',
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF3181E5),
            ),
          ),
        ),
      ],
    );
  }
}