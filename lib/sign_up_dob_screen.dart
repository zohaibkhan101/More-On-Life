import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart'; // For SVG
import 'package:google_fonts/google_fonts.dart';
import 'package:moreonlife/sign_up_gender_screen.dart';
import 'widgets/continue_button.dart';
import 'widgets/dob_date_input.dart';
import 'widgets/sign_up_progress_indicator.dart';
import 'widgets/dob_login_footer.dart';

class SignUpDobScreen extends StatefulWidget {
  const SignUpDobScreen({super.key});

  @override
  State<SignUpDobScreen> createState() => _SignUpDobScreenState();
}

class _SignUpDobScreenState extends State<SignUpDobScreen> {
  String selectedDate = ''; // To track the selected date

  void navigateToNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpGenderScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 48),

              // SVG Illustration
              // SvgPicture.asset(
              //   'assets/sign_up.svg', // Path to your SVG file
              //   width: 150,
              //   height: 150,
              // ),
              Image.asset('assets/DOB_SignUp.png', width: 342),
              const SizedBox(height: 24),

              // Heading
              Text(
                'Create account',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF36454F),
                ),
              ),
              const SizedBox(height: 32),

              // Progress Indicator - Highlights "DOB" step (Step 2)
              const SignUpProgressIndicator(currentStep: 2),
              const SizedBox(height: 57),

              // Date of Birth Input
              DateInput(
                selectedDate: selectedDate, // Pass the current selected date
                onDateSelected: (String date) {
                  setState(() {
                    selectedDate = date; // Update the selected date
                  });
                },
              ),
              const SizedBox(height: 32),

              // Continue Button
              ContinueButton(
                isEnabled: selectedDate.isNotEmpty, // Enable only if date is selected
                onTap: () {
                  if (selectedDate.isNotEmpty) {
                    navigateToNextScreen();
                  }
                },
              ),
              const SizedBox(height: 24),

              // Google Sign-In Button
              ElevatedButton.icon(
                onPressed: () {
                  // Handle Google Sign-In logic
                },
                icon: Image.asset(
                  'assets/google.png', // Path to your Google PNG icon
                  width: 24,
                  height: 24,
                ),
                label: Text(
                  'Sign in with Google',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF36454F), // Text color
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  backgroundColor: Colors.white, // Background color
                  side: const BorderSide(color: Color(0xFFD9D9D9)), // Border color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 72),

              // Footer
              const LoginFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
