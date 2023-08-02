import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opinarti/helpers/colors.dart';
import 'package:opinarti/views/components/default_card.dart';
import 'package:opinarti/views/components/default_page.dart';

class ConfigureTotem extends StatefulWidget {
  const ConfigureTotem({super.key});

  @override
  State<ConfigureTotem> createState() => _ConfigureTotemState();
}

class _ConfigureTotemState extends State<ConfigureTotem> {
  final TextEditingController timeController = TextEditingController();
  TimeMinutes? selectedMinutes;
  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<TimeMinutes>> minutesEntries =
        <DropdownMenuEntry<TimeMinutes>>[];
    for (final TimeMinutes minutes in TimeMinutes.values) {
      minutesEntries.add(DropdownMenuEntry<TimeMinutes>(
          value: minutes,
          label: minutes.label,
          enabled: minutes.label != '1 minuto'));
    }

    return DefaultPage(
      title: 'Configurar totem',
      children: [
        DefaultCard(
            title: 'Personalizar totem',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Personalize a experiência do totem aplicando a marca da sua empresa",
                  style: GoogleFonts.sourceSansPro(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: const Color(0xFF45454F),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFDEE0E3))),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
                    child: Column(
                      children: [
                        SvgPicture.asset("assets/upload.svg"),
                        const SizedBox(
                          height: 8,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'Arraste uma imagem até aqui ou ',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: const Color(0xFF45454F),
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'pesquise no seu computador',
                                    style: GoogleFonts.roboto(
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: const Color(0xFF45454F),
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // navigate to desired screen
                                      })
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
        DefaultCard(
            title: 'Modo quiosque',
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Exibir um slider de imagens caso o sistema não identifique nenhuma ação do usuário",
                    style: GoogleFonts.sourceSansPro(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: const Color(0xFF45454F),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Switch(
                    activeTrackColor: primaryColor,
                    activeColor: Colors.white,
                    value: true,
                    onChanged: (a) {})
              ],
            )),
        DefaultCard(
          title: 'Personalizar totem',
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Caso o usuário inicie uma pesquisa e não complete dentro do tempo estipulado a pesquisa será reiniciada",
                  style: GoogleFonts.sourceSansPro(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: const Color(0xFF45454F),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                DropdownMenu<TimeMinutes>(
                  initialSelection: TimeMinutes.one,
                  controller: timeController,
                  dropdownMenuEntries: minutesEntries,
                  onSelected: (TimeMinutes? time) {
                    setState(() {
                      selectedMinutes = time;
                      if (kDebugMode) {
                        print(selectedMinutes!.time);
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

enum TimeMinutes {
  one(
    "1 minuto",
    1,
  ),
  two(
    "2 minutos",
    2,
  ),
  three(
    "3 minutos",
    3,
  ),
  five(
    "5 minutos",
    5,
  ),
  ten(
    "10 minutos",
    10,
  );

  const TimeMinutes(this.label, this.time);
  final String label;
  final int time;
}
