import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opinarti/controllers/auth_controller.dart';
import 'package:opinarti/helpers/responsive.dart';
import 'package:opinarti/helpers/validators.dart';
import 'package:opinarti/views/components/default_dialog.dart';

class SideMenuInfoUser extends StatefulWidget {
  const SideMenuInfoUser({super.key, this.expanded = true});
  final bool expanded;
  @override
  State<SideMenuInfoUser> createState() => _SideMenuInfoUserState();
}

class _SideMenuInfoUserState extends State<SideMenuInfoUser> {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    if (widget.expanded || !Responsive.isweb(context)) {
      return GetX<AuthController>(builder: (authController) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 8,
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: const Color(0xffC0E0EF),
                  child: Center(
                    child: Text(
                      authController.varName.value.substring(0, 1),
                      style: GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 16, color: const Color(0xff09242E)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${authController.varName.value} ${authController.varSurname.value}",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: const Color(0xff1A1A1A),
                        letterSpacing: 0.1,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      validateTerms(),
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: const Color(0xff787A7D),
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
                if (Responsive.isweb(context)) ...[
                  const Spacer(),
                  PopupMenuButton(
                    color: const Color(0xFFF5F8FA),
                    offset: const Offset(-10, 0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    padding: const EdgeInsets.all(0),
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: SvgPicture.asset(
                        "assets/more-2-line.svg",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    onSelected: (value) async {
                      if (value == 1) {
                        defaultDialog(
                            onPressedConfirm: () {
                              authController.signOut();
                            },
                            context: context,
                            title: 'Sair da conta',
                            message: "Quer mesmo sair da sua conta?");
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                        value: 1,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/sair.svg",
                              color: const Color(0xff09242E),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Sair da conta",
                              style: GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 14, color: const Color(0xff202020)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        );
      });
    } else {
      return GetX<AuthController>(builder: (authController) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xffCBE5F6),
            child: Center(
              child: Text(
                authController.varName.value.substring(0, 1),
                style: GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 16, color: const Color(0xff17468C)),
              ),
            ),
          ),
        );
      });
    }
  }
}
