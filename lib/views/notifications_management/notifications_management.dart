import 'package:flutter/material.dart';
import 'package:opinarti/views/components/default_card.dart';
import 'package:opinarti/views/components/default_page.dart';
import 'package:opinarti/views/notifications_management/components/message_card.dart';

class NotificationsManagement extends StatelessWidget {
  const NotificationsManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      title: 'Notificações',
      children: [
        DefaultCard(
          title: "Todas",
          child: Column(
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const MessageCard(
                    title: 'Renove sua assinatura',
                    date: 'Hoje',
                    message:
                        'Sua assinatura está quase expirando. Renove agora para continuar aproveitando todos os benefícios.',
                  );
                },
              ),
              const MessageCard(
                title: 'Sua assinatura esta prestes a vencer',
                warning: true,
                message:
                    'Sua assinatura está quase expirando. Renove agora para continuar aproveitando todos os benefícios.',
              ),
              const MessageCard(
                title: 'Sua assinatura esta prestes a vencer',
                alert: true,
                message:
                    'Sua assinatura está quase expirando. Renove agora para continuar aproveitando todos os benefícios.',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
