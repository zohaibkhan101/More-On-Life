import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moreonlife/assessment_detail_screen.dart';
import 'package:moreonlife/login_screen.dart';
import 'package:moreonlife/user_Profile.dart';
import 'package:moreonlife/user_controller.dart';
import 'package:moreonlife/utils.dart';

import 'Role.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late UserControllerProvider provider;
  bool isLoading = false;
  bool agreeToTerms = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    provider = UserControllerProvider();
  }

  Future<bool> createAccount() async {
    if (passwordController.text != confirmPasswordController.text) {
      Utils.showAlertPopup(context, "Error", "Passwords do not match");
      return false;
    }

    if (!agreeToTerms) {
      Utils.showAlertPopup(context, "Error", "You must agree to the terms and conditions");
      return false;
    }

    try {
      setState(() => isLoading = true);
      await provider.signupUser(
        email: emailController.text,
        password: passwordController.text,
      );

      // Send email verification
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }

      return true;
    } on FirebaseAuthException catch (e) {
      Utils.showAlertPopup(context, "Something went wrong", "Auth Error: ${e.message.toString()}");
      return false;
    } catch (e) {
      Utils.showAlertPopup(context, "Something went wrong!!", e.toString());
      return false;
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3550DC),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Section
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SvgPicture.asset(
                'assets/signup.svg',
                width: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.contain,
              ),
            ),
            // White Box Section
            Container(
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign Up",
                      style: GoogleFonts.montserrat(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF36454F),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Email Field
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Password Field
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Confirm Password Field
                    TextField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Agree to Terms and Conditions
                    Row(
                      children: [
                        Checkbox(
                          value: agreeToTerms,
                          onChanged: (value) {
                            setState(() {
                              agreeToTerms = value ?? false;
                            });
                          },
                          activeColor: const Color(0xFF3181E5),
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: 'I agree to the ',
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                color: const Color(0xFF36454F),
                              ),
                              children: [
                                TextSpan(
                                  text: 'Terms and Conditions',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    color: const Color(0xFF3181E5),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Sign Up Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () async {
                          bool success = await createAccount();
                          if (success) {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3181E5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : Text(
                          'Sign Up',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Login Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: const Color(0xFF36454F),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text(
                            ' Login here',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: const Color(0xFF3181E5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}