import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opinarti/views/components/default_button.dart';

class EmptyUsersCard extends StatelessWidget {
  const EmptyUsersCard({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SizedBox(
        width: 500,
        height: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/not-users.svg", fit: BoxFit.scaleDown),
            const SizedBox(
              height: 24,
            ),
            Text(
              "Não há usuários cadastrados",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: const Color(0xFF09242E),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Adicione um novo usuário clicando no botão abaixo",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color(0xFF333333),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            DefaultButtom(
              onPressed: onPressed,
              activeButton: true,
              activeTextColor: true,
              textColor: const Color(0xFF359FD8),
              buttomColor: Colors.transparent,
              text: "Adicionar usuário",
              leftPadding: 12,
              rightlPadding: 12,
              topPadding: 10,
              bottomPadding: 10,
            )
          ],
        ),
      ),
    );
  }
}
