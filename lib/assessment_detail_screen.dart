import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:moreonlife/login_screen.dart';
import 'package:moreonlife/sign_up_dob_screen.dart'; // Import the SignUpDobScreen
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences
import 'widgets/assessment_header.dart';
import 'widgets/NavBar.dart';

import 'package:moreonlife/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'More to Life',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(), // Set the initial screen to LoginScreen
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isDarkMode = false;
  bool _isFirstVisit = true; // Simulate first visit check

  @override
  void initState() {
    super.initState();
    _checkFirstVisit();
  }

  Future<void> _checkFirstVisit() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstVisit = prefs.getBool('isFirstVisit') ?? true;

    if (isFirstVisit) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showProfileCompletionPrompt();
      });
      await prefs.setBool('isFirstVisit', false);
    }
  }

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  void _showProfileCompletionPrompt() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Complete Your Profile',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'To get the best experience, please complete your profile.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the bottom sheet
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpDobScreen()),
                    );
                  },
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode ? Colors.black : Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AssessmentHeader(
                    isDarkMode: _isDarkMode,
                    onThemeToggle: _toggleTheme,
                  ),
                  const HomeContent(),
                ],
              ),
            ),
          ),
          const BottomNavBar(), // Add the bottom navigation bar
        ],
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int? touchedIndex;

  // Dummy data for recommendations
  final List<Map<String, dynamic>> recommendations = [
    {
      'icon': Icons.self_improvement,
      'title': '5-Minute Mindfulness',
      'subtitle': 'Take a moment to breathe and relax.',
    },
    {
      'icon': Icons.article,
      'title': 'Read: "Overcoming Anxiety"',
      'subtitle': 'A guide to managing daily stress.',
    },
    {
      'icon': Icons.music_note,
      'title': 'Calming Playlist',
      'subtitle': 'Listen to soothing music.',
    },
    {
      'icon': Icons.emoji_objects,
      'title': 'Daily Affirmation',
      'subtitle': 'You are stronger than you think.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
            // Motivational Quote
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFE3F2FD),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '"The journey of a thousand miles begins with one step."',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF333333),
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Which Assessment Would You Like to Take?',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF333333),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 250,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 5,
                  centerSpaceRadius: 60,
                  sections: _generateSections(),
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, PieTouchResponse? touchResponse) {
                      setState(() {
                        if (event is FlTapUpEvent) {
                          touchedIndex = touchResponse?.touchedSection?.touchedSectionIndex;
                          if (touchedIndex == 2) { // Assuming index 2 is for Fitness
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const WellnessAssessmentScreen()),
                            );
                          }
                        } else {
                          touchedIndex = -1;
                        }
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Recommendations Section
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recommendations for You',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF333333),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: recommendations.length,
              itemBuilder: (context, index) {
                final item = recommendations[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Icon(item['icon'], color: const Color(0xFF3181E5)),
                    title: Text(
                      item['title'],
                      style: const TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF333333),
                      ),
                    ),
                    subtitle: Text(
                      item['subtitle'],
                      style: const TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 14,
                        color: Color(0xFF666666),
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Handle recommendation tap
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> _generateSections() {
    final List<IconData> icons = [
      Icons.psychology, // Mind
      Icons.favorite,   // Body
      Icons.directions_run, // Fitness
      Icons.restaurant, // Nutrition
      Icons.auto_awesome, // Habits
    ];

    final List<LinearGradient> gradientColors = [
      LinearGradient(
        colors: [Color(0xFF6A11CB), Color(0xFF2575FC)], // Blue to Purple
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      LinearGradient(
        colors: [Color(0xFF00C9A7), Color(0xFF00D2FF)], // Green to Teal
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      LinearGradient(
        colors: [Color(0xFFFF8C42), Color(0xFFFFD700)], // Orange to Yellow
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      LinearGradient(
        colors: [Color(0xFFFF007F), Color(0xFFFF6B6B)], // Pink to Magenta
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      LinearGradient(
        colors: [Color(0xFF00FFFF), Color(0xFF00BFFF)], // Cyan to Blue
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ];

    return List.generate(icons.length, (index) {
      final isTouched = index == touchedIndex;
      final double radius = isTouched ? 60 : 50;

      return PieChartSectionData(
        color: Colors.transparent,
        value: 20,
        title: '',
        radius: radius,
        titleStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        gradient: gradientColors[index],
        badgeWidget: _buildIconBadge(icons[index]),
        badgePositionPercentageOffset: 0.55,
      );
    });
  }

  Widget _buildIconBadge(IconData icon) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.2),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 24,
      ),
    );
  }
}