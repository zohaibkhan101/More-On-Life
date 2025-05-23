import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MoodCheckPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class MoodCheckPage extends StatefulWidget {
  @override
  _MoodCheckPageState createState() => _MoodCheckPageState();
}

class _MoodCheckPageState extends State<MoodCheckPage> {
  String? selectedMood;
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Full Name",
                  labelStyle: TextStyle(color: Colors.blue, fontSize: 18),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Text(
                      "How are you feeling ?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Traffic light
                        Column(
                          children: [
                            _trafficLightCircle(Colors.green),
                            _trafficLightCircle(Colors.yellow),
                            _trafficLightCircle(Colors.red),
                          ],
                        ),
                        SizedBox(width: 20),
                        // Mood options
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildRadio("I'm feeling good."),
                              _buildRadio("I need improvements."),
                              _buildRadio("I'm feeling bad."),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  print("Name: ${nameController.text}");
                  print("Mood: $selectedMood");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Text("CONFIRM", style: TextStyle(fontSize: 18)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _trafficLightCircle(Color color) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black),
      ),
    );
  }

  Widget _buildRadio(String text) {
    return RadioListTile<String>(
      title: Text(text),
      value: text,
      groupValue: selectedMood,
      onChanged: (value) {
        setState(() {
          selectedMood = value;
        });
      },
    );
  }
}
