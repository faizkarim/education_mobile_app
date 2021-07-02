import 'package:flutter/material.dart';
import 'package:education_mobile_app/utils/app_validation.dart';
import 'package:education_mobile_app/controller/auth/login_controller.dart';
import 'package:education_mobile_app/utils/app_size.dart';
import 'package:education_mobile_app/view/auth/register.dart';
import 'package:education_mobile_app/view/widgets/app_bar/app_main_bar.dart';
import 'package:education_mobile_app/view/widgets/button/app_auth_button.dart';
import 'package:education_mobile_app/view/widgets/text_field/app_text_field.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginController loginController = Get.put(LoginController());
  final formKey = GlobalKey<FormState>();
  AppValidation appValidation = AppValidation();

  @override
  void initState() {
    loginController.isLoading(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppMainBar(
        isTransparent: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: Obx(
              () => loginController.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome Back',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          SizedBox(
                            height: AppSize.spaceX1,
                          ),
                          Text(
                            'Sign in to continue',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          SizedBox(
                            height: AppSize.spaceX4,
                          ),
                          AppTextField(
                            textEditingController:
                                loginController.emailController.value,
                            hintText: 'Email',
                            validatorFunction: (value) {
                              if (value.isEmpty) {
                                return 'Email cannot be empty';
                              } else if (!value.isEmail) {
                                return 'Invalid email format';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: AppSize.spaceX1,
                          ),
                          AppTextField(
                            textEditingController:
                                loginController.passwordController.value,
                            hintText: 'Password',
                            isPassword: true,
                            validatorFunction: (value) {
                              if (value.isEmpty) {
                                return 'Password cannot be empty';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: AppSize.spaceX2,
                          ),
                          AppAuthButton(
                            onPressed: () async {
                              if (formKey.currentState.validate()) {
                                await loginController.login();
                              }
                            },
                            title: 'Login',
                          ),
                          SizedBox(
                            height: AppSize.spaceX5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don`t have an  account? ',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              GestureDetector(
                                onTap: () => Get.to(() => Register()),
                                child: Text(
                                  'Create new account',
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
