import 'package:education_mobile_app/utils/app_size.dart';
import 'package:education_mobile_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final String title;
  final String subtitleText;
  final Color color;
  final Function onPress;

  AppCard({
    this.title,
    this.subtitleText,
    this.color,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
        ),
        padding: EdgeInsets.all(16.0),
        width: AppSize.widthScreen(context),
        height: 150.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 0,
              blurRadius: 5,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColor.darkTextColor,
                    fontSize: AppSize.fontLargeX3,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: AppSize.space,
                ),
                Text(
                  subtitleText,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                // SvgPicture(pictureProvider)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
