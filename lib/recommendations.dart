import 'package:flutter/material.dart';
import 'package:moreonlife/login_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class RecommendationsScreen extends StatelessWidget {
  final Map<String, Map<String, int>> responses;

  const RecommendationsScreen({required this.responses, super.key});

  @override
  Widget build(BuildContext context) {
    int steps = 1006; // Replace with calculated value
    int calories = 0; // Replace with calculated value
    int activeMinutes = 0; // Replace with calculated value

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Wellness Results",style: TextStyle(color: Colors.white),),

        backgroundColor: const Color(0xFF3550DC),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white
        ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActivityCard("Personal Life", steps, 8000, Colors.orange),
                    _buildActivityCard("Mental Activity", calories, 300, Colors.red),
                    _buildActivityCard("Relaxation", activeMinutes, 30, Colors.blue),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  "Personalized Recommendations",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
    );
  }

  Widget _buildActivityCard(String title, int value, int goal, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: goal > 0 ? (value / goal).clamp(0.0, 1.0) : 0.0,
                    strokeWidth: 6,
                    backgroundColor: color.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                  ),
                  Text(
                    "$value",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            Text("Goal: $goal", style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
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
