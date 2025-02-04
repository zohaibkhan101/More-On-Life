import 'package:flutter/material.dart';
import 'package:moreonlife/quiz_screen.dart';
import 'widgets/NavBar.dart'; // Ensure this import is correct
 

class AssessmentDetailScreen extends StatelessWidget {
  const AssessmentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assessments'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildAssessmentItem(
                    context,
                    icon: Icons.psychology,
                    title: 'Mind',
                    subtitle: 'Explore the depths of your mind.',
                    color: Colors.purpleAccent,
                  ),
                  _buildAssessmentItem(
                    context,
                    icon: Icons.favorite,
                    title: 'Body',
                    subtitle: 'Understand your body better.',
                    color: Colors.redAccent,
                  ),
                  _buildAssessmentItem(
                    context,
                    icon: Icons.directions_run,
                    title: 'Fitness',
                    subtitle: 'Get fit, stay healthy.',
                    color: Colors.greenAccent,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const WellnessAssessmentScreen()),
                      );
                    },
                  ),
                  _buildAssessmentItem(
                    context,
                    icon: Icons.restaurant,
                    title: 'Nutrition',
                    subtitle: 'Fuel your body right.',
                    color: Colors.orangeAccent,
                  ),
                  _buildAssessmentItem(
                    context,
                    icon: Icons.auto_awesome,
                    title: 'Habits',
                    subtitle: 'Build better habits.',
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(), // Add the bottom navigation bar
    );
  }

  Widget _buildAssessmentItem(BuildContext context, {required IconData icon, required String title, required String subtitle, required Color color, VoidCallback? onTap}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap, // Use the onTap callback
      ),
    );
  }
}