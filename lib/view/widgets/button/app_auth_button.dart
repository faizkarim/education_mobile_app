import 'package:education_mobile_app/utils/app_size.dart';
import 'package:education_mobile_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppAuthButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  AppAuthButton({
    this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSize.spaceX6,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: AppColor.backgroundColorW,
            fontSize: AppSize.fontLarge,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
