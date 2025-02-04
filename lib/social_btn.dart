import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Widget icon;
  final Color backgroundColor;
  final Color? borderColor;
final double fontSize;
  const SocialButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
    required this.backgroundColor,
    this.borderColor,
    this.fontSize=16, required Color textColor,

  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(73),
        side: borderColor != null
            ? BorderSide(color: borderColor!, width: 3)
            : BorderSide.none,
      ),
      color: backgroundColor,
      elevation: 4,
      child: Container(
        width: 680,
        height: 120,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 20),
            Text(
              text,
              style: GoogleFonts.montserrat(
                fontSize: 45,
                color: backgroundColor == Colors.white
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}