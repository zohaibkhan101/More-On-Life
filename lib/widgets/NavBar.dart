// Bottom Navigation Bar Widget
import 'package:flutter/material.dart';
import 'package:moreonlife/Assesments.dart';
import 'package:moreonlife/assessment_detail_screen.dart';
import 'package:moreonlife/recommendations.dart';
import 'package:moreonlife/userProfile.dart';


class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),

    topRight: Radius.circular(20),
    ),
    child:  Container(
      decoration: BoxDecoration(
        color: Color(0xFF3550DC),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavButton(Icons.home, 'Home', () {
              // Navigate to Home
              Navigator.push(context,
              MaterialPageRoute(
                  builder: (context)=> const HomeScreen(),
              )
              );
            }),
            _buildNavButton(Icons.assessment, 'Assessments', () {
              // Navigate to Assessments
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AssessmentDetailScreen()));
            }),
            _buildNavButton(Icons.insights, 'Insights', () {
              // Navigate to Insights
              Navigator.push(context, MaterialPageRoute(builder:(context)=>RecommendationsScreen(responses: {}, totalPoints: 0,)));

            }),
            _buildNavButton(Icons.person, 'Profile', () {
              // Navigate to Profile

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );

            }),
          ],
        ),
      ),
    )
    );
  }

  Widget _buildNavButton(IconData icon, String label, VoidCallback onPressed) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon, color: Colors.white),
          onPressed: onPressed,
        ),
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}