import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opinarti/helpers/colors.dart';
import 'package:opinarti/helpers/responsive.dart';

class DefaultCard extends StatefulWidget {
  const DefaultCard({
    super.key,
    this.child,
    this.title,
    this.width,
    this.trailing,
    this.activeTrailing = false,
    this.paddingContent,
  });
  final Widget? child;
  final String? title;
  final double? width;
  final Widget? trailing;
  final bool activeTrailing;
  final EdgeInsetsGeometry? paddingContent;

  @override
  State<DefaultCard> createState() => _DefaultCardState();
}

class _DefaultCardState extends State<DefaultCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: SizedBox(
          width: widget.width ?? 1081,
          child: Card(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            margin: EdgeInsets.zero,
            color: onPrimaryColor,
            child: widget.child == null
                ? Container()
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: onPrimaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 16),
                                  child: Text(
                                    widget.title ?? "",
                                    style: GoogleFonts.roboto(
                                        letterSpacing: -.02,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: const Color(0xFF09242E)),
                                  ),
                                ),
                                if (widget.activeTrailing) ...[
                                  widget.trailing ?? Container()
                                ],
                              ],
                            ),
                            const Divider(
                              thickness: 1,
                              height: 0,
                              color: Color(0xffD1D1D1),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: widget.paddingContent ??
                            EdgeInsets.all(
                                Responsive.isMobile(context) ? 16 : 16),
                        child: widget.child!,
                      ),
                    ],
                  ),
          ),
        ));
  }
}
