import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:opinarti/controllers/drawer_controller.dart';
import 'package:opinarti/helpers/responsive.dart';
import 'package:opinarti/views/components/side_menu/components/side_menu_info_user.dart';
import 'package:opinarti/views/components/side_menu/components/side_menu_list_sections.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final DrawerExpandedController controller =
      Get.put(DrawerExpandedController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double widthSideMenu() {
      if (!Responsive.isMobile(context)) {
        return 360;
      } else {
        return MediaQuery.of(context).size.width - 56;
      }
    }

    return GetX<DrawerExpandedController>(builder: (_) {
      return Container(
          color: const Color(0xFFFFFFFF),
          width: Responsive.isweb(context)
              ? controller.isExpanded.value
                  ? 348
                  : 72
              : widthSideMenu(),
          height: double.infinity,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(
              top: 4,
              left: 8,
              right: 8,
            ),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: controller.isExpanded.value ||
                            !Responsive.isweb(context)
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
                    children: [
                      if (Responsive.isweb(context)) ...[
                        if (controller.isExpanded.value) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 154,
                                height: 56,
                                child: SvgPicture.asset(
                                  "assets/header_drawer_title.svg",
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.reduce();
                                },
                                child: SizedBox(
                                  width: 48,
                                  height: 48,
                                  child: SvgPicture.asset(
                                    "assets/short_menu.svg",
                                    fit: BoxFit.scaleDown,
                                    color: const Color(0xff131316),
                                  ),
                                ),
                              )
                            ],
                          )
                        ] else ...[
                          InkWell(
                            onTap: () {
                              controller.expand();
                            },
                            child: SizedBox(
                              width: 48,
                              height: 48,
                              child: SvgPicture.asset(
                                "assets/short_menu.svg",
                                fit: BoxFit.scaleDown,
                                color: const Color(0xff131316),
                              ),
                            ),
                          )
                        ],
                      ] else
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 154,
                              height: 56,
                              child: SvgPicture.asset(
                                "assets/header_drawer_title.svg",
                              ),
                            ),
                            InkWell(
                              child: SizedBox(
                                width: 48,
                                height: 48,
                                child: SvgPicture.asset(
                                  "assets/short_menu.svg",
                                  fit: BoxFit.scaleDown,
                                  color: const Color(0xff131316),
                                ),
                              ),
                            )
                          ],
                        ),
                      if (!Responsive.isweb(context))
                        SideMenuInfoUser(
                          expanded: controller.isExpanded.value,
                        ),
                      const SizedBox(
                        height: 16,
                      ),
                      SideMenuListSections(
                        !Responsive.isweb(context)
                            ? true
                            : controller.isExpanded.value,
                      ),
                      if (size.height <= 700) ...[
                        const SizedBox(
                          height: 62,
                        ),
                      ] else
                        const Spacer(),
                      SideMenuListSections(
                        !Responsive.isweb(context)
                            ? true
                            : controller.isExpanded.value,
                        isBottom: true,
                      ),
                      const Divider(
                        color: Color(0xffE5E5E6),
                      ),
                      if (Responsive.isweb(context))
                        SideMenuInfoUser(
                          expanded: controller.isExpanded.value,
                        )
                    ],
                  ),
                ),
              ],
            ),
          )));
    });
  }
}
