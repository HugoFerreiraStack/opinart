import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateUserHeader extends StatelessWidget {
  final String title;

  const CreateUserHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          title,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: const Color(0xFF09242E),
          ),
        ),
      ),
    );
  }
}
