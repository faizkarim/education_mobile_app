import 'package:education_mobile_app/repository/auth/auth_repository.dart';
import 'package:education_mobile_app/view/auth/login.dart';
import 'package:education_mobile_app/view/widgets/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final nameController = TextEditingController().obs;
  final isLoading = false.obs;

  AuthRepository authRepository = AuthRepository();

  register() async {
    isLoading(true);
    var data = await authRepository.register(
      emailController.value.text,
      passwordController.value.text,
      nameController.value.text,
      phoneController.value.text,
    );

    if (data == null) {
      Get.dialog(
        AppDialog(
          title: 'Email already taken',
          onPressed: () => Get.back(),
          btnTitle: 'Close',
        ),
      );
      isLoading(false);
    } else {
      Get.dialog(
        AppDialog(
          title: 'Your registration is successfull',
          onPressed: () => Get.to(() => Login()),
          btnTitle: 'Login Now',
          isSuccess: true,
        ),
      );
      isLoading(false);
    }
  }
}
