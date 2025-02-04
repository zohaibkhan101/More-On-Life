import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderSelector extends StatelessWidget {
  const GenderSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 51),
          child: Text(
            'Gender',
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF36454F),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          constraints: const BoxConstraints(maxWidth: 288),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFFD3D3D3),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Select your gender',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: const Color(0xFF36454F).withOpacity(0.5),
                ),
              ),
              const Icon(
                Icons.arrow_drop_down,
                size: 32,
                color: Color(0xFF36454F),
              ),
            ],
          ),
        ),
      ],
    );
  }
}