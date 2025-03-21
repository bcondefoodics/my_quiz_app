import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const AnswerButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      ),
      onPressed: () {
        onPressed();
      },
      child: Text(text, style: GoogleFonts.roboto()),
    );
  }
}
