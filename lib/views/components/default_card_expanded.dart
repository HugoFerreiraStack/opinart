import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:opinarti/controllers/card_expanded_controller.dart';
import 'package:opinarti/helpers/colors.dart';
import 'package:opinarti/helpers/responsive.dart';
import 'dart:math' as math;

class DefaultCardExpanded extends StatefulWidget {
  const DefaultCardExpanded({
    super.key,
    this.child,
    this.title,
    this.width,
    this.isCardExpansive = false,
    this.trailing,
    this.activeTrailing = false,
    this.paddingContent,
  });
  final Widget? child;
  final Widget? title;
  final double? width;
  final bool isCardExpansive;
  final Widget? trailing;
  final bool activeTrailing;
  final EdgeInsetsGeometry? paddingContent;

  @override
  State<DefaultCardExpanded> createState() => _DefaultCardExpandedState();
}

class _DefaultCardExpandedState extends State<DefaultCardExpanded> {
  @override
  Widget build(BuildContext context) {
    final CardExpandedController controller = CardExpandedController();

    return GetX<CardExpandedController>(builder: (_) {
      return SizedBox(
        width: widget.width ?? 1081,
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: EdgeInsets.zero,
          color: onPrimaryColor,
          child: widget.child == null
              ? Container()
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: widget.isCardExpansive
                          ? () {
                              controller.isExpanded.value = !controller.isExpanded.value;
                            }
                          : null,
                      child: Container(
                        decoration: BoxDecoration(
                            color: onPrimaryColor, borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            if (widget.isCardExpansive) ...[
                              SizedBox(
                                height: 48,
                                width: 48,
                                child: Transform.rotate(
                                  angle: controller.isExpanded.value ? 0 : 180 * math.pi / 180,
                                  child: SvgPicture.asset(
                                    "assets/arrow_down_line.svg",
                                    fit: BoxFit.scaleDown,
                                    color: const Color(0xFF17468C),
                                  ),
                                ),
                              ),
                            ],
                            widget.title ?? Container(),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: dividerColor,
                    ),
                    if (controller.isExpanded.value) ...[
                      Padding(
                        padding: widget.paddingContent ??
                            EdgeInsets.all(Responsive.isMobile(context) ? 16 : 16),
                        child: widget.child!,
                      ),
                    ]
                  ],
                ),
        ),
      );
    });
  }
}
