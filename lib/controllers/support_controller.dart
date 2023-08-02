// ignore_for_file: use_build_context_synchronously

import 'package:flutter/widgets.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:opinarti/repository/support/support_manager.dart';
import 'package:opinarti/views/components/default_snackbar.dart';

class SuporteController extends GetxController {
  final supportManager = SupportManager();
  RxBool isLoading = false.obs;
  var isBodyValid = false.obs;
  var isSubjectValid = false.obs;

  Future<bool> sendSupport(
      {required String body,
      required String subject,
      required String userId,
      required String token,
      required BuildContext context}) async {
    update();
    isLoading.value = true;

    final result = await supportManager.sendSupport(
      token: token,
      userId: userId,
      body: body,
      subject: subject,
    );
    isLoading.value = false;
    if (result) {
      defaultSnackBar(
        context,
        "Mensagem enviada",
      );
      return true;
    } else {
      defaultSnackBar(
        context,
        "Erro ao enviar mensagem",
      );
      return false;
    }
  }
}
