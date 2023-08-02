import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultCell extends StatelessWidget {
  const DefaultCell(
      {super.key, this.width, required this.text, this.fontWeight, this.color});
  final double? width;
  final String text;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Color(0xFFEBEBEB)))),
      width: width,
      height: 56,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.roboto(
            fontWeight: fontWeight ?? FontWeight.w400,
            fontSize: 16,
            letterSpacing: 0.8,
            color: color ?? const Color(0xFF202020),
          ),
        ),
      ),
    );
  }
}
