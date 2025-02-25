import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:moreonlife/login_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets/NavBar.dart';

class RecommendationsScreen extends StatelessWidget {
  final int totalPoints; // Accept total points

  const RecommendationsScreen({required this.totalPoints, super.key, required Map responses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Wellness Results",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF3550DC),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Your Activity Summary",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                _buildCategorySummary(),
                const SizedBox(height: 24),
                Text(
                  "Total Points: $totalPoints", // Display total points
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ..._buildRecommendations(),
                const SizedBox(height: 24),
                const Text(
                  "Suggested YouTube Videos",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                _buildYouTubeLinks(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _buildCategorySummary() {
    final categories = [
      {"icon": Icons.psychology, "name": "Mind", "points": 20},
      {"icon": Icons.favorite, "name": "Body", "points": totalPoints},
      {"icon": Icons.directions_run, "name": "Fitness", "points": 25},
      {"icon": Icons.restaurant, "name": "Nutrition", "points": 30},
      {"icon": Icons.auto_awesome, "name": "Habits", "points": 10},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: _buildCategoryBox(
              category["icon"] as IconData,
              category["name"] as String,
              category["points"] as int,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCategoryBox(IconData icon, String name, int points) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.blueAccent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 32, color: Colors.blue),
                const SizedBox(height: 4),
                Text(
                  '$points',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildAssessmentPieChart() {
    return SizedBox(
      height: 250,
      child: PieChart(
        PieChartData(
          sectionsSpace: 5,
          centerSpaceRadius: 60,
          sections: _generateSections(),
          pieTouchData: PieTouchData(
            touchCallback: (FlTouchEvent event, PieTouchResponse? touchResponse) {
              // Handle touch events if needed
            },
          ),
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

    // Example completion data
    final List<bool> completionStatus = [true, false, true, false, true];

    return List.generate(icons.length, (index) {
      final isCompleted = completionStatus[index];
      final double radius = isCompleted ? 60 : 50;

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
        badgeWidget: _buildIconBadge(icons[index], isCompleted),
        badgePositionPercentageOffset: 0.55,
      );
    });
  }

  Widget _buildIconBadge(IconData icon, bool isCompleted) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCompleted ? Colors.green.withOpacity(0.2) : Colors.red.withOpacity(0.2),
      ),
      child: Icon(
        icon,
        color: isCompleted ? Colors.green : Colors.red,
        size: 24,
      ),
    );
  }

  List<Widget> _buildRecommendations() {
    final recommendations = [
      {"icon": Icons.directions_walk, "text": "Increase your daily steps to 8000."},
      {"icon": Icons.self_improvement, "text": "Add a 10-minute meditation session."},
      {"icon": Icons.restaurant, "text": "Eat balanced meals to maintain energy."},
    ];

    return recommendations.map((rec) {
      return ListTile(
        leading: Icon(rec["icon"] as IconData, color: Colors.blue),
        title: Text(rec["text"] as String),
      );
    }).toList();
  }

  Widget _buildYouTubeLinks() {
    final videos = [
      {"title": "10-Minute Meditation for Beginners", "url": "https://www.youtube.com/watch?v=inpok4MKVLM"},
      {"title": "Healthy Eating Tips", "url": "https://www.youtube.com/watch?v=dBnniua6-oM"},
      {"title": "Quick Home Workouts", "url": "https://www.youtube.com/watch?v=2pLT-olgUJs"},
    ];

    return Column(
      children: videos.map((video) {
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 3,
          child: ListTile(
            contentPadding: const EdgeInsets.all(8.0),
            title: Text(video["title"]!, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            trailing: const Icon(Icons.open_in_new, color: Colors.blue),
            onTap: () async {
              final url = video["url"]!;
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
        );
      }).toList(),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(), // Change this to your desired initial screen
    ),
  );
}
