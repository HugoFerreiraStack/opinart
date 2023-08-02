import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:opinarti/models/user/user_model.dart';
import 'package:opinarti/views/components/table/default_cell.dart';

import '../../../controllers/access_management_controller.dart';
import '../../../controllers/list_tile_user_controller.dart';

class ListTileUsers extends StatefulWidget {
  const ListTileUsers({
    super.key,
    this.formKey,
    this.widht,
    required this.user,
    required this.acessController,
  });

  final Key? formKey;
  final double? widht;
  final UserModel user;
  final AccessManagementController acessController;

  @override
  State<ListTileUsers> createState() => _ListTileUsersState();
}

class _ListTileUsersState extends State<ListTileUsers> {
  late RxBool isBlocked;
  late RxString varName;

  @override
  void initState() {
    dropdownValue = widget.user.admin! ? "Admin" : "Gestor";
    isBlocked = widget.user.blocked!.obs;
    varName = widget.user.name!.obs;

    createdAt = DateTime.tryParse(widget.user.createdAt ?? "");
    updatedAt = DateTime.tryParse(widget.user.updatedAt ?? "");

    super.initState();
  }

  final controller = Get.find<ListTileUserController>();

  final nomeController = TextEditingController();
  final sobrenomeController = TextEditingController();
  final acessoController = TextEditingController();
  final emailController = TextEditingController();
  final empresaController = TextEditingController();
  final createAtController = TextEditingController();
  final updateAtController = TextEditingController();
  DateTime? createdAt;
  DateTime? updatedAt;

  // final format = DateFormat("dd/MM/yyyy");
  // final _formKey = GlobalKey<FormState>();

  var items = ['Admin', 'Gestor'];
  late String dropdownValue;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      return ListTileDefault(
        rows: [
          DefaultCell(
            width: 148,
            text: widget.user.name!,
          ),
          const DefaultCell(
            width: 148,
            text: "Vencimento",
          ),
          const DefaultCell(
            width: 148,
            text: "Dispositivo",
          ),
          const DefaultCell(
            width: 148,
            text: "Status",
          ),
          const DefaultCell(
            width: 148,
            text: "Status",
          ),
        ],
      );
    });
  }
}

class ListTileDefault extends StatelessWidget {
  const ListTileDefault({
    super.key,
    this.rows,
  });

  final List<Widget>? rows;

  @override
  Widget build(BuildContext context) {
    return Row(children: rows?.toList() ?? []);
  }
}

class SuspendedMenu extends StatelessWidget {
  const SuspendedMenu({super.key, required this.suspendedItems, this.activeShadow = true});
  final List<SuspendedItem> suspendedItems;
  final bool activeShadow;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (activeShadow)
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
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: suspendedItems,
        ),
      ],
    );
  }
}

class SuspendedItem extends StatelessWidget {
  const SuspendedItem({super.key, required this.height, required this.width, required this.iconPath, this.onTap, required this.color});
  final double height, width;
  final String iconPath;
  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Color(0xFfEBEBEB))),
          color: Colors.white,
        ),
        height: 56,
        child: Padding(
          padding: const EdgeInsets.only(right: 4, left: 2, top: 4, bottom: 4),
          child: SizedBox(
              height: height,
              width: width,
              child: SvgPicture.asset(
                iconPath,
                fit: BoxFit.scaleDown,
                color: color,
              )),
        ),
      ),
    );
  }
}

/*
GestureDetector(
      onTap: () {
        defaultDialogData(
          context: context,
          title: '',
        );
      },
      child: Container(
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Color(0xFFE5E5E6)))),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
          ),
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Text(
                    text ?? "",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: const Color(0xFF35383B),
                    ),
                  )),
              Text(
                licenseStatus ? "Regular" : "Irregular",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: licenseStatus
                      ? const Color(0xFF2D8F4A)
                      : const Color(0xFF585C5F),
                ),
              ),
              SizedBox(
                width: 64,
                height: 48,
                child: Center(
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: status
                        ? const Color(0xffEBF5EE)
                        : const Color(0xffFBE9EA),
                    child: CircleAvatar(
                      radius: 3,
                      backgroundColor: status
                          ? const Color(0xff2D8F4A)
                          : const Color(0xffDA1E28),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 48,
                height: 48,
                child: PopupMenuButton(
                  offset: const Offset(-10, 0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  padding: const EdgeInsets.all(0),
                  child: SvgPicture.asset(
                    "assets/more-line.svg",
                    fit: BoxFit.scaleDown,
                  ),
                  onSelected: (value) async {
                    if (value == 1) {
                    } else if (value == 2) {
                    } else if (value == 3) {
                    } else if (value == 4) {
                    } else if (value == 5) {}
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 12),
                      value: 1,
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/attachment-line.svg"),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text("Ver licença"),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 12),
                      value: 2,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset("assets/chat-1-line.svg"),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text("Enviar mensagem"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 12),
                      value: 3,
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/pencil-line.svg"),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text("Editar"),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 4,
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 12),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/lock-line.svg"),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text("Bloquear"),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 12),
                      value: 5,
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/delete-bin-line.svg"),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text("Excluir"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              )
            ],
          ),
        ),
      ),
    );
 */
/**
 DefaultCardExpanded(
          isCardExpansive: true,
          activeTrailing: true,
          title: Expanded(
            child: Row(
              children: [
                Obx(() {
                  return Expanded(
                    flex: Responsive.isMobile(context) ? 1 : 3,
                    child: DefaultCell(
                      text: varName.value,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF35383B),
                    ),
                  );
                }),
                Expanded(
                  flex: Responsive.isMobile(context) ? 1 : 2,
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() {
                            return DefaultChips(
                              colorBackground: isBlocked.value
                                  ? const Color(0xFFFBE9EA)
                                  : const Color(0xFFEBF5EE),
                              title: isBlocked.value ? 'Bloqueado' : 'Ativo',
                              textColor: isBlocked.value
                                  ? const Color(0xFF660005)
                                  : const Color(0xFF0C5E24),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 6,
                    child: DefaultCell(
                      color: const Color(0xFF35383B),
                      text: widget.user.email ?? "",
                    ),
                  ),
              ],
            ),
          ),
          width: MediaQuery.of(context).size.width,
          paddingContent: EdgeInsets.zero,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: DefaultTextField(
                          label: "Nome",
                          initialValue: widget.user.name,
                          onSaved: (value) {
                            nomeController.text = value!;
                          },
                          validator: (String? name) {
                            if (name == null || name.isEmpty) {
                              return 'Digite um nome!';
                            }

                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: DefaultTextField(
                          label: "Sobrenome",
                          initialValue: widget.user.lastName,
                          onSaved: (value) {
                            sobrenomeController.text = value!;
                          },
                          validator: (String? lastName) {
                            if (lastName == null || lastName.isEmpty) {
                              return 'Digite um Sobrenome!';
                            }
                            return null;
                          },
                        ),
                      ),
                      if (!Responsive.isMobile(context)) ...[
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xff585C5F)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: StatefulBuilder(
                                builder: (BuildContext context, setState) {
                                  return DropdownButton(
                                    borderRadius: BorderRadius.circular(10),
                                    value: dropdownValue,
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: const Color(0xFF787A7D),
                                    ),
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 12,
                                          ),
                                          child: Text(items),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() => dropdownValue = newValue!);
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        if (constraints.maxWidth > 1000 &&
                            Responsive.isweb(context)) ...[
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            //Retornar a empresa
                            child: DefaultTextField(
                              label: "Empresa",
                              initialValue: widget.user.cnpj,
                              onSaved: (value) {
                                empresaController.text = value!;
                              },
                              validator: (String? cnpj) {
                                if (cnpj == null || cnpj.isEmpty) {
                                  return 'Digite um CNPJ!';
                                }

                                if (!cnpj.isCnpj) {
                                  return 'Digite um CNPJ válido!';
                                }

                                return null;
                              },
                            ),
                          ),
                        ],
                        const Spacer()
                      ]
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  if (Responsive.isMobile(context)) ...[
                    Row(
                      children: [
                        Expanded(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xff585C5F)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: StatefulBuilder(
                                builder: (BuildContext context, setState) {
                                  return DropdownButton(
                                    borderRadius: BorderRadius.circular(8),
                                    value: dropdownValue,
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: const Color(0xFF787A7D),
                                    ),
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 12,
                                          ),
                                          child: Text(items),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() => dropdownValue = newValue!);
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        const Spacer()
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    DefaultTextField(
                      label: "E-mail",
                      initialValue: widget.user.email,
                      enabled: false,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                  if (!Responsive.isweb(context) ||
                      constraints.maxWidth < 1000) ...[
                    Row(
                      children: [
                        //Retornar a empresa
                        Expanded(
                          flex: 2,
                          child: DefaultTextField(
                            label: "Empresa",
                            initialValue: widget.user.cnpj,
                            onSaved: (value) {
                              empresaController.text = value!;
                            },
                            validator: (String? cnjp) {
                              if (cnjp == null || cnjp.isEmpty) {
                                return 'Digite um CNPJ!';
                              }

                              return null;
                            },
                          ),
                        ),
                        if (Responsive.isTablet(context) ||
                            constraints.maxWidth < 1000 &&
                                !Responsive.isMobile(context))
                          const Spacer(
                            flex: 4,
                          )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                  Row(
                    children: [
                      Expanded(
                        child: DefaultTextField(
                          label: "Cadastro criado",
                          initialValue: createdAt != null
                              ? format.format(createdAt!)
                              : "",
                          activePrefixIcon: true,
                          icon: "assets/dateTimeIcon.svg",
                          enabled: false,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: DefaultTextField(
                          label: "Cadastro atualizado",
                          initialValue: updatedAt != null
                              ? format.format(updatedAt!)
                              : "",
                          activePrefixIcon: true,
                          icon: "assets/dateTimeIcon.svg",
                          enabled: false,
                        ),
                      ),
                      if (!Responsive.isMobile(context)) ...[
                        const Spacer(),
                        const Spacer()
                      ]
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Obx(
                    () {
                      return Row(
                        children: [
                          SizedBox(
                            width: 110,
                            child: DefaultButtom(
                              text: "Salvar edição",
                              activeButton: true,
                              isLoading: controller.updateIsLoading,
                              leftPadding: 12,
                              rightlPadding: 12,
                              topPadding: 8,
                              bottomPadding: 8,
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();

                                  // final result = await controller.updateUser(
                                  //   id: widget.user.id!,
                                  //   name: nomeController.text,
                                  //   lastName: sobrenomeController.text,
                                  //   cnpj: empresaController.text,
                                  //   admin: dropdownValue == "Admin",
                                  // );

                                  varName.value = nomeController.text;

                                  print(varName);

                                  // if (result) {
                                  //   widget.acessController.getUsers();
                                  // }
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Obx(() {
                            return SizedBox(
                              width: 110,
                              child: DefaultButtom(
                                buttomColor: const Color(0xFFFFE7D6),
                                textColor: const Color(0xFF702E00),
                                activeTextColor: true,
                                activeButton: !controller.changeIsLoading,
                                isLoading: controller.changeIsLoading,
                                indicatorColor: Colors.black,
                                onPressed: () async {
                                  isBlocked.toggle();
                                  final result = await controller.changeStatus(
                                    userId: widget.user.id,
                                    userBlocked: isBlocked.value,
                                  );
                                },
                                text: isBlocked.value
                                    ? "Desbloquear"
                                    : "Bloquear",
                                leftPadding: 12,
                                rightlPadding: 12,
                                topPadding: 8,
                                bottomPadding: 8,
                              ),
                            );
                          }),

                          const SizedBox(
                            width: 8,
                          ),
                          // DefaultButtom(
                          //   onPressed: () async {
                          //     final result =
                          //         await controller.deleteUser(userId: widget.user.id);

                          //     if (result) {
                          //       widget.acessController.getUsers();
                          //     }
                          //   },
                          //   activeButton: !controller.deleteIsLoading,
                          //   activeTextColor: true,
                          //   isLoading: controller.deleteIsLoading,
                          //   textColor: const Color(0xFF660005),
                          //   buttomColor: Colors.transparent,
                          //   text: "Deletar",
                          //   leftPadding: 12,
                          //   rightlPadding: 12,
                          //   topPadding: 8,
                          //   bottomPadding: 8,
                          // )
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          ));
 */
