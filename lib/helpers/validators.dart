import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:opinarti/controllers/auth_controller.dart';
import 'package:opinarti/helpers/responsive.dart';

String validateTerms() {
  final authController = Get.find<AuthController>();
  if (authController.user.value!.admin!) {
    return "Administrador";
  } else if (authController.user.value!.manager!) {
    return "Gerente";
  } else if (authController.user.value!.owner!) {
    return "Locarti";
  }
  return "Não identificado";
}

double validateWidth(BuildContext context,
    {required double widthWeb,
    required double widthTablet,
    required double widthMobile}) {
  if (Responsive.isTablet(context)) {
    return widthTablet;
  } else if (Responsive.isweb(context)) {
    return widthWeb;
  } else {
    return widthMobile;
  }
}
