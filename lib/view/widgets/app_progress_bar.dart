import 'package:flutter/material.dart';
import 'package:education_mobile_app/utils/app_size.dart';
import 'package:education_mobile_app/utils/theme/app_colors.dart';
import 'package:progress_indicator/progress_indicator.dart';
import 'package:shape_of_view/shape_of_view.dart';

class AppProgressBar extends StatelessWidget {
  final String question;
  final String currentQuestion;

  AppProgressBar({
    this.question = '1',
    this.currentQuestion = '1',
  });

  @override
  Widget build(BuildContext context) {
    return ShapeOfView(
      elevation: 0.0,
      height: 100,
      shape: ArcShape(
        height: 20,
        direction: ArcDirection.Outside,
        position: ArcPosition.Bottom,
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        width: AppSize.widthScreen(context),
        height: AppSize.spaceX7,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 10.0,
              color: AppColor.primaryColor.withGreen(100),
            ),
          ],
          color: AppColor.primaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${int.parse(currentQuestion) + 1}/$question',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: AppSize.fontLarge,
              ),
            ),
            SizedBox(
              height: AppSize.space,
            ),
            BarProgress(
              percentage: ((int.parse(currentQuestion) + 1) * 10.0),
              backColor: Colors.white,
              color: Color(0XFFEA4C4C),
              showPercentage: false,
              stroke: 12,
              round: true,
            ),
          ],
        ),
      ),
    );
  }
}
