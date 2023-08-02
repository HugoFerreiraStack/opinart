import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opinarti/helpers/colors.dart';

class SideMenuListTile extends StatelessWidget {
  const SideMenuListTile(
      {super.key,
      this.isSelectded = false,
      this.isExpanded = false,
      this.icon,
      this.title,
      required this.onTap,
      this.activeIndicatorInt = false});
  final bool isSelectded;
  final bool isExpanded;
  final bool activeIndicatorInt;
  final String? icon, title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    if (isExpanded) {
      return Material(
        color: isSelectded ? const Color(0xff09242E) : onPrimaryColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          hoverColor: isSelectded ? Colors.transparent : null,
          onTap: onTap,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            icon!,
                            color: isSelectded == true
                                ? const Color(0xffC0E0EF)
                                : const Color(0xff09242E),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            title ?? "",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: isSelectded == true
                                  ? const Color(0xffF5F8FA)
                                  : const Color(0xff09242E),
                              letterSpacing: 0.2,
                            ),
                          )
                        ],
                      ),
                    ),
                    if (activeIndicatorInt)
                      Text(
                        "00",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: const Color(0xff35383B),
                          letterSpacing: 0.2,
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Material(
      color: isSelectded ? const Color(0xffCBE5F6) : onPrimaryColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        hoverColor: isSelectded ? Colors.transparent : null,
        onTap: onTap,
        child: SizedBox(
          height: 56,
          width: 56,
          child: SvgPicture.asset(
            icon!,
            fit: BoxFit.scaleDown,
            color: const Color(0xff35383B),
          ),
        ),
      ),
    );
  }
}
