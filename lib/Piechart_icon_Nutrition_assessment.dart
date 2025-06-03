import 'package:flutter/material.dart';
import 'package:moreonlife/recommendations.dart';

class NutritionAssessmentScreen extends StatefulWidget {
  const NutritionAssessmentScreen({super.key});

  @override
  State<NutritionAssessmentScreen> createState() => _NutritionAssessmentScreenState();
}

class _NutritionAssessmentScreenState extends State<NutritionAssessmentScreen> {
  String? selectedOption;
  int currentQuestionIndex = 0;
  int totalPoints = 0; // Track total points

  final List<String> progressNumbers = ['1','2','3','4', '5', '6', '7', '8', '9', '10','11','12','13','14','15'];

  final Map<String, List<Map<String, dynamic>>> assessmentCategories = {
    'Activity': [
      // ... previous Activity questions remain the same ...
    ],

    'Strength': [
      {
        'question': 'How many push-ups can you do in one go?',
        'options': [
          '55 or more (10 points)',
          '50-54 (9 points)',
          '45-49 (8 points)',
          '40-44 (7 points)',
          '35-39 (6 points)',
          '30-34 (5 points)',
          '25-29 (4 points)',
          '20-24 (3 points)',
          '15-19 (2 points)',
          '14 or fewer (1 point)',
          'None (0 points)',
        ]
      },
      {
        'question': 'What is your handgrip strength in kilograms?',
        'options': [
          'Over 70 (10 points)',
          '60-69 (9 points)',
          '55-59 (8 points)',
          '50-54 (7 points)',
          '45-49 (6 points)',
          '40-44 (5 points)',
          '35-39 (4 points)',
          '25-34 (3 points)',
          '15-24 (2 points)',
          '5-14 (1 point)',
          'Less than 5 (0 points)',
        ]
      },
      {
        'question': 'How many tricep dips can you do?',
        'options': [
          '20 or more (10 points)',
          '15-19 (9 points)',
          '10-14 (8 points)',
          '5-9 (7 points)',
          '1-4 (6 points)',
          'None (0 points)',
        ]
      },
    ],

    'Aerobic': [
      {
        'question': 'How long does it take you to run 5km?',
        'options': [
          'Less than 20 minutes (10 points)',
          '20-23 minutes (9 points)',
          '24-26 minutes (8 points)',
          '27-29 minutes (7 points)',
          '30-32 minutes (6 points)',
          '33-35 minutes (5 points)',
          '36-40 minutes (4 points)',
          '41-45 minutes (3 points)',
          '46-50 minutes (2 points)',
          '51-70 minutes (1 point)',
          'More than 70 minutes (0 points)',
        ]
      },
      {
        'question': 'How fast can you row 2,000 meters?',
        'options': [
          'Less than 6:40 (10 points)',
          '6:41-7:00 (9 points)',
          '7:01-7:30 (8 points)',
          '7:31-8:00 (7 points)',
          '8:01-8:30 (6 points)',
          '8:31-9:00 (5 points)',
          '9:01-10:00 (4 points)',
          '10:01-12:00 (3 points)',
          'More than 12:00 (2 points)',
          'Less than 1,000m completed (1 point)',
          'Less than 500m completed (0 points)',
        ]
      },
      {
        'question': 'What level do you reach in the BEEP test?',
        'options': [
          'Level 13 or more (10 points)',
          'Level 12 (9 points)',
          'Level 11 (8 points)',
          'Level 10 (7 points)',
          'Level 9 (6 points)',
          'Level 8 (5 points)',
          'Level 7 (4 points)',
          'Level 6 (3 points)',
          'Level 5 (2 points)',
          'Level 4 (1 point)',
          'Level 3 or less (0 points)',
        ]
      },
      {
        'question': 'How long does it take you to cycle 4km?',
        'options': [
          'Less than 6 minutes (10 points)',
          '6-8 minutes (9 points)',
          '9 minutes (8 points)',
          '10 minutes (7 points)',
          '11-12 minutes (6 points)',
          '13-15 minutes (5 points)',
          '16-17 minutes (4 points)',
          '18-20 minutes (3 points)',
          'More than 20 minutes (2 points)',
          'Less than 2Km completed (1 point)',
          'Less than 1Km completed (0 points)',
        ]
      },
      {
        'question': 'How far can you swim in 12 minutes?',
        'options': [
          'Over 900m (10 points)',
          '801-900m (9 points)',
          '701-800m (8 points)',
          '601-700m (7 points)',
          '501-600m (6 points)',
          '401-500m (5 points)',
          '251-400m (4 points)',
          '101-250m (3 points)',
          '51-100m (2 points)',
          '10-50m (1 point)',
          'Less than 10m (0 points)',
        ]
      },
    ],

    'Endurance': [
      {
        'question': 'How long can you hang from a bar?',
        'options': [
          'Over 100 seconds (10 points)',
          '91-100 seconds (9 points)',
          '81-90 seconds (8 points)',
          '71-80 seconds (7 points)',
          '61-70 seconds (6 points)',
          '51-60 seconds (5 points)',
          '41-50 seconds (4 points)',
          '31-40 seconds (3 points)',
          '21-30 seconds (2 points)',
          '11-20 seconds (1 point)',
          'Less than 10 seconds (0 points)',
        ]
      },
      {
        'question': 'How long can you hold a wall-sit?',
        'options': [
          'Over 170 seconds (10 points)',
          '130-169 seconds (9 points)',
          '100-129 seconds (8 points)',
          '90-99 seconds (7 points)',
          '80-89 seconds (6 points)',
          '70-79 seconds (5 points)',
          '60-69 seconds (4 points)',
          '50-59 seconds (3 points)',
          '40-49 seconds (2 points)',
          '31-39 seconds (1 point)',
          'Less than 30 seconds (0 points)',
        ]
      },
      {
        'question': 'How far can you carry weights?',
        'options': [
          '200 or more meters (10 points)',
          '150-199 meters (9 points)',
          '100-149 meters (8 points)',
          '70-99 meters (7 points)',
          '50-69 meters (6 points)',
          '30-49 meters (5 points)',
          '20-29 meters (4 points)',
          '10-19 meters (3 points)',
          '5-9 meters (2 points)',
          '1-4 meters (1 point)',
          'None (0 points)',
        ]
      },
      {
        'question': 'How long can you hold a plank?',
        'options': [
          'Over 200 seconds (10 points)',
          '151-200 seconds (9 points)',
          '121-150 seconds (8 points)',
          '101-120 seconds (7 points)',
          '81-100 seconds (6 points)',
          '61-80 seconds (5 points)',
          '41-60 seconds (4 points)',
          '31-40 seconds (3 points)',
          '21-30 seconds (2 points)',
          '10-20 seconds (1 point)',
          'Less than 10 seconds (0 points)',
        ]
      },
    ],

    'Balance and Flexibility': [
      {
        'question': 'How far can you reach in the sit and reach test?',
        'options': [
          'Over 30cm (10 points)',
          '27-29cm (9 points)',
          '23-26cm (8 points)',
          '17-22cm (7 points)',
          '10-16cm (6 points)',
          '5-9cm (5 points)',
          '0-4cm (4 points)',
          '-4-0cm (3 points)',
          '-8--3cm (2 points)',
          '-20--9cm (1 point)',
          'Less than -21cm (0 points)',
        ]
      },
      {
        'question': 'How long can you balance on one leg?',
        'options': [
          'Over 100 seconds (10 points)',
          '86-100 seconds (9 points)',
          '76-85 seconds (8 points)',
          '66-75 seconds (7 points)',
          '56-65 seconds (6 points)',
          '46-55 seconds (5 points)',
          '36-45 seconds (4 points)',
          '26-35 seconds (3 points)',
          '16-25 seconds (2 points)',
          '5-15 seconds (1 point)',
          'Less than 5 seconds (0 points)',
        ]
      },
      {
        'question': 'How close can you get your hands in the shoulder mobility test?',
        'options': [
          'Fingers overlapping (10 points)',
          '1cm gap (9 points)',
          '3cm gap (8 points)',
          '5cm gap (7 points)',
          '7cm gap (6 points)',
          '9cm gap (5 points)',
          '11cm gap (4 points)',
          '14cm gap (3 points)',
          '17cm gap (2 points)',
          '20cm gap (1 point)',
          'Over 20cm gap (0 points)',
        ]
      },
      {
        'question': 'How many errors do you make in the 20 step sobriety test?',
        'options': [
          'No errors (10 points)',
          '1 error (9 points)',
          '2 errors (8 points)',
          '3 errors (7 points)',
          '4 errors (6 points)',
          '5 errors (5 points)',
          '6 errors (4 points)',
          '7 errors (3 points)',
          '8 errors (2 points)',
          '9 errors (1 point)',
          'More than 9 errors (0 points)',
        ]
      },
      {
        'question': 'How many gaps are there in the angel test?',
        'options': [
          'None (10 points)',
          '1 gap (9 points)',
          '2 gaps (8 points)',
          '3 gaps (7 points)',
          '4 gaps (6 points)',
          '5 gaps (5 points)',
          '6 gaps (4 points)',
          '7 gaps (3 points)',
          '8 gaps (2 points)',
          '9 gaps (1 point)',
          'More than 9 gaps (0 points)',
        ]
      },
    ],
  };

  // Helper method to get current question data
  Map<String, dynamic>? getCurrentQuestion() {
    print('Getting question for index: $currentQuestionIndex');

    // Get all categories
    List<String> categories = assessmentCategories.keys.toList();
    print('Available categories: $categories');

    // Calculate current category
    int categoryIndex = 0;
    int questionCount = 0;
    for (int i = 0; i < categories.length; i++) {
      int categoryQuestionCount = assessmentCategories[categories[i]]!.length;
      if (currentQuestionIndex < questionCount + categoryQuestionCount) {
        categoryIndex = i;
        break;
      }
      questionCount += categoryQuestionCount;
    }

    if (categoryIndex >= categories.length) {
      print('Category index out of bounds');
      return null;
    }

    String currentCategory = categories[categoryIndex];
    print('Selected category: $currentCategory');

    // Get questions for current category
    List<Map<String, dynamic>> questions = assessmentCategories[currentCategory]!;

    // Calculate question index within category
    int questionInCategoryIndex = currentQuestionIndex - questionCount;
    print('Question index in category: $questionInCategoryIndex');
    print('Total questions in category: ${questions.length}');

    if (questionInCategoryIndex < questions.length) {
      Map<String, dynamic> question = questions[questionInCategoryIndex];
      print('Found question: ${question['question']}');
      return question;
    }

    print('Question index out of bounds');
    return null;
  }

  // Add method to handle next question
  void goToNextQuestion() {
    if (currentQuestionIndex < getTotalQuestions() - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedOption = null; // Reset selection for new question
      });
    }
  }

  // Add method to handle previous question
  void goToPreviousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
        selectedOption = null; // Reset selection for new question
      });
    }
  }

  // Add method to get total questions
  int getTotalQuestions() {
    return assessmentCategories.values
        .map((questions) => questions.length)
        .reduce((a, b) => a + b);
  }

  // Calculate points based on selected option
  void calculatePoints(String selectedOption) {
    final currentQuestion = getCurrentQuestion();
    if (currentQuestion != null) {
      final options = currentQuestion['options'] as List<String>;
      final selectedOptionIndex = options.indexOf(selectedOption);
      if (selectedOptionIndex != -1) {
        // Extract points from the selected option string
        final pointsMatch = RegExp(r'\d+').firstMatch(options[selectedOptionIndex]);
        if (pointsMatch != null) {
          final points = int.parse(pointsMatch.group(0)!);
          totalPoints += points;
          print('Added $points points. Total now: $totalPoints'); // Debugging output
        }
      }
    }
  }

  // Navigate to RecommendationsScreen with totalPoints
  void _navigateToRecommendations() {
    print('Navigating to Recommendations with totalPoints: $totalPoints'); // Debugging output
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecommendationsScreen(
          totalPoints: totalPoints,
          responses: {}, // Pass any additional data if needed
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? currentQuestion = getCurrentQuestion();
    print('Building widget with question: ${currentQuestion?['question']}');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Wellness Assessment',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
      ),
      body: currentQuestion == null
          ? const Center(child: Text('No questions available'))
          : Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Progress indicators
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.only(bottom: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(getTotalQuestions(), (index) {
                  bool isActive = index == currentQuestionIndex;
                  return Container(
                    width: 24,
                    height: 24,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isActive ? Colors.white : Colors.white.withOpacity(0.3),
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: isActive ? Colors.blue : Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),

          // Question number
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.all(16),
            child: Text(
              'Question ${currentQuestionIndex + 1}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Question text
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              currentQuestion['question'],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Options
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: currentQuestion['options'].length,
              itemBuilder: (context, index) {
                return _buildOptionButton(
                  String.fromCharCode(65 + index),
                  currentQuestion['options'][index],
                );
              },
            ),
          ),

          // Navigation buttons
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Previous button
                IconButton(
                  onPressed: currentQuestionIndex > 0 ? goToPreviousQuestion : null,
                  icon: const Icon(Icons.arrow_back),
                ),

                // Next/Submit button
                ElevatedButton(
                  onPressed: selectedOption != null
                      ? () {
                    calculatePoints(selectedOption!);
                    if (currentQuestionIndex < getTotalQuestions() - 1) {
                      goToNextQuestion();
                    } else {
                      _navigateToRecommendations();
                    }
                  }
                      : null,
                  child: Text(
                    currentQuestionIndex < getTotalQuestions() - 1
                        ? 'Next Question'
                        : 'Submit',
                  ),
                ),

                // Next button
                IconButton(
                  onPressed: currentQuestionIndex < getTotalQuestions() - 1
                      ? goToNextQuestion
                      : null,
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionButton(String letter, String text) {
    bool isSelected = selectedOption == letter;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedOption = letter;
          });
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? Colors.blue : Colors.grey[300]!,
              width: 1,
            ),
            color: isSelected ? Colors.blue : Colors.white,
          ),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? Colors.white : Colors.grey[100],
                ),
                child: Center(
                  child: Text(
                    letter,
                    style: TextStyle(
                      color: isSelected ? Colors.blue : Colors.grey[600],
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                child: Text(
                  text,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey[800],
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}