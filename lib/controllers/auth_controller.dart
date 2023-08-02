// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opinarti/helpers/keys.dart';
import 'package:opinarti/helpers/page_routes.dart';
import 'package:opinarti/models/user/user_model.dart';
import 'package:opinarti/repository/auth/auth_manager.dart';
import 'package:opinarti/repository/auth/auth_result.dart';
import 'package:opinarti/services/local_save.dart';
import 'package:opinarti/views/components/default_snackbar.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoadingPassword = false.obs;
  var varName = "".obs;
  var varSurname = "".obs;
  var isDataModified = false.obs;
  var isPassWordModified = false.obs;
  var isDataModifiedRecoverPassword = false.obs;
  var isSendRecoverPassword = false.obs;
  var isFormValid = false.obs;
  var isEmailValid = false.obs;
  var isPasswordValid = false.obs;
  var isAuthenticated = false.obs;
  var isrememberMe = false.obs;

  RxBool isPasswordVisible = false.obs;
  RxBool loginErrorVisible = false.obs;
  RxBool focusTextField = false.obs;
  Rx<UserModel?> user = Rx(null);
  final authManager = AuthManager();
  final localsave = LocalSave();

  @override
  void onInit() {
    super.onInit();

    validateToken();
  }

  //visualizar senha
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  //fazer login
  Future<void> signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    isLoading.value = true;
    loginErrorVisible.value = false;
    AuthResult result =
        await authManager.signIn(email: email, password: password);
    update();

    isLoading.value = false;

    result.when(success: (user) {
      this.user.value = user;
      varName.value = user.name!;
      varSurname.value = user.lastName!;
      saveTokenUser();
      Get.offAllNamed(PagesRoutes.main);
    }, error: (message) {
      defaultSnackBar(context, message);
      loginErrorVisible.value = true;
      debugPrint(message);
    });
  }

  void saveTokenUser() {
    // Salvar o token
    if (isrememberMe.value) {
      localsave.saveLocalToken(Keys.tokenSave, user.value!.token!);
    } else {
      debugPrint("Token nao armazenado por opção");
    }

    update();
  }

  Future<void> validateToken() async {
    String? token = await localsave.getLocalToken(key: Keys.tokenSave);

    update();
    debugPrint(token);
    if (token == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.offAllNamed(PagesRoutes.login);
      });
      return;
    }

    AuthResult result = await authManager.validateToken(token);

    result.when(success: (user) {
      this.user.value = user;
      varName.value = user.name!;
      varSurname.value = user.lastName!;

      saveTokenUser();
      if (this.user.value != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.offAllNamed(PagesRoutes.main);
        });
      }
    }, error: (message) {
      if (token == null || message.contains("Token inválido")) {
        signOut();
      }
      debugPrint(
        message,
      );
    });
  }

  Future<void> resetPassword(
    String email,
  ) async {
    update();
    isLoading.value = true;
    await authManager.resetPassword(email);
    isLoading.value = false;

    isSendRecoverPassword.value = true;
  }

  Future<void> isRecoverCancel() async {
    update();
    Get.back();
    Future.delayed(const Duration(milliseconds: 500), () {
      isSendRecoverPassword.value = false;
    });
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required BuildContext context,
  }) async {
    update();
    isLoadingPassword.value = true;
    final result = await authManager.changePassword(
      email: user.value!.email!,
      currentPassword: currentPassword,
      newPassword: newPassword,
      token: user.value!.token!,
    );

    isLoadingPassword.value = false;

    if (result) {
      defaultSnackBar(
        context,
        "Senha alterada com sucesso",
      );
      signOut();
    } else {
      defaultSnackBar(
        context,
        "Erro identificado no Salvamento",
      );
    }
  }

  Future<bool> personalUpdate(
      {required String name,
      required String lastName,
      required String phone,
      required String token,
      required String userId,
      required BuildContext context}) async {
    update();
    isLoading.value = true;

    final result = await authManager.updateUser(
      token: user.value!.token!,
      name: name,
      lastName: lastName,
      phone: phone,
      userId: userId,
      admin: user.value!.admin!,
      owner: user.value!.owner!,
      manager: user.value!.manager!,
    );

    isLoading.value = false;

    if (result) {
      defaultSnackBar(
        context,
        "Seus dados foram salvos com sucesso",
      );
      return true;
    } else {
      defaultSnackBar(
        context,
        "Erro identificado no Salvamento",
      );
      return false;
    }
  }

  Future<void> signOut() async {
    // Zerar o user
    user.value = UserModel();
    update();
    // Remover o token localmente
    await localsave.removeLocalToken(key: Keys.tokenSave);
    // Ir para o login
    Get.offAllNamed(PagesRoutes.login);
  }
}
