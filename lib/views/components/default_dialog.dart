import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> defaultDialog(
    {required BuildContext context,
    required String title,
    String? message,
    String? labelPrimaryAction,
    String? labelSecondaryAction,
    required void Function()? onPressedConfirm}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(28.0),
          ),
        ),
        insetPadding: const EdgeInsets.all(24),
        title: Text(title),
        titleTextStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          fontSize: 22,
          color: const Color(0xFF35383B),
        ),
        content: SizedBox(
          width: 640,
          child: Text(message ?? ""),
        ),
        contentPadding: const EdgeInsets.fromLTRB(24.0, 12.0, 0.0, 34.0),
        contentTextStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: const Color(0xFF787A7D),
        ),
        actionsPadding: const EdgeInsets.only(bottom: 24, right: 24),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              labelPrimaryAction ?? "Cancelar",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: const Color(0xFF17468C),
              ),
            ),
          ),
          TextButton(
            onPressed: onPressedConfirm,
            child: Text(
              labelSecondaryAction ?? "Sair",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: const Color(0xFF17468C),
              ),
            ),
          ),
        ],
      );
    },
  );
}

Future<void> defaultDialogData(
    {required BuildContext context, required String title}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return Padding(
          padding: const EdgeInsets.all(100.0),
          child: Column(
            children: [
              Container(
                color: const Color(0xffFFFFFF),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(title)),
                      ],
                    )
                  ],
                ),
              )
            ],
          ));
    },
  );
}
