import 'package:education_mobile_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppNavigateButton extends StatelessWidget {
  final Function onTap;
  final bool isPrevious;
  final String btnTitle;
  final Color color;

  AppNavigateButton({
    this.onTap,
    this.isPrevious = false,
    this.btnTitle,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 100.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: isPrevious ? Colors.transparent : color ?? Color(0XFFFFBA45),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          btnTitle,
          style: TextStyle(
            color: isPrevious ? AppColor.dangerColor : Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
