import 'package:flutter/material.dart';

// Import your HomeScreen here
// import 'home_screen.dart';

class SignalScreen extends StatefulWidget {
  @override
  _SignalScreenState createState() => _SignalScreenState();
}

class _SignalScreenState extends State<SignalScreen> {
  int? selectedIndex;

  final List<String> options = [
    "I'm feeling good.",
    "I need improvements.",
    "I'm feeling bad.",
  ];

  final List<Color> signalColors = [
    Colors.green,
    Colors.yellow,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                'How are you feeling ?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.blue.shade100),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Traffic light as checkboxes
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (i) => _buildSignalCheckbox(i)),
                    ),
                    const SizedBox(width: 24),
                    // Options
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(options.length, (i) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = i;
                            });
                          },
                          child: Container(
                            color: Colors.transparent,
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            child: Row(
                              children: [
                                Text(
                                  options[i],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: selectedIndex == i
                                        ? Colors.blue
                                        : Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: selectedIndex != null
                        ? () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          }
                        : null,
                    child: const Text(
                      'CONFIRM',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignalCheckbox(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: signalColors[index].withOpacity(selectedIndex == index ? 1 : 0.3),
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black26,
            width: 2,
          ),
        ),
        child: selectedIndex == index
            ? const Icon(Icons.check, color: Colors.white, size: 22)
            : null,
      ),
    );
  }
}

// Dummy HomeScreen for navigation (replace with your actual HomeScreen)
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Home Screen')),
    );
  }
}