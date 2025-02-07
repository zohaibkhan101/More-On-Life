import 'package:flutter/material.dart';
// Import the SVG package
import 'package:google_fonts/google_fonts.dart';
import 'package:moreonlife/sign_up_dob_screen.dart'; // Import the next screen
import 'widgets/sign_up_progress_indicator.dart';
import 'widgets/continue_button.dart';
import 'widgets/custom_text_field.dart';

class SignUpNameScreen extends StatefulWidget {
  const SignUpNameScreen({super.key});

  @override
  State<SignUpNameScreen> createState() => _SignUpNameScreenState();
}

class _SignUpNameScreenState extends State<SignUpNameScreen> {
  bool isNameValid = false; // To enable/disable the button based on validation

  // Validation logic for name input
  void validateName(String value) {
    setState(() {
      isNameValid = value.isNotEmpty && value.length > 2; // Example: Name > 2 chars
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16), // Consistent padding
          constraints: const BoxConstraints(maxWidth: 480),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32), // Adjust spacing

              
              Image.asset('assets/Name_SignUp.png', width: 342),
              ////////,
              const SizedBox(height: 24),

              // "Create Account" Heading
              Text(
                'Create account',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF36454F),
                ),
              ),
              const SizedBox(height: 32),

              // Progress Indicator - Highlights "Name" step (Step 1)
              const SignUpProgressIndicator(currentStep: 1),
              const SizedBox(height: 57),

              // Name Input Field
              CustomTextField(
                label: 'Your Full Name',
                hintText: 'John Doe',
                onChanged: validateName, // Call validation logic here
              ),
              const SizedBox(height: 32),

              // Continue Button
              ContinueButton(
                isEnabled: isNameValid, // Enable only if name is valid
                onTap: () {
                  if (isNameValid) {
                    // Navigate to the next screen (e.g., Date of Birth Screen)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpDobScreen(),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 72),

              // Divider
              const Divider(
                color: Color(0xFFD9D9D9),
                thickness: 1,
                indent: 96,
                endIndent: 96,
              ),
              const SizedBox(height: 16),

              // Login Prompt
              Row(
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
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login'); // Replace with your route
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
