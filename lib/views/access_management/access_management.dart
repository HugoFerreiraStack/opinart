import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opinarti/controllers/auth_controller.dart';
import 'package:opinarti/controllers/common_controller.dart';
import 'package:opinarti/helpers/page_routes.dart';
import 'package:opinarti/helpers/responsive.dart';
import 'package:opinarti/helpers/validators.dart';
import 'package:opinarti/views/access_management/components/empty_users_card.dart';
import 'package:opinarti/views/access_management/components/list_tile_users.dart';
import 'package:opinarti/views/components/default_page.dart';
import 'package:opinarti/views/components/table/default_column.dart';

import '../../controllers/access_management_controller.dart';
import 'components/create_user.dart';

class AccessManagement extends StatefulWidget {
  const AccessManagement({super.key});

  @override
  State<AccessManagement> createState() => _AccessManagementState();
}

class _AccessManagementState extends State<AccessManagement> {
  @override
  void initState() {
    controller.getUsers();
    super.initState();
  }

  final controller = Get.find<AccessManagementController>();
  final controllerScrool = Get.find<CommomController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      backgroundColor: controller.users != null ? const Color(0xFFFFFFFF) : const Color(0xFFF5F8FA),
      inactivePadding: true,
      floatingActionButton: Responsive.isMobile(context)
          ? FloatingActionButton.extended(
              backgroundColor: const Color(0xFF09242E),
              onPressed: () async {
                await Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 400),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      animation = CurvedAnimation(parent: animation, curve: Curves.easeInQuad);
                      return ScaleTransition(
                        scale: animation,
                        alignment: Alignment.bottomRight,
                        child: child,
                      );
                    },
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const CreateUser();
                    },
                  ),
                );
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              label: Row(
                children: [
                  SvgPicture.asset(
                    "assets/add_line.svg",
                    color: const Color(0xFFC0E0EF),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Novo usuário",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                ],
              ),
            )
          : Container(),
      activeButtom: false,
      title: authController.user.value!.owner! ? "Gestão de usuários" : 'Gestão de acesso',
      children: [
        Obx(() {
          return Visibility(
            visible: !controller.isLoading.value,
            replacement: const CircularProgressIndicator(),
            child: DefaultTable(
              listNotInfo: EmptyUsersCard(
                onPressed: () {},
              ),
              visibleItems: controller.users != null,
              countItems: controller.users?.length ?? 0,
              listTile: List.generate(
                controller.users?.length ?? 0,
                (index) {
                  return Stack(
                    children: [
                      ListTileUsers(
                        user: controller.users![index],
                        acessController: controller,
                      ),
                    ],
                  );
                },
              ),
              suspendedMenu: List.generate(controller.users?.length ?? 0, (index) {
                return SuspendedMenu(
                  activeShadow: !controllerScrool.scroolShadowVisible.value,
                  suspendedItems: [
                    SuspendedItem(
                      onTap: () {
                        Get.toNamed(PagesRoutes.edit, arguments: {'user': controller.users?[index]});
                      },
                      height: 48,
                      iconPath: "assets/edit.svg",
                      width: 48,
                      color: const Color(0xFF359FD8),
                    ),
                    SuspendedItem(
                      onTap: () {
                        Get.toNamed(PagesRoutes.message, arguments: controller.users?[index]);
                      },
                      height: 48,
                      iconPath: "assets/chat.svg",
                      width: 48,
                      color: const Color(0xFF359FD8),
                    ),
                    SuspendedItem(
                      onTap: () {},
                      height: 48,
                      iconPath: "assets/burguer-menu.svg",
                      width: 48,
                      color: Colors.black,
                    ),
                  ],
                );
              }),
              columns: [
                DefaultColumn(
                  text: "Empresa",
                  width: validateWidth(context, widthMobile: 148, widthTablet: 148, widthWeb: 148),
                ),
                DefaultColumn(
                  text: "Responsável",
                  width: validateWidth(context, widthMobile: 148, widthTablet: 148, widthWeb: 148),
                ),
                DefaultColumn(
                  text: "Licença",
                  width: validateWidth(context, widthMobile: 148, widthTablet: 148, widthWeb: 148),
                ),
                DefaultColumn(
                  text: "Dispositivos",
                  width: validateWidth(context, widthMobile: 148, widthTablet: 148, widthWeb: 148),
                ),
                DefaultColumn(
                  text: "Status",
                  width: validateWidth(context, widthMobile: 148, widthTablet: 148, widthWeb: 148),
                ),
                DefaultColumn(
                  text: "",
                  width: validateWidth(context, widthMobile: 144, widthTablet: 144, widthWeb: 144),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

class DefaultTable extends StatefulWidget {
  const DefaultTable(
      {super.key, this.countItems = 0, this.columns, this.listTile, this.suspendedMenu, this.visibleItems = true, this.listNotInfo});

  final int countItems;
  final bool visibleItems;
  final List<DefaultColumn>? columns;
  final List<Widget>? suspendedMenu;
  final List<Widget>? listTile;
  final Widget? listNotInfo;

  @override
  State<DefaultTable> createState() => _DefaultTableState();
}

class _DefaultTableState extends State<DefaultTable> {
  final controller = Get.find<CommomController>();
  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    // Adicionando um listener para o evento de rolagem
    scrollController.addListener(() {
      // Verificando se a rolagem atingiu o final horizontal
      final atEnd = scrollController.position.maxScrollExtent == scrollController.position.pixels;

      if (atEnd != controller.scroolShadowVisible.value) {
        controller.scroolShadowVisible.value = atEnd;
      }
    });

    return SizedBox(
        child: Visibility(
      //logica se será possivel visualizar a lista
      visible: widget.visibleItems,
      //Colocar o componente em caso de lista vazia ou nula
      replacement: widget.listNotInfo ?? Container(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Contador "setar a quantidade Ex: controller.users?.lengt"
          DefaultColumn(
            color: const Color(0xFFFFFFFF),
            text: widget.countItems < 10 ? "0${widget.countItems} usuários" : "${widget.countItems} usuários",
            activeIcon: false,
            width: validateWidth(context, widthMobile: 148, widthTablet: 148, widthWeb: 148),
          ),
          Stack(
            children: [
              SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //setar a lista de colunas que tera a pagina
                    Row(
                      children: widget.columns ?? [],
                    ),
                    //setar a lista de linhas que tera as colunas
                    Column(children: widget.listTile ?? []),
                  ],
                ),
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      if (!controller.scroolShadowVisible.value)
                        Positioned(
                          right: 162,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            width: 3,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: DefaultColumn(
                          text: "Ações",
                          activeIcon: false,
                          width: validateWidth(context, widthMobile: 162, widthTablet: 162, widthWeb: 162),
                        ),
                      ),
                    ],
                  ),
                  //setar os itens de acao que tera as colunas
                  Column(children: widget.suspendedMenu ?? []),
                ],
              )
            ],
          ),
        ],
      ),
    ));
  }
}
