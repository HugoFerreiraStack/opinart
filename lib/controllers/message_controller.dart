// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../repository/support/support_manager.dart';
import '../views/components/default_snackbar.dart';

class MessageController extends GetxController {
  RxBool isLoading = false.obs;
  var isBodyValid = false.obs;
  var isSubjectValid = false.obs;
  final supportManager = SupportManager();

  Future<bool> sendSupport(
      {required String body, required String subject, required String userId, required String token, required BuildContext context}) async {
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
