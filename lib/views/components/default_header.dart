import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:opinarti/helpers/colors.dart';
import 'package:opinarti/helpers/page_routes.dart';
import 'package:opinarti/views/components/default_button.dart';
import 'package:opinarti/views/components/user_profile.dart';

import 'default_popup_menu.dart';

class DefaultHeader extends StatelessWidget {
  const DefaultHeader(
      {super.key,
      this.title,
      this.icon,
      this.activeButtom = false,
      this.onPressed,
      this.actionTitle,
      this.activeMenu = false,
      this.activeIconTitle = false,
      this.activeSafeArea = false});
  final String? title, icon, actionTitle;
  final bool activeButtom;
  final void Function()? onPressed;
  final bool activeMenu;
  final bool? activeIconTitle;
  final bool activeSafeArea;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFFFFF),
      child: Padding(
        padding: activeSafeArea
            ? EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
              )
            : EdgeInsets.zero,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: activeIconTitle == true ? 12 : 14,
              horizontal: activeIconTitle == true ? 0 : 24),
          child: Column(
            children: [
              Row(
                children: [
                  activeIconTitle == false
                      ? Expanded(
                          child: Text(
                            title ?? "",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: fontColor),
                          ),
                        )
                      : Expanded(
                          child: SizedBox(
                              height: 32,
                              child: SvgPicture.asset(
                                  "assets/brand_bootstrap.svg")),
                        ),
                  if (activeButtom) ...[
                    DefaultButtom(
                      activeIcon: true,
                      activeButton: true,
                      text: actionTitle,
                      icon: icon,
                      onPressed: onPressed,
                    ),
                    const SizedBox(
                      width: 36,
                    ),
                  ],
                  if (activeMenu) ...[
                    Row(
                      children: [
                        PopupMenu(
                          child: SizedBox(
                              key: GlobalKey(),
                              height: 48,
                              width: 48,
                              child: SvgPicture.asset(
                                "assets/notification.svg",
                                fit: BoxFit.scaleDown,
                              )),
                        ),
                        InkWell(
                            onTap: () {
                              Get.toNamed(PagesRoutes.support);
                            },
                            borderRadius: BorderRadius.circular(100),
                            splashColor: const Color(0xffE7E7EE),
                            child: SizedBox(
                                height: 48,
                                width: 48,
                                child: SvgPicture.asset(
                                  "assets/suporte.svg",
                                  fit: BoxFit.scaleDown,
                                ))),
                        const SizedBox(
                          width: 8,
                        ),
                        const UserProfile()
                      ],
                    )
                  ]
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
