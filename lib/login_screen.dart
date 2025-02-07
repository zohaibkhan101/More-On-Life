import 'package:flutter/material.dart';
import 'package:moreonlife/assessment_detail_screen.dart';
//import 'package:moreonlife/sign_up.dart';
import 'package:moreonlife/sign_up_email_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Updated background color
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16), // Rounded corners
                child: Image.asset('assets/loginImage.png', width: 342),
              ),
              SizedBox(height: 30),
              Text("Log in", style: TextStyle(color: Color(0xFF36454F), fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Johndoe@example.com',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  contentPadding: EdgeInsets.all(12),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              Text("Password", style: TextStyle(color: Color(0xFF36454F), fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  contentPadding: EdgeInsets.all(12),
                ),
                obscureText: true,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  String email = emailController.text.trim();
                  String password = passwordController.text.trim();

                  if (email.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter your email')));
                  } else if (password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter your password')));
                  } else {
                    // Navigator.pushNamed(
                      // context,
                      // '/otp',
                      // arguments: {'email': email},
                    // );
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF3181E5), minimumSize: Size(double.infinity, 50)),
                child: Text("Log in", style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 30),
              Text("Log in with", style: TextStyle(color: Color(0xFF36454F), fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Image.asset('assets/google.png', width: 28, height: 28),
              SizedBox(height: 31),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No account?", style: TextStyle(color: Color(0xFF36454F), fontSize: 14)),
                  GestureDetector(
                    onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpEmailScreen()));
                      // Navigator.pushNamed(context, '/sign_up');()
                    },
                    child: Text(" Sign up", style: TextStyle(color: Color(0xFF3181E5), fontWeight: FontWeight.bold, fontSize: 14)),
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
