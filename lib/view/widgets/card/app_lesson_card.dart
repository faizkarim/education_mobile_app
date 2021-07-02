import 'dart:math';
import 'package:education_mobile_app/utils/app_size.dart';
import 'package:education_mobile_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AppLessonCard extends StatefulWidget {
  final int index;
  final String title;
  final String subtitle;
  final bool isLessons;
  final int rate;
  final Function onTap;

  AppLessonCard({
    this.index,
    this.isLessons = false,
    this.title = '',
    this.subtitle = '',
    this.rate = 0,
    this.onTap,
  });

  @override
  _AppLessonCardState createState() => _AppLessonCardState();
}

class _AppLessonCardState extends State<AppLessonCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 8.0),
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        height: 100.0,
        width: AppSize.widthScreen(context),
        decoration: BoxDecoration(
          color: AppColor.backgroundColorW,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      (widget.index + 1).toString(),
                      style: TextStyle(
                        color: AppColor.backgroundColorW,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: AppSize.spaceX1,
                ),
                Container(
                  width: (AppSize.widthScreen(context) - 135) * 0.70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      SizedBox(
                        height: AppSize.space,
                      ),
                      widget.subtitle != ''
                          ? Text(
                              widget.subtitle,
                              style: Theme.of(context).textTheme.headline4,
                            )
                          : Container()
                    ],
                  ),
                ),
              ],
            ),
            widget.isLessons
                ? CircularPercentIndicator(
                    radius: 60.0,
                    lineWidth: 6.0,
                    percent: widget.rate / 10,
                    center: Text(
                      widget.rate.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    progressColor: AppColor.primaryColor,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
