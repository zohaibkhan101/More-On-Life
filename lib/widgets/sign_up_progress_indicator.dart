import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpProgressIndicator extends StatelessWidget {
  final int currentStep; // Current active step (0-based index)

  const SignUpProgressIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Labels for progress indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var label in ['Email', 'Name', 'Birthday', 'Gender', 'Pass'])
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Text(
                  label,
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFD9D9D9),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 6),
        Stack(
          alignment: Alignment.center,
          children: [
            // Progress line
            Positioned(
              top: 14,
              left: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                height: 4,
                color: const Color(0xFFD9D9D9),
              ),
            ),
            // Circles for steps
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                    (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.5),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: index <= currentStep
                          ? const Color(0xFF3181E5) // Highlighted color for completed/active steps
                          : const Color(0xFFD3D3D3), // Default color for remaining steps
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
