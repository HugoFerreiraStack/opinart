import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opinarti/controllers/auth_controller.dart';
import 'package:opinarti/helpers/page_routes.dart';
import 'package:opinarti/helpers/responsive.dart';
import 'package:opinarti/views/components/default_dialog.dart';
import 'package:opinarti/views/components/default_snackbar.dart';

import 'package:opinarti/views/components/side_menu/components/side_menu_list_tile.dart';

class SideMenuListSections extends StatelessWidget {
  SideMenuListSections(this.isExpanded, {super.key, this.isBottom = false});
  final authController = Get.find<AuthController>();
  final bool isExpanded;
  final bool isBottom;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isBottom) ...[
          if (!Responsive.isweb(context))
            SideMenuListTile(
              isExpanded: isExpanded,
              title: "Sair",
              icon: "assets/sair.svg",
              onTap: () {
                defaultDialog(
                    onPressedConfirm: () {
                      authController.signOut();
                    },
                    context: context,
                    title: 'Sair da conta',
                    message: "Quer mesmo sair da sua conta?");
              },
            ),
        ] else ...[
          if (!authController.user.value!.owner!) ...[
            SideMenuListTile(
                isExpanded: isExpanded,
                title: "Nova pesquisa",
                icon: "assets/add_line.svg",
                isSelectded: Get.routing.current == PagesRoutes.newSearch,
                onTap: () {
                  defaultSnackBar(context, "Blocked");
                }
                //onTap: () => Get.offAllNamed(PagesRoutes.newSearch),
                ),
            SideMenuListTile(
                activeIndicatorInt: true,
                isExpanded: isExpanded,
                title: "Todas as pesquisas",
                icon: "assets/list-ordered.svg",
                isSelectded: Get.routing.current == PagesRoutes.allSearch,
                onTap: () {
                  defaultSnackBar(context, "Blocked");
                }
                //() => Get.offAllNamed(PagesRoutes.allSearch),
                ),
            const Divider(),
            SideMenuListTile(
                isExpanded: isExpanded,
                activeIndicatorInt: true,
                title: "Aparelhos",
                icon: "assets/device-line.svg",
                isSelectded: Get.routing.current == PagesRoutes.totemAccess,
                onTap: () {
                  defaultSnackBar(context, "Blocked");
                }
                //onTap: () => Get.offAllNamed(PagesRoutes.totemAccess),
                ),
          ],

          // SideMenuListTile(
          //   isExpanded: isExpanded,
          //   title: "Empresas",
          //   icon: "assets/store-2-line.svg",
          //   isSelectded: Get.routing.current == PagesRoutes.configureTotem,
          //   onTap: () => Get.offAllNamed(PagesRoutes.configureTotem),
          // ),

          if (!authController.user.value!.manager!)
            SideMenuListTile(
                isExpanded: isExpanded,
                title: authController.user.value!.owner!
                    ? "Gestão de usuários"
                    : "Gestão de acessos",
                icon: "assets/user-add-line.svg",
                isSelectded:
                    Get.routing.current == PagesRoutes.accessManagement,
                onTap: () {
                  defaultSnackBar(context, "Blocked");
                }
                //onTap: () => Get.offAllNamed(PagesRoutes.accessManagement),
                ),
          const Divider(),
          SideMenuListTile(
            isExpanded: isExpanded,
            title: "Meus dados",
            icon: "assets/usuario.svg",
            isSelectded: Get.routing.current == PagesRoutes.personalData,
            onTap: () => Get.offAllNamed(PagesRoutes.personalData),
          ),

          const Divider(),
          if (!authController.user.value!.owner!) ...[
            SideMenuListTile(
                activeIndicatorInt: true,
                isExpanded: isExpanded,
                title: "Notificações",
                icon: "assets/notification.svg",
                isSelectded:
                    Get.routing.current == PagesRoutes.accessManagement,
                onTap: () {
                  defaultSnackBar(context, "Blocked");
                }
                //onTap: () => Get.offAllNamed(PagesRoutes.personalData),
                ),
            const Divider(),
          ],

          SideMenuListTile(
            isExpanded: isExpanded,
            title: "Suporte",
            activeIndicatorInt:
                authController.user.value!.owner! ? true : false,
            icon: "assets/feedback-line.svg",
            isSelectded: Get.routing.current == PagesRoutes.support,
            onTap: () => Get.offAllNamed(PagesRoutes.support),
          ),
        ]
      ],
    );
  }
}
