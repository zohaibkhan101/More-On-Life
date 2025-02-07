import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moreonlife/password_screen.dart';
import 'sign_up_height_screen.dart';
import 'widgets/continue_button.dart';
import 'widgets/sign_up_progress_indicator.dart';
import 'widgets/dob_login_footer.dart';

class SignUpWeightScreen extends StatefulWidget {
  const SignUpWeightScreen({super.key});

  @override
  State<SignUpWeightScreen> createState() => _SignUpWeightScreenState();
}

class _SignUpWeightScreenState extends State<SignUpWeightScreen> {
  final TextEditingController _weightController = TextEditingController();
  String _selectedUnit = 'kg'; // Default unit

  void navigateToNextScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpHeightScreen()));
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
              Image.asset('assets/weight.png', width: 342),
              const SizedBox(height: 24),

              // Heading
              Text(
                'Enter your weight',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF36454F),
                ),
              ),
              const SizedBox(height: 32),

              // Progress Indicator - Highlights "Weight" step
              const SignUpProgressIndicator(currentStep: 3),
              const SizedBox(height: 57),

              // Weight Input
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Weight',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  DropdownButton<String>(
                    value: _selectedUnit,
                    items: <String>['kg', 'lbs'].map((String value) {
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
                isEnabled: _weightController.text.isNotEmpty,
                onTap: () {
                  if (_weightController.text.isNotEmpty) {
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