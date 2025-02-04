import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StepIndicator extends StatelessWidget {
  const StepIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _StepText('Email', isActive: true),
              _StepText('Name'),
              _StepText('Birthday'),
              _StepText('gender'),
              _StepText('pass'),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _StepDot(isActive: true),
            _StepDot(),
            _StepDot(),
            _StepDot(),
            _StepDot(),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: -16),
          width: 267,
          height: 4,
          color: const Color(0xFFD9D9D9),
        ),
      ],
    );
  }
}

class _StepText extends StatelessWidget {
  final String text;
  final bool isActive;

  const _StepText(this.text, {this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: isActive ? const Color(0xFF3181E5) : const Color(0xFFD9D9D9),
      ),
    );
  }
}

class _StepDot extends StatelessWidget {
  final bool isActive;

  const _StepDot({this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.5),
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : const Color(0xFFD3D3D3),
        shape: BoxShape.circle,
      ),
    );
  }
}