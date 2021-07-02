import 'package:education_mobile_app/model/user.dart';
import 'package:education_mobile_app/repository/auth/auth_repository.dart';
import 'package:education_mobile_app/view/auth/login.dart';
import 'package:education_mobile_app/view/main/home.dart';
import 'package:education_mobile_app/view/widgets/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final user = User().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final isLoading = false.obs;

  AuthRepository authRepository = AuthRepository();

  login() async {
    isLoading(true);

    var data = await authRepository.login(
      emailController.value.text,
      passwordController.value.text,
    );

    if (data != null) {
      user.value.uid = data.uid;
      user.value.displayName = data.displayName;
      user.value.email = data.email;
      Get.offAll(() => Home());
    } else {
      Get.dialog(
        AppDialog(
          btnTitle: 'Close',
          onPressed: () => Get.back(),
        ),
      );
      isLoading(false);
    }
  }

  logout() async {
    await authRepository.logout();

    Get.to(() => Login());
  }
}
