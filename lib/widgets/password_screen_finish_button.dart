import 'package:flutter/material.dart';

class FinishButton extends StatelessWidget {
  const FinishButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 288,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(
            'https://cdn.builder.io/api/v1/image/assets/TEMP/67753bc929002ea91e43d1d90e7f831071e6ce66bba092f743d41f51e72bfe8b?placeholderIfAbsent=true&apiKey=1f1c17cd0df642bd88e03aed2bb8b72e',
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 43, vertical: 3),
            child: const Text(
              'Finish',
              style: TextStyle(
                color: Color(0xFFD3D3D3),
                fontFamily: 'Montserrat',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}