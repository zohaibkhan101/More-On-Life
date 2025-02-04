import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpProgressIndicator extends StatelessWidget {
  const SignUpProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 288,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildStepLabel('Email'),
              const SizedBox(width: 22),
              _buildStepLabel('Name'),
              const SizedBox(width: 22),
              _buildStepLabel('Birthday'),
              const SizedBox(width: 22),
              _buildStepLabel('gender'),
              const SizedBox(width: 22),
              _buildStepLabel('pass'),
            ],
          ),
          const SizedBox(height: 6),
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                      (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.5),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: Color(0xFFD3D3D3),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 267,
                  height: 4,
                  color: const Color(0xFFD9D9D9),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStepLabel(String label) {
    return Text(
      label,
      style: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: const Color(0xFFD9D9D9),
      ),
    );
  }
}