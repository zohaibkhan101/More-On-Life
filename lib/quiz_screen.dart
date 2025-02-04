import 'package:flutter/material.dart';

class WellnessAssessmentScreen extends StatefulWidget {
  const WellnessAssessmentScreen({super.key});

  @override
  State<WellnessAssessmentScreen> createState() => _WellnessAssessmentScreenState();
}

class _WellnessAssessmentScreenState extends State<WellnessAssessmentScreen> {
  String? selectedOption;
  int currentQuestionIndex = 0;

  final List<String> progressNumbers = ['1','2','3','4', '5', '6', '7', '8', '9', '10','11','12','13','14','15'];

  final Map<String, List<Map<String, dynamic>>> assessmentCategories = {
    'Activity': [
      // ... previous Activity questions remain the same ...
    ],

    'Strength': [
      // ... previous Strength questions remain the same ...
      {
        'question': 'Push-Up/Press-Up Test (Men)',
        'options': [
          '55 or more (age 20-29) / 45+ (30-39) / 40+ (40-49) / 35+ (50-59) / 30+ (60+) (10 points)',
          '50-54 (20-29) / 40-44 (30-39) / 35-39 (40-49) / 30-34 (50-59) / 25-29 (60+) (9 points)',
          '45-49 (20-29) / 35-39 (30-39) / 30-34 (40-49) / 25-29 (50-59) / 20-24 (60+) (8 points)',
          '40-44 (20-29) / 30-34 (30-39) / 25-29 (40-49) / 20-24 (50-59) / 15-19 (60+) (7 points)',
          '35-39 (20-29) / 25-29 (30-39) / 20-24 (40-49) / 15-19 (50-59) / 10-14 (60+) (6 points)',
          '30-34 (20-29) / 20-25 (30-39) / 15-19 (40-49) / 11-14 (50-59) / 7-9 (60+) (5 points)',
          '25-29 (20-29) / 15-19 (30-39) / 12-14 (40-49) / 8-10 (50-59) / 5-6 (60+) (4 points)',
          '20-24 (20-29) / 12-14 (30-39) / 10-11 (40-49) / 6-7 (50-59) / 4 (60+) (3 points)',
          '15-19 (20-29) / 10-11 (30-39) / 8-9 (40-49) / 5 (50-59) / 3 (60+) (2 points)',
          '14 or fewer (20-29) / 9 or fewer (30-39) / 7 or fewer (40-49) / 4 or fewer (50-59) / 2 or fewer (60+) (1 point)',
          'No attempt (0 points)',
        ]
      },
      {
        'question': 'Handgrip Strength Test (in Kilograms)',
        'options': [
          'Over 70 (Men) / Over 50 (Women) (10 points)',
          '60-69 (Men) / 45-49 (Women) (9 points)',
          '55-59 (Men) / 40-44 (Women) (8 points)',
          '50-54 (Men) / 35-39 (Women) (7 points)',
          '45-49 (Men) / 30-34 (Women) (6 points)',
          '40-44 (Men) / 25-29 (Women) (5 points)',
          '35-39 (Men) / 20-24 (Women) (4 points)',
          '25-34 (Men) / 15-19 (Women) (3 points)',
          '15-24 (Men) / 10-14 (Women) (2 points)',
          '5-14 (Men) / 5-9 (Women) (1 point)',
          'Less than 5 (0 points)',
        ]
      },
      {
        'question': 'Triceps Dips Test: How many dips can you perform?',
        'options': [
          '20 or more (10 points)',
          'Less than 20 (9 points)',
          'Less than 15 (8 points)',
          'Less than 12 (7 points)',
          'Less than 10 (6 points)',
          'Less than 7 (5 points)',
          'Less than 5 (4 points)',
          'Less than 4 (3 points)',
          'Less than 3 (2 points)',
          'Less than 2 (1 point)',
          'None (0 points)',
        ]
      },
    ],

    'Aerobic': [
      {
        'question': '5km Walk/Jog/Run Test (in minutes)',
        'options': [
          'Less than 20 minutes (10 points)',
          'Less than 23 minutes (9 points)',
          'Less than 26 minutes (8 points)',
          'Less than 29 minutes (7 points)',
          'Less than 32 minutes (6 points)',
          'Less than 35 minutes (5 points)',
          'Less than 40 minutes (4 points)',
          'Less than 45 minutes (3 points)',
          'Less than 50 minutes (2 points)',
          'Less than 70 minutes (1 point)',
          'More than 70 minutes (0 points)',
        ]
      },
      {
        'question': '2,000m Rowing Test',
        'options': [
          'Less than 6:40 (Men) / Less than 7:40 (Women) (10 points)',
          'Less than 7:00 (Men) / Less than 8:00 (Women) (9 points)',
          'Less than 7:30 (Men) / Less than 8:30 (Women) (8 points)',
          'Less than 8:00 (Men) / Less than 9:00 (Women) (7 points)',
          'Less than 8:30 (Men) / Less than 9:30 (Women) (6 points)',
          'Less than 9:00 (Men) / Less than 10:00 (Women) (5 points)',
          'Less than 10:00 (Men) / Less than 11:00 (Women) (4 points)',
          'Less than 12:00 (Men) / Less than 13:00 (Women) (3 points)',
          'Over 12:00 (Men) / Over 13:00 (Women) (2 points)',
          'Less than 1,000m completed (1 point)',
          'Less than 500m completed (0 points)',
        ]
      },
      {
        'question': 'BEEP Test Level Achieved',
        'options': [
          'Over 13 (Men) / Over 12 (Women) (10 points)',
          'Less than 13 (Men) / Less than 12 (Women) (9 points)',
          'Less than 12 (Men) / Less than 11 (Women) (8 points)',
          'Less than 11 (Men) / Less than 10 (Women) (7 points)',
          'Less than 10 (Men) / Less than 9 (Women) (6 points)',
          'Less than 9 (Men) / Less than 8 (Women) (5 points)',
          'Less than 8 (Men) / Less than 7 (Women) (4 points)',
          'Less than 7 (Men) / Less than 6 (Women) (3 points)',
          'Less than 6 (Men) / Less than 5 (Women) (2 points)',
          'Less than 4 (Men) / Less than 3 (Women) (1 point)',
          'Less than 2 (Men) / Less than 1 (Women) (0 points)',
        ]
      },
      {
        'question': '4Km Cycling Test (in minutes)',
        'options': [
          'Less than 6 minutes (10 points)',
          'Less than 8 minutes (9 points)',
          'Less than 9 minutes (8 points)',
          'Less than 10 minutes (7 points)',
          'Less than 12 minutes (6 points)',
          'Less than 15 minutes (5 points)',
          'Less than 17 minutes (4 points)',
          'Less than 20 minutes (3 points)',
          'Over 20 minutes (2 points)',
          'Less than 2Km completed (1 point)',
          'Less than 1Km completed (0 points)',
        ]
      },
      {
        'question': '12 Minute Swimming Test (in meters)',
        'options': [
          'Over 900m (Men) / Over 800m (Women) (10 points)',
          '801-900m (Men) / 701-800m (Women) (9 points)',
          '701-800m (Men) / 601-700m (Women) (8 points)',
          '601-700m (Men) / 501-600m (Women) (7 points)',
          '501-600m (Men) / 401-500m (Women) (6 points)',
          '401-500m (Men) / 301-400m (Women) (5 points)',
          '251-400m (Men) / 201-300m (Women) (4 points)',
          '101-250m (Men) / 101-200m (Women) (3 points)',
          '51-100m (Both) (2 points)',
          '10-50m (Both) (1 point)',
          'Less than 10m (Both) (0 points)',
        ]
      },
    ],

    'Endurance': [
      {
        'question': 'Dead-Hang Test (in seconds)',
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
        'question': 'Wall-Sit Test (in seconds)',
        'options': [
          'Over 170 (Men) / Over 140 (Women) (10 points)',
          '130-169 (Men) / 110-139 (Women) (9 points)',
          '100-129 (Men) / 90-109 (Women) (8 points)',
          '90-99 (Men) / 80-89 (Women) (7 points)',
          '80-89 (Men) / 70-79 (Women) (6 points)',
          '70-79 (Men) / 60-69 (Women) (5 points)',
          '60-69 (Men) / 50-59 (Women) (4 points)',
          '50-59 (Men) / 40-49 (Women) (3 points)',
          '40-49 (Men) / 30-39 (Women) (2 points)',
          '31-39 (Men) / 21-29 (Women) (1 point)',
          'Less than 30 (Men) / Less than 20 (Women) (0 points)',
        ]
      },
      {
        'question': 'Farmer\'s Carry Test (in meters)',
        'options': [
          '200 or more meters (10 points)',
          'Less than 200 meters (9 points)',
          'Less than 150 meters (8 points)',
          'Less than 100 meters (7 points)',
          'Less than 70 meters (6 points)',
          'Less than 50 meters (5 points)',
          'Less than 30 meters (4 points)',
          'Less than 20 meters (3 points)',
          'Less than 10 meters (2 points)',
          'Less than 5 meters (1 point)',
          'None (0 points)',
        ]
      },
      {
        'question': 'Plank Test (in seconds)',
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
        'question': 'Sit and Reach Test (in centimeters)',
        'options': [
          'Over 30cm (Men) / Over 33cm (Women) (10 points)',
          '27-29cm (Men) / 30-33cm (Women) (9 points)',
          '23-26cm (Men) / 26-29cm (Women) (8 points)',
          '17-22cm (Men) / 21-25cm (Women) (7 points)',
          '10-16cm (Men) / 16-20cm (Women) (6 points)',
          '5-9cm (Men) / 11-15cm (Women) (5 points)',
          '0-4cm (Men) / 5-10cm (Women) (4 points)',
          '-4-0cm (Men) / 4-0cm (Women) (3 points)',
          '-8--3cm (Men) / -7--1cm (Women) (2 points)',
          '-20--9cm (Men) / -14--8cm (Women) (1 point)',
          'Less than -21cm (Men) / Less than -15cm (Women) (0 points)',
        ]
      },
      {
        'question': 'Balance on One Leg Test (in seconds)',
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
        'question': 'Shoulder Mobility - Back Scratch Test (in centimeters)',
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
        'question': '20 Step Sobriety Test (number of errors)',
        'options': [
          'Perfect - no errors (10 points)',
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
        'question': 'Angel Test (number of gaps)',
        'options': [
          'None - all parts touch (10 points)',
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
                            ? (currentQuestionIndex < getTotalQuestions() - 1 
                                ? goToNextQuestion 
                                : () {/* Handle submit */})
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