import 'package:education_mobile_app/utils/theme/app_colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

class AppMainBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;
  final bool isTransparent;
  final double elevation;
  final Function onPressed;

  AppMainBar({
    this.title = '',
    this.isTransparent = false,
    this.elevation = 4.0,
    this.onPressed,
    Key key,
  })  : preferredSize = Size.fromHeight(55.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColor.primaryColor,
      ),
    );
    return isTransparent
        ? AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          )
        : AppBar(
            elevation: elevation,
            shadowColor: AppColor.primaryColor,
            backgroundColor: AppColor.primaryColor,
            title: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            leading: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: onPressed ?? () => Get.back(),
              child: Icon(
                EvaIcons.arrowBackOutline,
                color: AppColor.backgroundColorW,
              ),
            ),
          );
  }
}
