import 'package:education_mobile_app/utils/app_size.dart';
import 'package:education_mobile_app/utils/theme/app_colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final Function onPressed;
  final String btnTitle;
  final bool isSuccess;

  AppDialog({
    this.title = 'Your email or password is invalid',
    this.onPressed,
    this.btnTitle = '',
    this.isSuccess = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 16.0, right: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          width: AppSize.widthScreen(context),
          height: 300.0,
          child: Column(
            children: [
              Container(
                height: 150.0,
                width: AppSize.widthScreen(context),
                decoration: BoxDecoration(
                  color: isSuccess ? AppColor.primaryColor : Color(0XFFEA4C4C),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6.0),
                  ),
                ),
                child: Icon(
                  isSuccess
                      ? EvaIcons.checkmarkCircle
                      : EvaIcons.alertTriangleOutline,
                  color: Colors.white,
                  size: AppSize.spaceX8,
                ),
              ),
              SizedBox(
                height: AppSize.spaceX1,
              ),
              Text(
                isSuccess ? 'Congratulations' : 'Uh oh!',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                height: AppSize.spaceX1,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(
                height: AppSize.spaceX2,
              ),
              FlatButton(
                color: isSuccess ? AppColor.primaryColor : Color(0XFFEA4C4C),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(6.0),
                ),
                onPressed: onPressed,
                child: Text(
                  btnTitle,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
