import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moreonlife/sign_up.dart';
import 'firebase_options.dart';
import 'login_screen.dart';
import 'otp_screen.dart';
import 'signal.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.where((app) => app.name == '[DEFAULT]').isEmpty) {
    //await Firebase.initializeApp();
    await Firebase.initializeApp(//options: DefaultFirebaseOptions.currentPlatform
       );
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF3550DC),
      foregroundColor: Colors.white,
    ),
  );

  final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.indigo,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[900],
      foregroundColor: Colors.white,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'More to Life',
      debugShowCheckedModeBanner: false,
      theme: _lightTheme,
      darkTheme: _darkTheme,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: LoginScreen(),
      onGenerateRoute: (settings) {
        if (settings.name == '/otp') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => OtpScreen(email: args['email']),
          );
        }
        if (settings.name == '/sign_up') {
          return MaterialPageRoute(
            builder: (context) => const SignUpScreen(),
          );
        }
        return null;
      },
    );
  }
}