import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../helpers/responsive.dart';
import '../../../helpers/styles.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({
    Key? key,
    required this.title,
    required this.message,
    this.warning = false,
    this.alert = false,
    this.date,
  }) : super(key: key);

  final String title;
  final String message;
  final bool warning;
  final bool alert;
  final String? date;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: warning || alert
              ? BorderSide(
                  color: warning ? const Color(0xffFFC399) : const Color(0xffB0D6F2),
                )
              : BorderSide.none,
          bottom: BorderSide(
            color: warning || alert
                ? warning
                    ? const Color(0xffFFC399)
                    : const Color(0xffB0D6F2)
                : const Color(0xFFE5E5E6),
          ),
        ),
        gradient: warning || alert
            ? RadialGradient(
                radius: 0.0,
                colors: [
                  if (warning) ...const [
                    Color(0xFFFFC399),
                    Color(0xFFFFF0E5),
                  ],
                  if (alert) ...const [
                    Color(0xFFB0D6F2),
                    Color(0xFFE5F1FF),
                  ],
                ],
              )
            : null,
      ),
      height: Responsive.isweb(context)
          ? warning || alert
              ? 136
              : 76
          : warning || alert
              ? 176
              : 116,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (warning || alert) ...[
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: SvgPicture.asset(
                  warning ? 'assets/warning-icon.svg' : 'assets/alert-icon.svg',
                ),
              ),
            ],
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: warning || alert
                              ? messageCardTitleReforcedStyle
                              : messageCardTitleStyle,
                        ),
                      ),
                      if (date != null) ...[
                        Text(
                          date!,
                          style: messageCardContentStyle,
                        ),
                      ],
                    ],
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        message,
                        style: messageCardContentStyle,
                      ),
                    ),
                  ),
                  if (warning || alert) ...[
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: SizedBox(
                        width: 87,
                        height: 40,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(Colors.white),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Resolver',
                            style: warning
                                ? messageCardButtonWarningStyle
                                : messageCardButtonAlertStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
