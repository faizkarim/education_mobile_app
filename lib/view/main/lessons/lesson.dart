import 'dart:async';

import 'package:education_mobile_app/controller/lessons_controller.dart';
import 'package:education_mobile_app/view/main/lessons/lessons_topic.dart';
import 'package:flutter/material.dart';
import 'package:education_mobile_app/view/widgets/card/app_lesson_card.dart';
import 'package:education_mobile_app/utils/app_size.dart';
import 'package:education_mobile_app/view/widgets/app_bar/app_main_bar.dart';
import 'package:education_mobile_app/view/widgets/text_field/app_search_field.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Lesson extends StatefulWidget {
  @override
  _LessonState createState() => _LessonState();
}

class _LessonState extends State<Lesson> {
  LessonController lessonController = Get.put(LessonController());
  Timer searchOnStoppedTyping;
  GetStorage storage = GetStorage();

  @override
  void initState() {
    lessonController.getLessons();
    super.initState();
  }

  _onChangeHandler(value) {
    const duration = Duration(
      milliseconds: 400,
    );
    if (searchOnStoppedTyping != null) {
      setState(() => searchOnStoppedTyping.cancel());
    }
    setState(
      () => searchOnStoppedTyping = new Timer(
        duration,
        () => lessonController.searchLessons(value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppMainBar(
        title: 'Lessons',
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppSize.spaceX2,
            ),
            Row(
              children: [
                Text(
                  'Choose your ',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  'lessons.',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
            SizedBox(
              height: AppSize.spaceX2,
            ),
            Obx(
              () => AppSearchField(
                textEditingController: lessonController.searchController.value,
                hintText: 'Search',
                onChange: (value) => _onChangeHandler(value),
                // onEditingComplete: () => lessonController
                //     .searchLessons(lessonController.searchController.value),
              ),
            ),
            SizedBox(
              height: AppSize.spaceX2,
            ),
            Flexible(
              child: Obx(
                () => ListView.builder(
                  itemCount: lessonController.lessonList.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        storage.write('exercise_id',
                            lessonController.lessonList[index].id);

                        lessonController.postLessonPerformance(
                          lessonController.lessonList[index].title,
                        );
                        Get.to(
                          () => LessonTopic(
                            link: lessonController.lessonList[index].link,
                          ),
                        );
                      },
                      child: AppLessonCard(
                        index: index,
                        isLessons: true,
                        title:
                            lessonController.lessonList[index].title.capitalize,
                        rate: lessonController.lessonList[index].rate,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
