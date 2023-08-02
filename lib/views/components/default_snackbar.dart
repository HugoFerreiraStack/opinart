import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opinarti/helpers/responsive.dart';

void defaultSnackBar(
  BuildContext context,
  String message, {
  bool canClose = true,
  String? labelOnPressed,
  Function? onPressed,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      width: Responsive.isMobile(context)
          ? MediaQuery.of(context).size.width - 16
          : 480,
      backgroundColor: const Color(0xFF09242E),
      showCloseIcon: canClose,
      closeIconColor: const Color(0xFFC0E0EF),
      action: labelOnPressed == null || onPressed == null
          ? null
          : SnackBarAction(
              label: labelOnPressed,
              textColor: const Color(0xFF93C7ED),
              onPressed: () async {
                await onPressed();
              },
            ),
      content: Row(
        children: [
          Text(
            message,
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0XFFFFFFFF),
            ),
          ),
        ],
      ),
    ),
  );
}
