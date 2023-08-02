import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultIconQuestionCard extends StatelessWidget {
  const DefaultIconQuestionCard(
      {this.icon, this.title, this.onlyIcon = false, super.key});

  final String? icon, title;
  final bool onlyIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 116,
      height: 60,
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: onlyIcon ? Colors.white : const Color(0xFFF4F5F6),
        borderRadius: BorderRadius.circular(10),
        border: onlyIcon ? Border.all(color: const Color(0xFFE7E8E9)) : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: SvgPicture.asset(
              icon!,
              // ignore: deprecated_member_use
              color:
                  onlyIcon ? const Color(0xFFA9A9B4) : const Color(0xFF74747E),
            ),
          ),
          if (!onlyIcon) ...[
            Text(
              title!,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: const Color(0xFF131316),
              ),
            ),
            const SizedBox(height: 8),
          ]
        ],
      ),
    );
  }
}
