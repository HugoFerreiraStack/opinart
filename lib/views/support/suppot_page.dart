import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opinarti/controllers/support_controller.dart';
import 'package:opinarti/views/components/default_button.dart';
import 'package:opinarti/views/components/default_card.dart';
import 'package:opinarti/views/components/default_card_support.dart';
import 'package:opinarti/views/components/default_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../helpers/responsive.dart';
import '../components/default_text_field.dart';

class SuppotPage extends StatefulWidget {
  const SuppotPage({super.key});

  @override
  State<SuppotPage> createState() => _SuppotPageState();
}

class _SuppotPageState extends State<SuppotPage> {
  final supportController = Get.find<SuporteController>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final subjectController = TextEditingController();

    final bodyController = TextEditingController();

    void openWhatsApp() async {
      const String phone = "553199833280";
      const String message = "Olá, vim do Opinarti!";

      final String url = "https://wa.me/$phone?text=${Uri.parse(message)}";

      launchUrl(
          Uri.parse(
            url,
          ),
          mode: LaunchMode.externalApplication);
    }

    return DefaultPage(
      centerChild: true,
      title: 'Suporte',
      children: [
        DefaultCard(
          width: 900,
          title: 'Enviar mensagem',
          child: Form(
            key: _formKey,
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultTextField(
                    controller: subjectController,
                    label: "Assunto",
                    onChanged: (value) {
                      supportController.isBodyValid.value = true;
                    },
                    validator: (String? subject) {
                      if (subject == null || subject.isEmpty) {
                        return 'Digite um Assunto';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  DefaultTextField(
                    controller: bodyController,
                    label: 'Mensagem',
                    maxLines: 5,
                    onChanged: (value) {
                      supportController.isSubjectValid.value = true;
                    },
                    validator: (String? body) {
                      if (body == null || body.isEmpty) {
                        return 'Digite uma Mensagem';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  GetX<SuporteController>(builder: (supportController) {
                    return DefaultButtom(
                      activeButton: !supportController.isLoading.value &&
                          supportController.isBodyValid.value &&
                          supportController.isSubjectValid.value,
                      isLoading: supportController.isLoading.value,
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          final result = await supportController.sendSupport(
                            context: context,
                            subject: subjectController.text,
                            body: bodyController.text,
                            token: '',
                            userId: '',
                          );
                          if (result) {
                            supportController.isBodyValid.value = false;
                            supportController.isSubjectValid.value = false;
                          }
                        } else {}
                      },
                      text: "Enviar mensagem",
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
        DefaultCard(
          width: 900,
          title: 'Contato',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: const Color(0xffC0E0EF),
                  margin: EdgeInsets.zero,
                  elevation: 0,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 16,
                        right: !Responsive.isMobile(context) ? 48 : 16,
                        top: 16,
                        bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Assistência rápida e direto com nossos especialistas pelo Whatsapp",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        InkWell(
                          onTap: () {
                            openWhatsApp();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                                color: const Color(0xFF09242E),
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: SvgPicture.asset("assets/wpp.svg"),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "Contato pelo Whatsapp",
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: const Color(0xffF5F8FA),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Divider(
                thickness: 1,
                height: 0,
                color: Color(0xffD1D1D1),
              ),
              const SizedBox(
                height: 24,
              ),
              const DefaultCardSupport(
                iconPath: "assets/cell.svg",
                title: "Telefone",
                contact: "(31) 3243-3280 (31) 3363-4142",
              ),
              const SizedBox(
                height: 20,
              ),
              const DefaultCardSupport(
                iconPath: "assets/fabric.svg",
                title: "Endereço",
                contact: "R. Condor, 333A, Nova Cintra, Belo Horizonte - MG",
              ),
              const SizedBox(
                height: 20,
              ),
              const DefaultCardSupport(
                iconPath: "assets/email.svg",
                title: "E-mail",
                contact: "contato@locarti.com.br",
              ),
              const SizedBox(
                height: 20,
              ),
              const DefaultCardSupport(
                iconPath: "assets/clock.svg",
                title: "Horário de atendimento",
                contact: "Segunda à sexta-feira - 8h às 12h | 13h às 18h",
              ),
            ],
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 16,
            ),
            if (Responsive.isMobile(context)) ...[
              const SizedBox(
                height: 24,
              )
            ]
          ],
        ),
      ],
    );
  }
}
