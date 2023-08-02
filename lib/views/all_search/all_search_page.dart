import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opinarti/helpers/colors.dart';
import 'package:opinarti/views/components/default_card.dart';

import '../components/default_button.dart';
import '../components/default_page.dart';

class AllSearchPage extends StatelessWidget {
  const AllSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      activeButtom: true,
      iconButtom: "assets/new_search.svg",
      title: 'Todas as pesquisas',
      actionTitle: "Nova pesquisa",
      onPressedButtom: () {},
      children: [
        Row(
          children: [
            Expanded(
              child: Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/pesquisas_ativas.svg"),
                          const SizedBox(width: 8),
                          const Text(
                            'Pesquisas Ativas',
                          ),
                        ],
                      ),
                      Text(
                        "00",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("../assets/all_search.svg"),
                          const SizedBox(width: 8),
                          const Text(
                            'Todas pesquisas',
                          ),
                        ],
                      ),
                      Text(
                        "00",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("../assets/pesquisa_mes.svg"),
                          const SizedBox(width: 8),
                          const Text(
                            'Pesquisas no mês',
                          ),
                        ],
                      ),
                      Text(
                        "00",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        DefaultCard(
          title: 'Pesquisas',
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  const SizedBox(width: 24),
                  const Expanded(flex: 2, child: Text('Título da pesquisa')),
                  const Expanded(child: Text('Data de publicação')),
                  const Expanded(child: Text('Data de conclusão')),
                  const Expanded(child: Text('Respostas')),
                  const Expanded(child: Text('Status')),
                ],
              ),
              SizedBox(
                height: 800,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Nenhuma pequisa cadastrada',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: const Color(0xFF45454F),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                        'Crie uma pesquisa e colete a opinião dos seus clientes.'),
                    const SizedBox(height: 24),
                    DefaultButtom(
                      activeIcon: true,
                      activeButton: true,
                      text: 'Nova pesquisa',
                      icon: '../assets/nova_pesquisa.svg',
                      onPressed: () {},
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
