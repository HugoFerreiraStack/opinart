import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opinarti/views/components/default_button.dart';

class DefaultRecoverConfirmPassword extends StatefulWidget {
  const DefaultRecoverConfirmPassword({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  State<DefaultRecoverConfirmPassword> createState() =>
      _DefaultRecoverConfirmPasswordState();
}

class _DefaultRecoverConfirmPasswordState
    extends State<DefaultRecoverConfirmPassword> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          "assets/mail-send-line.svg",
          color: const Color(0xff359FD8),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          "E-mail enviado!",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            fontSize: 22,
            color: const Color(0xFF35383B),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Acesse o e-mail que acabamos de enviar com os próximos passos para a restauração da sua senha",
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: const Color(0xFF35383B),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DefaultButtom(
              activeTextColor: true,
              textColor: const Color(0xFFF5F8FA),
              text: "Voltar ao login",
              activeButton: true,
              onPressed: widget.onPressed!),
        )
      ],
    );
  }
}
