import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // For SVG support
import 'package:google_fonts/google_fonts.dart';
import 'package:moreonlife/SignUpWeightScreen.dart';
import 'password_screen.dart'; // Import the PasswordScreen

class SignUpGenderScreen extends StatefulWidget {
  const SignUpGenderScreen({super.key});

  @override
  State<SignUpGenderScreen> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<SignUpGenderScreen> {
  String selectedGender = 'Select your gender'; // Default dropdown value
  bool isGenderSelected = false; // Used to enable/disable Continue button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),

            // SVG Illustration (sign_up.svg)
            SvgPicture.asset(
              'assets/sign_up.svg', // Path to your SVG file
              width: 342,
              
            ),
            const SizedBox(height: 24),

            // "Gender" Label and Dropdown
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gender',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF36454F),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 288),
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFFD3D3D3),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedGender == 'Select your gender' ? null : selectedGender,
                        hint: Text(
                          'Select your gender',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: const Color(0xFF36454F).withOpacity(0.5),
                          ),
                        ),
                        isExpanded: true,
                        items: ['Male', 'Female'].map((String gender) {
                          return DropdownMenuItem<String>(
                            value: gender,
                            child: Text(
                              gender,
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                color: const Color(0xFF36454F),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedGender = newValue!;
                            isGenderSelected = true; // Enable Continue button
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          size: 32,
                          color: Color(0xFF36454F),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Continue Button
            SizedBox(
              width: 288,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isGenderSelected
                      ? const Color(0xFF3181E5)
                      : const Color(0xFFB0C4DE), // Disabled color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: isGenderSelected
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpWeightScreen(),
                    ),
                  );
                }
                    : null,
                child: Text(
                  'Continue',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Divider with "or" text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: Divider(
                    color: Color(0xFFD9D9D9),
                    thickness: 1,
                    indent: 48,
                    endIndent: 8,
                  ),
                ),
                Text(
                  'or',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF36454F),
                  ),
                ),
                const Expanded(
                  child: Divider(
                    color: Color(0xFFD9D9D9),
                    thickness: 1,
                    indent: 8,
                    endIndent: 48,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Sign up with Google Button
            SizedBox(
              width: 288,
              height: 48,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(
                      color: Color(0xFFD9D9D9),
                    ),
                  ),
                ),
                onPressed: () {
                  // Google sign-up logic
                  print('Sign up with Google');
                },
                icon: Image.asset(
                  'assets/google.png', // Path to Google icon
                  width: 24,
                  height: 24,
                ),
                label: Text(
                  'Sign up with Google',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF36454F),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
