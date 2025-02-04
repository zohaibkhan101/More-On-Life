import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'assessment_detail_screen.dart';
import 'widgets/otp_input.dart';
import 'widgets/confirm_button.dart';

class OtpScreen extends StatelessWidget {
  final String email;

  const OtpScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 145),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200, // Set a specific height for the SVG image
                child: SvgPicture.asset(
                  'assets/otp_screen.svg',
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 27),
              Text(
                'OTP',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF36454F),
                  fontFamily: 'Montserrat',
                ),
              ),
              const SizedBox(height: 40),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                  ),
                  children: [
                    const TextSpan(text: 'Enter the 6-digit code we sent to\n'),
                    TextSpan(text: email),
                  ],
                ),
              ),
              const SizedBox(height: 23),
              GestureDetector(
                onTap: () {
                  // Resend code logic here
                },
                child: const Text(
                  'Resend code',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              const SizedBox(height: 34),
              OtpInput(),
              const SizedBox(height: 32),
              ConfirmButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
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
