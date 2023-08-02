import 'package:flutter/material.dart';
import 'package:opinarti/views/components/default_card.dart';
import 'package:opinarti/views/components/default_page.dart';

import '../../helpers/styles.dart';
import '../components/default_icon_question_card.dart';
import '../components/default_text_field.dart';

class NewSearchPage extends StatelessWidget {
  const NewSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      title: 'Nova pesquisa',
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                DefaultCard(
                  title: 'Perguntas',
                  width: 420,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Introdução',
                        style: cardQuestionTitleStyle,
                      ),
                      const SizedBox(height: 12),
                      const DefaultIconQuestionCard(
                        icon: '../assets/boas_vindas.svg',
                        title: 'Boas-Vindas',
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Questionário',
                        style: cardQuestionTitleStyle,
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        children: [
                          DefaultIconQuestionCard(
                            icon: '../assets/multipla_escolha.svg',
                            title: 'Multipla escolha',
                          ),
                          DefaultIconQuestionCard(
                            icon: '../assets/multipla_selecao.svg',
                            title: 'Multipla seleção',
                          ),
                          DefaultIconQuestionCard(
                            icon: '../assets/texto.svg',
                            title: 'Texto',
                          ),
                          DefaultIconQuestionCard(
                            icon: '../assets/nota.svg',
                            title: 'Nota',
                          ),
                          DefaultIconQuestionCard(
                            icon: '../assets/escala_numerica.svg',
                            title: 'Escala numérica',
                          ),
                          DefaultIconQuestionCard(
                            icon: '../assets/calendario.svg',
                            title: 'Data',
                          ),
                          DefaultIconQuestionCard(
                            icon: '../assets/NPS.svg',
                            title: 'NPS',
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Conclusão',
                        style: cardQuestionTitleStyle,
                      ),
                      const SizedBox(height: 12),
                      const DefaultIconQuestionCard(
                        icon: '../assets/agradecimentos.svg',
                        title: 'Agradecimentos',
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
                DefaultCard(
                  title: 'Publicação',
                  width: 420,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const DefaultTextField(title: 'Nome da pesquisa'),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Cor primária', style: formTitleLabelStyle),
                          Container(
                            width: 132,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xFFE7E8E9),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                    color: Color(0xFFF56200),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text('# F56200')
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Cor secundária', style: formTitleLabelStyle),
                          Container(
                            width: 132,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xFFE7E8E9),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                    color: Color(0xFF24277F),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text('# 24277F')
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => const Color(0xFFF7F7F8),
                            ),
                          ),
                          onPressed: null,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.visibility),
                              const SizedBox(width: 8),
                              Text(
                                'Visualizar pesquisa',
                                style: formTitleLabelStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          onPressed: null,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => const Color(0xFFF7F7F8),
                            ),
                          ),
                          child: Text(
                            'Publicar pesquisa',
                            style: formTitleLabelStyle,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => const Color(0xFFF7F7F8),
                            ),
                          ),
                          onPressed: null,
                          child: Text(
                            'Salvar como rascunho',
                            style: formTitleLabelStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Column(
              children: [
                DefaultCard(
                  title: 'Introdução',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultIconQuestionCard(
                        icon: '../assets/boas_vindas.svg',
                        onlyIcon: true,
                      ),
                    ],
                  ),
                ),
                DefaultCard(
                  title: 'Questionário',
                  child: Wrap(
                    children: [
                      DefaultIconQuestionCard(
                        icon: '../assets/multipla_escolha.svg',
                        onlyIcon: true,
                      ),
                      DefaultIconQuestionCard(
                        icon: '../assets/multipla_selecao.svg',
                        onlyIcon: true,
                      ),
                      DefaultIconQuestionCard(
                        icon: '../assets/texto.svg',
                        onlyIcon: true,
                      ),
                      DefaultIconQuestionCard(
                        icon: '../assets/nota.svg',
                        onlyIcon: true,
                      ),
                      DefaultIconQuestionCard(
                        icon: '../assets/escala_numerica.svg',
                        onlyIcon: true,
                      ),
                      DefaultIconQuestionCard(
                        icon: '../assets/calendario.svg',
                        onlyIcon: true,
                      ),
                      DefaultIconQuestionCard(
                        icon: '../assets/NPS.svg',
                        onlyIcon: true,
                      ),
                    ],
                  ),
                ),
                DefaultCard(
                  title: 'Introdução',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultIconQuestionCard(
                        icon: '../assets/agradecimentos.svg',
                        onlyIcon: true,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
