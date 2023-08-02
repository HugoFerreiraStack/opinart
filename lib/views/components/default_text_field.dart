import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opinarti/helpers/colors.dart';

class DefaultTextField extends StatefulWidget {
  const DefaultTextField({
    super.key,
    this.activePrefixIcon = false,
    this.label,
    this.icon,
    this.maxLines = 1,
    this.hintText,
    this.title,
    this.controller,
    this.keyboardType,
    this.validator,
    this.initialValue,
    this.enabled = true,
    this.onSaved,
    this.onChanged,
    this.isLoading = false,
    this.suffixIcon,
    this.obscureText = false,
    this.showError = false,
    this.onTap,
    this.helperText,
    this.inputFormatters,
    this.autofillHints,
  });

  final bool activePrefixIcon;
  final String? label;
  final String? icon;
  final int maxLines;
  final String? hintText;
  final String? title;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final String? initialValue;
  final Widget? suffixIcon;
  final bool isLoading;
  final bool showError;
  final String? helperText;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;

  final bool enabled;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          autofillHints: widget.autofillHints,
          inputFormatters: widget.inputFormatters,
          onTap: widget.onTap,
          onSaved: widget.onSaved,
          enabled: widget.enabled,
          initialValue: widget.initialValue,
          onChanged: widget.onChanged,
          controller: widget.controller,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          cursorColor: const Color(0xFF35383B),
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: !widget.enabled
                  ? const Color(0xFFB5B8BB).withOpacity(0.48)
                  : const Color(0xFF787A7D)),
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            errorText: widget.showError
                ? widget.validator!(widget.controller!.text)
                : null,
            suffixIcon: widget.suffixIcon,
            alignLabelWithHint: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            prefixIcon: widget.activePrefixIcon == true
                ? SvgPicture.asset(widget.icon!,
                    fit: BoxFit.scaleDown,
                    color: widget.enabled
                        ? const Color(0xFF787A7D)
                        : const Color(0xFFB5B8BB).withOpacity(0.48))
                : null,
            fillColor: Colors.white,
            filled: true,
            helperText: widget.helperText,
            helperStyle: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: const Color(0xFF787A7D)),
            labelStyle: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: widget.showError == true
                    ? const Color(0xffDA1E28)
                    : !widget.enabled
                        ? const Color(0xFFB5B8BB).withOpacity(0.48)
                        : const Color(0xFF787A7D)),
            hintStyle: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: const Color(0xff2363AB),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  width: widget.showError == true ? 2 : 1,
                  color: widget.showError == true
                      ? const Color(0xffDA1E28)
                      : const Color(0xff585C5F)),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: widget.isLoading
                      ? const Color(0xff585C5F)
                      : dividerColor),
            ),
            errorStyle: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              letterSpacing: -.02,
              color: const Color(0xffDA1E28),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Color(0xffDA1E28)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Color(0xff359FD8)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Color(0xff359FD8)),
            ),
            label: widget.hintText == null
                ? Text(
                    widget.label ?? "",
                  )
                : null,
            hintText: widget.hintText,
          ),
        ),
      ],
    );
  }
}
