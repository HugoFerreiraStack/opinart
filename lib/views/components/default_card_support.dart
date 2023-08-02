import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultCardSupport extends StatelessWidget {
  const DefaultCardSupport({
    Key? key,
    required this.iconPath,
    required this.title,
    required this.contact,
  }) : super(key: key);

  final String iconPath;
  final String title;
  final String contact;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  iconPath,
                  color: Color(0xFF09242E),
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: const Color(0xFF09242E),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              contact,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: const Color(0xFF09242E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
