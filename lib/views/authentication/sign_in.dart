import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opinarti/controllers/auth_controller.dart';
import 'package:opinarti/helpers/colors.dart';
import 'package:opinarti/helpers/page_routes.dart';
import 'package:opinarti/helpers/responsive.dart';
import 'package:opinarti/views/components/default_button.dart';
import 'package:opinarti/views/components/default_checkbox.dart';
import 'package:opinarti/views/components/default_header.dart';
import 'package:opinarti/views/components/default_text_field.dart';
import 'package:url_launcher/url_launcher.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void openWeb() async {
    const String url = "https://locarti.com.br/politica-de-privacidade/";

    launchUrl(
        Uri.parse(
          url,
        ),
        mode: LaunchMode.externalApplication);
  }

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
          return AutofillGroup(
            child: Container(
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
                            )
                          ],
                          Column(
                            children: [
                              Padding(
                                padding: Responsive.isMobile(context)
                                    ? const EdgeInsetsDirectional.symmetric(
                                        horizontal: 16)
                                    : EdgeInsets.zero,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  elevation:
                                      Responsive.isMobile(context) ? 1 : 3,
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
                                            Text(
                                              "Acesse sua conta",
                                              style: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 22,
                                                  color:
                                                      const Color(0xff09242E)),
                                            ),
                                            const SizedBox(
                                              height: 40,
                                            ),
                                            DefaultTextField(
                                              label: "E-mail",
                                              autofillHints: const [
                                                AutofillHints.username
                                              ],
                                              onTap: () {
                                                authController.loginErrorVisible
                                                    .value = false;
                                              },
                                              onChanged: (value) {
                                                authController.isDataModified
                                                    .value = true;
                                                authController
                                                        .isEmailValid.value =
                                                    emailController
                                                        .text.isNotEmpty;
                                                authController.isFormValid
                                                    .value = authController
                                                        .isEmailValid.value &&
                                                    authController
                                                        .isPasswordValid.value;
                                              },
                                              showError: authController
                                                  .loginErrorVisible.value,
                                              isLoading: authController
                                                  .isLoading.value,
                                              title: "E-mail",
                                              controller: emailController,
                                              validator: (String? email) {
                                                if (email == null ||
                                                    email.isEmpty) {
                                                  return 'Digite seu email!';
                                                }
                                                if (!email.isEmail) {
                                                  return "Digite um email válido!";
                                                }
                                                authController
                                                        .isFormValid.value =
                                                    passwordController
                                                        .text.isNotEmpty;
                                                return null;
                                              },
                                            ),
                                            const SizedBox(
                                              height: 24,
                                            ),
                                            DefaultTextField(
                                              title: "Senha",
                                              label: "Senha",
                                              autofillHints: const [
                                                AutofillHints.password
                                              ],
                                              controller: passwordController,
                                              isLoading: authController
                                                  .isLoading.value,
                                              onTap: () {
                                                authController.loginErrorVisible
                                                    .value = false;
                                              },
                                              onChanged: (value) {
                                                authController.isDataModified
                                                    .value = true;
                                                authController
                                                        .isPasswordValid.value =
                                                    passwordController
                                                        .text.isNotEmpty;
                                                authController.isFormValid
                                                    .value = authController
                                                        .isEmailValid.value &&
                                                    authController
                                                        .isPasswordValid.value;
                                              },
                                              showError: authController
                                                  .loginErrorVisible.value,
                                              obscureText: !authController
                                                  .isPasswordVisible.value,
                                              suffixIcon: GestureDetector(
                                                  onTap: () {
                                                    authController
                                                        .togglePasswordVisibility();
                                                  },
                                                  child: SvgPicture.asset(
                                                    authController
                                                            .isPasswordVisible
                                                            .value
                                                        ? "assets/eye-line.svg"
                                                        : "assets/eye-close-line.svg",
                                                    color: authController
                                                            .isLoading.value
                                                        ? Color(0xff666666)
                                                        : Color(0xff09242E),
                                                    fit: BoxFit.scaleDown,
                                                  )),
                                              validator: (String? password) {
                                                if (password == null ||
                                                    password.isEmpty) {
                                                  return 'Digite sua senha!';
                                                }
                                                if (password.length < 8) {
                                                  return "Digite uma senha com pelo menos 8 caracteres.";
                                                }
                                                authController
                                                        .isFormValid.value =
                                                    passwordController
                                                        .text.isNotEmpty;
                                                return null;
                                              },
                                            ),
                                            const SizedBox(
                                              height: 36,
                                            ),
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    if (Responsive.isMobile(
                                                        context)) ...[
                                                      const SizedBox(
                                                        width: 8,
                                                      )
                                                    ],
                                                    DefaultCheckBox(
                                                      onChanged: (value) {
                                                        authController
                                                            .isrememberMe
                                                            .value = value;
                                                      },
                                                      color: const Color(
                                                          0xFF09242E),
                                                    ),
                                                    const SizedBox(
                                                      width: 8,
                                                    ),
                                                    Text(
                                                      "Lembrar-me",
                                                      style: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        color: const Color(
                                                            0xFF09242E),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.toNamed(PagesRoutes
                                                        .recoverPassword);
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                  },
                                                  child: Text(
                                                    "Esqueci a senha",
                                                    style: GoogleFonts.roboto(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color: const Color(
                                                          0xFF09242E),
                                                    ),
                                                  ),
                                                ),
                                                if (Responsive.isMobile(
                                                    context)) ...[
                                                  const SizedBox(
                                                    width: 8,
                                                  )
                                                ],
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 36,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: DefaultButtom(
                                                textColor:
                                                    const Color(0xffF5F8FA),
                                                isLoading: authController
                                                    .isLoading.value,
                                                text: "Entrar",
                                                activeButton: authController
                                                        .isEmailValid.value &&
                                                    authController
                                                        .isPasswordValid.value,
                                                onPressed: () {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  if (_formKey.currentState!
                                                      .validate()) {
                                                    TextInput
                                                        .finishAutofillContext();
                                                    String email =
                                                        emailController.text;
                                                    String password =
                                                        passwordController.text;
                                                    authController.signIn(
                                                      context: context,
                                                      email: email,
                                                      password: password,
                                                    );
                                                  } else {}
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
                                color: const Color(0xFF666666),
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
                )),
          );
        }));
  }
}
