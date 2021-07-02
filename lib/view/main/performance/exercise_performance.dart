import 'package:education_mobile_app/controller/performance/performance_controller.dart';
import 'package:education_mobile_app/utils/app_constant.dart';
import 'package:education_mobile_app/utils/app_size.dart';
import 'package:education_mobile_app/view/widgets/app_bar/app_main_bar.dart';
import 'package:education_mobile_app/view/widgets/card/app_lesson_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExercisePerformance extends StatefulWidget {
  @override
  _ExercisePerformanceState createState() => _ExercisePerformanceState();

  final int index;
  ExercisePerformance({this.index});
}

class _ExercisePerformanceState extends State<ExercisePerformance> {
  PerformanceController performanceCont = Get.put(PerformanceController());

  @override
  void initState() {
    performanceCont.getExercisePerformance(widget.index);
    performanceCont.exercisePerformance.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppMainBar(
        title: '${AppConstant.exercise[widget.index]} Performance',
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppSize.spaceX2,
            ),
            Row(
              children: [
                Text(
                  'Overall ${AppConstant.exercise[widget.index].toLowerCase()}',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  ' performance.',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
            SizedBox(
              height: AppSize.spaceX2,
            ),
            Flexible(
              child: GestureDetector(
                child: Obx(
                  () => ListView.builder(
                    itemCount: performanceCont.exercisePerformance.length,
                    itemBuilder: (_, index) {
                      return AppLessonCard(
                        index: index,
                        isLessons: widget.index == 2 || widget.index == 0
                            ? false
                            : true,
                        title: performanceCont.exercisePerformance[index].title,
                        subtitle:
                            performanceCont.exercisePerformance[index].dateTime,
                        rate: performanceCont.exercisePerformance[index].score,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
