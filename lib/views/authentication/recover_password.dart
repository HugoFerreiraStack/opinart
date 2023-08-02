import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opinarti/controllers/auth_controller.dart';
import 'package:opinarti/helpers/colors.dart';
import 'package:opinarti/helpers/responsive.dart';
import 'package:opinarti/views/components/default_button.dart';
import 'package:opinarti/views/components/default_recover_password.dart';
import 'package:opinarti/views/components/default_text_field.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/default_header.dart';

class RecoverPassword extends StatefulWidget {
  const RecoverPassword({super.key});

  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void openWeb() async {
    const String url = "https://locarti.com.br/politica-de-privacidade/";

    launchUrl(
        Uri.parse(
          url,
        ),
        mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Responsive.isMobile(context)
            ? AppBar(
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Color(0xFFFFFFFF),
                  statusBarIconBrightness: Brightness.dark,
                  statusBarBrightness: Brightness.dark,
                ),
                backgroundColor: const Color(0xFFFFFFFF),
                elevation: 0,
                title: SizedBox(
                  width: 172,
                  child: SvgPicture.asset(
                    "assets/brand_bootstrap.svg",
                    fit: BoxFit.scaleDown,
                  ),
                ),
                centerTitle: true,
              )
            : null,
        backgroundColor: onPrimaryColor,
        body: GetX<AuthController>(builder: (authController) {
          return Container(
              color: Responsive.isMobile(context)
                  ? const Color(0xFFF5F5F5)
                  : const Color(0xffF5F5F5),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        if (!Responsive.isMobile(context)) ...[
                          const DefaultHeader(
                            activeIconTitle: true,
                            activeSafeArea: true,
                          ),
                          const Spacer(),
                        ],
                        if (Responsive.isMobile(context)) ...[
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                        Padding(
                          padding: Responsive.isMobile(context)
                              ? const EdgeInsetsDirectional.symmetric(
                                  horizontal: 16)
                              : EdgeInsets.zero,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            elevation: Responsive.isMobile(context) ? 0 : 3,
                            child: SizedBox(
                              width: 400,
                              child: Form(
                                key: _formKey,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 32),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      AnimatedSwitcher(
                                        duration:
                                            const Duration(milliseconds: 100),
                                        child: !authController
                                                .isSendRecoverPassword.value
                                            ? Column(
                                                key: const ValueKey<int>(0),
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Recuperar senha",
                                                    style: GoogleFonts.roboto(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 22,
                                                      color: const Color(
                                                          0xFF09242E),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    "Você irá receber um e-mail com os próximos passos",
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.roboto(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: const Color(
                                                          0xFF35383B),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 40,
                                                  ),
                                                  DefaultTextField(
                                                    label: "E-mail",
                                                    title: "E-mail",
                                                    controller: emailController,
                                                    onChanged: (value) {
                                                      authController
                                                          .isDataModifiedRecoverPassword
                                                          .value = true;
                                                    },
                                                    validator: (String? email) {
                                                      if (email == null ||
                                                          email.isEmpty) {
                                                        return 'Digite seu email!';
                                                      }
                                                      if (!email.isEmail) {
                                                        return "Digite um email válido!";
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                  const SizedBox(
                                                    height: 32,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: DefaultButtom(
                                                      isLoading: authController
                                                          .isLoading.value,
                                                      text: "Confirmar e-mail",
                                                      activeButton: authController
                                                          .isDataModifiedRecoverPassword
                                                          .value,
                                                      onPressed: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        if (_formKey
                                                            .currentState!
                                                            .validate()) {
                                                          String email =
                                                              emailController
                                                                  .text;
                                                          authController
                                                              .resetPassword(
                                                                  email);
                                                        } else {}
                                                      },
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: DefaultButtom(
                                                      activeTextColor: true,
                                                      activeBorder: true,
                                                      textColor: const Color(
                                                          0xFF09242E),
                                                      buttomColor: const Color(
                                                          0xFFFFFFFF),
                                                      text: "Voltar",
                                                      activeButton: true,
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Column(
                                                key: const ValueKey<int>(1),
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  DefaultRecoverConfirmPassword(
                                                    onPressed: () {
                                                      authController
                                                          .isRecoverCancel();
                                                    },
                                                  ),
                                                ],
                                              ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            openWeb();
                          },
                          child: Text(
                            "Política de privacidade",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xFF787A7D),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Responsive.isMobile(context) ? 16 : 24,
                        ),
                      ],
                    ),
                  )
                ],
              ));
        }));
  }
}
