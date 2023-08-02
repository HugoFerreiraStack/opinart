// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opinarti/helpers/styles.dart';

class DefaultButtom extends StatelessWidget {
  const DefaultButtom({
    super.key,
    this.text,
    this.onPressed,
    this.activeButton = false,
    this.activeIcon = false,
    this.icon,
    this.textColor,
    this.buttomColor,
    this.styleButtom,
    this.isLoading = false,
    this.activeTextColor = false,
    this.indicatorColor,
    this.topPadding,
    this.bottomPadding,
    this.leftPadding,
    this.rightlPadding,
    this.activeBorder = false,
  });

  final String? text, icon;
  final void Function()? onPressed;
  final bool activeButton;
  final bool isLoading;
  final bool activeIcon;
  final bool activeTextColor;
  final Color? textColor;
  final Color? buttomColor;
  final TextStyle? styleButtom;
  final Color? indicatorColor;
  final double? topPadding;
  final double? bottomPadding;
  final double? leftPadding;
  final double? rightlPadding;
  final bool activeBorder;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: activeBorder
              ? BorderSide(
                  width: activeBorder ? 1 : 0, color: const Color(0xFF09242E))
              : BorderSide.none),
      color: buttomColor ??
          (activeButton && !isLoading
              ? const Color(0xFF09242E)
              : const Color(0xffEAEBEB)),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: activeButton ? onPressed : null,
        child: Padding(
          padding: EdgeInsets.only(
            left: leftPadding ?? 16,
            right: rightlPadding ?? 16,
            top: topPadding ?? 8,
            bottom: bottomPadding ?? 8,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!isLoading) ...[
                if (activeIcon) ...[
                  SvgPicture.asset(
                    icon!,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                ],
                Text(
                  text ?? "",
                  style: !activeTextColor
                      ? styleButtom ??
                          (activeButton
                              ? buttonactiveLabelStyle
                              : buttonLabelStyle)
                      : GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: textColor,
                        ),
                ),
              ] else
                SizedBox(
                    width: 20,
                    height: 20,
                    child: CupertinoActivityIndicator(
                      color: indicatorColor ?? const Color(0xFF09242E),
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
