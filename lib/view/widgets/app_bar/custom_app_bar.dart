import 'package:education_mobile_app/utils/theme/app_colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final Function onTap;

  CustomAppBar({
    Key key,
    this.onTap,
  })  : preferredSize = Size.fromHeight(45.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColor.primaryColor,
      ),
    );
    return AppBar(
      actions: [
        onTap != null
            ? InkWell(
                onTap: onTap,
                child: Container(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Icon(
                    EvaIcons.logOutOutline,
                  ),
                ),
              )
            : Container(),
      ],
      shadowColor: AppColor.primaryColor,
      backgroundColor: AppColor.primaryColor,
      brightness: Brightness.dark,
      elevation: 0,
      leading: Container(),
    );
  }
}
