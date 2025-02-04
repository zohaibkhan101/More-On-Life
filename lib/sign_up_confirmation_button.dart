import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmationButton extends StatelessWidget {
  final VoidCallback? onPressed; // To handle button tap

  const ConfirmationButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Execute the provided callback on tap
      child: Container(
        width: 288,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), // Rounded edges
          gradient: const LinearGradient(
            colors: [Color(0xFF3181E5), Color(0xFF4FACFE)], // Gradient colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 3), // Shadow direction
              blurRadius: 6, // Smoothness
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          'Confirm',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white, // White text for contrast
          ),
        ),
      ),
    );
  }
}
