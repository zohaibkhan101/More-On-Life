import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart'; // Import the SVG package
import 'package:google_fonts/google_fonts.dart';
import 'package:moreonlife/sign_up_name_screen.dart';

// Import your custom widgets
import 'widgets/sign_up_progress_indicator.dart';
import 'widgets/email_input.dart';
import 'widgets/continue_button.dart';
import 'widgets/social_sign_up.dart';
import 'widgets/login_prompt.dart';

class SignUpEmailScreen extends StatefulWidget {
  const SignUpEmailScreen({super.key});

  @override
  _SignUpEmailScreenState createState() => _SignUpEmailScreenState();
}

class _SignUpEmailScreenState extends State<SignUpEmailScreen> {
  bool isEmailValid = false; // State to track whether email is valid

  // Callback for handling changes in email validity
  void _onEmailValidChanged(bool isValid) {
    setState(() {
      isEmailValid = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              // Logo SVG Asset
              SvgPicture.asset(
                'assets/sign_up.svg', // Path to your SVG logo
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 30),

              // "Create Account" Heading
              Text(
                'Create account',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF36454F),
                ),
              ),
              const SizedBox(height: 30),

              // Progress Indicator - Highlighting Email Step (Step 0)
              const SignUpProgressIndicator(currentStep: 0),
              const SizedBox(height: 45),

              // Email Input Form with Callback
              EmailInputForm(onEmailValid: _onEmailValidChanged),
              const SizedBox(height: 31),

              // Continue Button
              ContinueButton(
                isEnabled: isEmailValid, // Enable only if the email is valid
                onTap: () {
                  if (isEmailValid) {
                    // Navigate to SignUpNameScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpNameScreen(),
                      ),
                    );
                  }
                },
              ),

              const SizedBox(height: 31),

              // Social Sign Up Section
              const SocialSignUpSection(),
              const SizedBox(height: 14),

              // Divider
              const Divider(color: Color(0xFFD9D9D9)),
              const SizedBox(height: 16),

              // Login Prompt
              const LoginPrompt(),
            ],
          ),
        ),
      ),
    );
  }
}
