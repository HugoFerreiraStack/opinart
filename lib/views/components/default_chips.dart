import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultChips extends StatelessWidget {
  const DefaultChips(
      {super.key,
      required this.title,
      required this.colorBackground,
      required this.textColor});
  final String title;
  final Color colorBackground;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: colorBackground, borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        child: Text(
          title,
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500, fontSize: 14, color: textColor),
        ),
      ),
    );
  }
}
