import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moreonlife/password_screen.dart';
import 'widgets/continue_button.dart';
import 'widgets/sign_up_progress_indicator.dart';
import 'widgets/dob_login_footer.dart';

class SignUpHeightScreen extends StatefulWidget {
  const SignUpHeightScreen({super.key});

  @override
  State<SignUpHeightScreen> createState() => _SignUpHeightScreenState();
}

class _SignUpHeightScreenState extends State<SignUpHeightScreen> {
  final TextEditingController _heightController = TextEditingController();
  String _selectedUnit = 'cm'; // Default unit

  void navigateToNextScreen() {
    // Implement navigation to the next screen
     Navigator.push(context, MaterialPageRoute(builder: (context)=>PasswordScreen()));
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
              SvgPicture.asset(
                'assets/sign_up.svg', // Path to your SVG file
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 24),

              // Heading
              Text(
                'Enter your height',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF36454F),
                ),
              ),
              const SizedBox(height: 32),

              // Progress Indicator - Highlights "Height" step
              const SignUpProgressIndicator(currentStep: 4),
              const SizedBox(height: 57),

              // Height Input
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Height',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  DropdownButton<String>(
                    value: _selectedUnit,
                    items: <String>['cm', 'inches'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedUnit = newValue!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Continue Button
              ContinueButton(
                isEnabled: _heightController.text.isNotEmpty,
                onTap: () {
                  if (_heightController.text.isNotEmpty) {
                    navigateToNextScreen();
                  }
                },
              ),
              const SizedBox(height: 24),

              // Footer
              const LoginFooter(),
            ],
          ),
        ),
      ),
    );
  }
} 