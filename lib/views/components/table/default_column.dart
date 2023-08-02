import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultColumn extends StatelessWidget {
  const DefaultColumn({
    super.key,
    this.text,
    this.width,
    this.activeIcon = true,
    this.color,
  });
  final String? text;
  final double? width;
  final bool activeIcon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: color ?? const Color(0xFFF5F8FA), border: const Border(bottom: BorderSide(color: Color(0xFFF5F8FA)))),
      height: 48,
      width: width ?? 150,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Text(
              text ?? "",
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                letterSpacing: 0.8,
                color: const Color(0xFF202020),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            if (activeIcon) SvgPicture.asset("assets/arrow-up-down-line.svg")
          ],
        ),
      ),
    );
  }
}
