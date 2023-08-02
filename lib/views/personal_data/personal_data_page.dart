import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:opinarti/controllers/auth_controller.dart';
import 'package:opinarti/helpers/responsive.dart';
import 'package:opinarti/helpers/validators.dart';
import 'package:opinarti/views/components/default_button.dart';

import '../../views/components/default_card.dart';
import '../../views/components/default_page.dart';
import '../components/default_text_field.dart';

class PersonalDataPage extends StatefulWidget {
  const PersonalDataPage({super.key});

  @override
  State<PersonalDataPage> createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
  final authController = Get.find<AuthController>();

  final _formKey = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();

  final phoneController = TextEditingController();

  final passwordController = TextEditingController();
  final newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      centerChild: true,
      title: "Meus dados",
      children: <Widget>[
        DefaultCard(
          width: 900,
          title: 'Dados pessoais',
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  runSpacing: 8,
                  children: [
                    SizedBox(
                      width: validateWidth(context,
                          widthMobile: 426, widthTablet: 304, widthWeb: 426),
                      child: DefaultTextField(
                        onChanged: (value) {
                          authController.isDataModified.value = true;
                        },
                        title: "Nome",
                        label: "Nome",
                        initialValue: authController.varName.value,
                        onSaved: (value) {
                          nameController.text = value!;
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
                    SizedBox(
                      width: validateWidth(context,
                          widthMobile: 426, widthTablet: 304, widthWeb: 426),
                      child: DefaultTextField(
                        enabled: false,
                        title: "E-mail",
                        initialValue: authController.user.value!.email,
                        label: "E-mail",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Wrap(
                  runSpacing: 8,
                  children: [
                    SizedBox(
                      width: validateWidth(context,
                          widthMobile: 426, widthTablet: 304, widthWeb: 426),
                      child: DefaultTextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter()
                        ],
                        onChanged: (value) {
                          authController.isDataModified.value = true;
                        },
                        title: "Telefone",
                        label: "Telefone",
                        keyboardType: TextInputType.phone,
                        initialValue: authController.user.value!.phone,
                        onSaved: (value) {
                          phoneController.text = value!;
                        },
                        validator: (String? name) {
                          if (name == null || name.isEmpty) {
                            return 'Digite um número!';
                          }
                          if (name.length < 14) {
                            return "Digite um Telefone válido!";
                          }

                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    SizedBox(
                      width: validateWidth(context,
                          widthMobile: 426, widthTablet: 304, widthWeb: 426),
                      child: const DefaultTextField(
                        enabled: false,
                        label: "Nivel de acesso",
                        initialValue: "Gestor",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Wrap(
                  runSpacing: 8,
                  children: [
                    SizedBox(
                      width: validateWidth(context,
                          widthMobile: 426, widthTablet: 304, widthWeb: 426),
                      child: DefaultTextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CnpjInputFormatter()
                        ],
                        title: "CNPJ",
                        label: "CNPJ",
                        keyboardType: TextInputType.number,
                        enabled: false,
                        initialValue: authController.user.value!.cnpj,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    SizedBox(
                      width: validateWidth(context,
                          widthMobile: 426, widthTablet: 304, widthWeb: 426),
                      child: const DefaultTextField(
                        title: "Empresa",
                        label: "Empresa",
                        enabled: false,
                        initialValue: "Mais Sabor",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                GetX<AuthController>(builder: (authController) {
                  return DefaultButtom(
                    indicatorColor: const Color(0xFF787A7D),
                    text: "Salvar edição",
                    activeButton: !authController.isLoading.value &&
                        authController.isDataModified.value,
                    isLoading: authController.isLoading.value,
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        final result = await authController.personalUpdate(
                          name: nameController.text,
                          lastName: lastNameController.text,
                          phone: phoneController.text,
                          token: authController.user.value!.token!,
                          userId: authController.user.value!.id!,
                          context: context,
                        );

                        if (result) {
                          authController.varName.value = nameController.text;
                          authController.varSurname.value =
                              lastNameController.text;
                          if (context.mounted) {
                            FocusScope.of(context).unfocus();
                          }
                        }

                        authController.isDataModified.value = false;
                      } else {}
                    },
                  );
                })
              ],
            ),
          ),
        ),
        DefaultCard(
          width: 900,
          title: 'Nova senha',
          child: Form(
            key: _formKeyPassword,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Wrap(
                  runSpacing: 8,
                  children: [
                    SizedBox(
                      width: validateWidth(context,
                          widthMobile: 426, widthTablet: 304, widthWeb: 426),
                      child: DefaultTextField(
                        controller: passwordController,
                        onChanged: (value) {
                          authController.isPassWordModified.value = true;
                        },
                        title: "Senha atual",
                        label: "Senha atual",
                        validator: (String? password) {
                          if (password == null || password.isEmpty) {
                            return 'Digite sua senha atual!';
                          }
                          if (password.length < 8) {
                            return "Digite uma senha com pelo menos 8 caracteres.";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(
                        width: validateWidth(context,
                            widthMobile: 426, widthTablet: 304, widthWeb: 426),
                      ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Wrap(
                  runSpacing: 8,
                  children: [
                    SizedBox(
                      width: validateWidth(context,
                          widthMobile: 426, widthTablet: 304, widthWeb: 426),
                      child: DefaultTextField(
                        onChanged: (value) {
                          authController.isPassWordModified.value = true;
                        },
                        controller: newPasswordController,
                        title: "Nova senha",
                        label: "Nova senha",
                        helperText: "Deve conter pelo menos 8 caracteres",
                        validator: (String? password) {
                          if (password == null || password.isEmpty) {
                            return 'Digite uma nova senha!';
                          }
                          if (password.length < 8) {
                            return "Digite uma senha com pelo menos 8 caracteres.";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    SizedBox(
                      width: validateWidth(context,
                          widthMobile: 426, widthTablet: 304, widthWeb: 426),
                      child: DefaultTextField(
                        onChanged: (value) {
                          authController.isPassWordModified.value = true;
                        },
                        title: "Repetir senha",
                        label: "Repetir senha",
                        validator: (String? password) {
                          if (password == null || password.isEmpty) {
                            return 'Repita a senha!';
                          }
                          if (password != newPasswordController.text) {
                            return "As senhas digitadas não coincidem";
                          }
                          if (password.length < 8) {
                            return "Digite uma senha com pelo menos 8 caracteres.";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                GetX<AuthController>(builder: (authController) {
                  return DefaultButtom(
                    text: "Salvar nova senha",
                    indicatorColor: const Color(0xFF787A7D),
                    isLoading: authController.isLoadingPassword.value,
                    activeButton: !authController.isLoadingPassword.value &&
                        authController.isPassWordModified.value,
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (_formKeyPassword.currentState!.validate()) {
                        authController.changePassword(
                          context: context,
                          currentPassword: passwordController.text,
                          newPassword: newPasswordController.text,
                        );
                        authController.isPassWordModified.value = false;
                      }
                    },
                  );
                })
              ],
            ),
          ),
        ),
      ],
    );
  }
}
