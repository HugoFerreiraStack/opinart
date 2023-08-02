import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultButtonOutlined extends StatelessWidget {
  const DefaultButtonOutlined({super.key, this.title, this.onTap});
  final String? title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: const Color(0xFF17468C).withOpacity(0.48))),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Text(
            title ?? "",
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: const Color(0xFF14315C)),
          ),
        ),
      ),
    );
  }
}
