import 'package:flutter/material.dart';
import 'package:opinarti/helpers/responsive.dart';
import 'package:opinarti/views/components/default_button.dart';
import 'package:opinarti/views/components/default_card.dart';
import 'package:opinarti/views/components/default_page.dart';

import '../components/default_text_field.dart';

class TotemAccessPage extends StatelessWidget {
  const TotemAccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      title: 'Acesso ao totem',
      children: [
        DefaultCard(
            title: 'Dados de acesso ao totem',
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4),
                      SizedBox(
                        child: DefaultTextField(
                          title: 'E-mail',
                          label: 'totem@maissabor.com.br',
                        ),
                      ),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  Expanded(child: Container())
                else
                  Container()
              ],
            )),
        const SizedBox(
          height: 24,
        ),
        DefaultCard(
          title: 'Mudar senha do totem',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      DefaultTextField(
                        title: 'Senha atual',
                        label: 'Emanoel Viana dos Santos',
                      ),
                      SizedBox(height: 32),
                      DefaultTextField(
                        title: 'Nova senha',
                        label: 'Digite uma senha',
                      ),
                      SizedBox(height: 32),
                      DefaultTextField(
                        title: 'Repetir senha',
                        label: 'Repetir senha',
                      ),
                      SizedBox(height: 32),
                    ],
                  )),
                  if (!Responsive.isMobile(context)) const Spacer()
                ],
              ),
              DefaultButtom(
                text: "Salvar nova senha",
                activeButton: false,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
