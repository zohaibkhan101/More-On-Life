import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContinueButton extends StatelessWidget {

  final bool isEnabled;
  final VoidCallback? onTap; // Added callback for functionality

  const ContinueButton({
    super.key,
    required this.isEnabled,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null, // Make clickable only if enabled
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: isEnabled ? const Color(0xFF3181E5) : Colors.transparent,
          border: Border.all(
            color: isEnabled ? Colors.transparent : const Color(0xFFD3D3D3),
          ),
        ),
        child: Center(
          child: Text(
            'Continue',
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: isEnabled ? Colors.white : const Color(0xFFD3D3D3),
            ),
          ),
        ),
      ),

    );
  }
}
