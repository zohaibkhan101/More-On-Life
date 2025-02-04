import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailInputForm extends StatelessWidget {

  final ValueChanged<bool> onEmailValid; // Callback for email validity

  const EmailInputForm({super.key, required this.onEmailValid});


  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF36454F),
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(

              hintText: 'Johndoe@example.com',

              hintStyle: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF36454F).withOpacity(0.5),
              ),
              filled: true,
              fillColor: const Color(0xFFD3D3D3),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 13,
              ),
            ),
            keyboardType: TextInputType.emailAddress,

            onChanged: (value) {
              // Validate email and notify parent widget via callback
              final isValid = RegExp(
                  r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                  .hasMatch(value);
              onEmailValid(isValid); // Notify the parent about validity
            },

          ),
        ],
      ),
    );
  }

}

