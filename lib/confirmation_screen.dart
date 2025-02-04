import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moreonlife/login_screen.dart';
import 'package:moreonlife/sign_up_confirmation_button.dart';

import 'widgets/sign_up_progress_indicator.dart';
import 'sign_up_confirmation_input.dart';

class ConfirmationScreen extends StatelessWidget {
  final int currentStep; // Dynamic current step

  const ConfirmationScreen({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 76),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SVG Header
              SvgPicture.asset(
                'assets/sign_up.svg',
                width: double.infinity,
                height: 150,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 27),

              // Title
              Text(
                'Enter Confirmation Code',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF36454F),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Dynamic Progress Indicator
              SignUpProgressIndicator(currentStep: currentStep),
              const SizedBox(height: 32),

              // Divider

              const SizedBox(height: 24),

              // Instruction Text
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: const [
                    TextSpan(text: 'Enter the 6-digit code we sent to\n'),
                    TextSpan(text: 'john@doe.com'),
                  ],
                ),
              ),
              const SizedBox(height: 23),

              // Resend Code Button
              TextButton(
                onPressed: () {
                  // Add resend functionality here
                },
                child: Text(
                  'Resend code',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 34),

              // Confirmation Input
              const ConfirmationInput(),
              const SizedBox(height: 32),

              // Confirm Button (Custom Button)
              ConfirmationButton(
                onPressed: () {
                  // Add confirmation functionality here, e.g., navigate to the next screen
                  print('Confirmation Button Pressed');
                  Navigator.push(context,
                      MaterialPageRoute(

                    builder: (context) => LoginScreen(),
                  ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
