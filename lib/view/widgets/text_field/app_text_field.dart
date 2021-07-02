import 'package:education_mobile_app/utils/app_size.dart';
import 'package:education_mobile_app/utils/theme/app_colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  @override
  _AppTextFieldState createState() => _AppTextFieldState();

  final String hintText;
  final TextEditingController textEditingController;
  final bool isPassword;
  final ValueChanged<String> onSubmitted;
  final ValueChanged<String> validatorFunction;
  final ValueChanged<String> onSaveFunction;
  final TextInputType textInputType;

  AppTextField({
    this.hintText,
    this.textEditingController,
    this.isPassword = false,
    this.onSubmitted,
    this.validatorFunction,
    this.onSaveFunction,
    this.textInputType,
  });
}

class _AppTextFieldState extends State<AppTextField> {
  bool show = true;

  final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      const Radius.circular(5.0),
    ),
    borderSide: BorderSide.none,
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      obscureText: widget.isPassword ? show : false,
      validator: this.widget.validatorFunction,
      onSaved: widget.onSaveFunction,
      onFieldSubmitted: widget.onSubmitted,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.all(AppSize.spaceX2),
        border: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        focusedErrorBorder: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        errorBorder: outlineInputBorder,
        disabledBorder: outlineInputBorder,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: AppColor.hintTextColor,
        ),
        suffixIcon: widget.isPassword
            ? GestureDetector(
                child: Icon(
                  this.show ? EvaIcons.eyeOutline : EvaIcons.eyeOffOutline,
                  color: AppColor.hintTextColor,
                ),
                onTap: () {
                  setState(() {
                    this.show = !this.show;
                  });
                },
              )
            : null,
      ),
    );
  }
}
