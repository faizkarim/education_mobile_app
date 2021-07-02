import 'package:education_mobile_app/utils/app_size.dart';
import 'package:education_mobile_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppPerformanceCard extends StatelessWidget {
  final String title;
  final Color color;
  final String subtitle;
  final Function onTap;

  AppPerformanceCard({
    this.title,
    this.color,
    this.subtitle = '',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 5,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: AppSize.fontLargeX3,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: AppSize.space,
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: AppSize.fontMedium,
                fontWeight: FontWeight.normal,
                color: AppColor.backgroundColorW,
              ),
            )
          ],
        ),
      ),
    );
  }
}
