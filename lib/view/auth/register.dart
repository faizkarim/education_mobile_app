import 'package:flutter/material.dart';
import 'package:education_mobile_app/utils/app_validation.dart';
import 'package:education_mobile_app/controller/auth/register_controller.dart';
import 'package:education_mobile_app/view/auth/login.dart';
import 'package:education_mobile_app/utils/app_size.dart';
import 'package:education_mobile_app/view/widgets/app_bar/app_main_bar.dart';
import 'package:education_mobile_app/view/widgets/button/app_auth_button.dart';
import 'package:education_mobile_app/view/widgets/text_field/app_text_field.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RegisterController registerController = Get.put(RegisterController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AppValidation appValidation = AppValidation();

  @override
  void initState() {
    registerController.isLoading(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppMainBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: Obx(
              () => registerController.isLoading.value
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
                            'Create Account',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          SizedBox(
                            height: AppSize.spaceX1,
                          ),
                          Text(
                            'Create a new account',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          SizedBox(
                            height: AppSize.spaceX4,
                          ),
                          AppTextField(
                            textEditingController:
                                registerController.nameController.value,
                            hintText: 'Full Name',
                            validatorFunction: (value) {
                              if (value.isEmpty) {
                                return 'Full Name cannot be empty';
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
                                registerController.emailController.value,
                            hintText: 'Email',
                            validatorFunction: (value) {
                              if (value.isEmpty) {
                                return 'Email cannot be empty';
                              } else if (!value.isEmail) {
                                return 'Invalid email format';
                              }
                            },
                          ),
                          SizedBox(
                            height: AppSize.spaceX1,
                          ),
                          AppTextField(
                            textInputType: TextInputType.number,
                            textEditingController:
                                registerController.phoneController.value,
                            hintText: 'Phone Number',
                            validatorFunction: (value) {
                              if (value.isEmpty) {
                                return 'Phone Number cannot be empty';
                              } else {
                                return null;
                              }
                            },
                            onSaveFunction: (val) => registerController
                                .phoneController.value.text = val,
                          ),
                          SizedBox(
                            height: AppSize.spaceX1,
                          ),
                          AppTextField(
                            textEditingController:
                                registerController.passwordController.value,
                            hintText: 'Password',
                            isPassword: true,
                            validatorFunction: (value) {
                              if (value.isEmpty) {
                                return 'Password cannot be empty';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: AppSize.spaceX2,
                          ),
                          AppAuthButton(
                            title: 'Create Account',
                            onPressed: () async {
                              if (formKey.currentState.validate()) {
                                await registerController.register();
                              }
                            },
                          ),
                          SizedBox(
                            height: AppSize.spaceX5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account? ',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              GestureDetector(
                                onTap: () => Get.to(() => Login()),
                                child: Text(
                                  'Login here',
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
