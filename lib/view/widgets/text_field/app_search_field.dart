import 'package:education_mobile_app/utils/app_size.dart';
import 'package:education_mobile_app/utils/theme/app_colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class AppSearchField extends StatefulWidget {
  @override
  _AppTextFieldState createState() => _AppTextFieldState();

  final String hintText;
  final TextEditingController textEditingController;
  final ValueChanged<String> onChange;
  final Function onEditingComplete;

  AppSearchField({
    this.hintText,
    this.textEditingController,
    this.onChange,
    this.onEditingComplete,
  });
}

class _AppTextFieldState extends State<AppSearchField> {
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
      onChanged: widget.onChange,
      onEditingComplete: widget.onEditingComplete,
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
        prefixIcon: Icon(
          EvaIcons.searchOutline,
          color: AppColor.hintTextColor,
        ),
      ),
    );
  }
}
