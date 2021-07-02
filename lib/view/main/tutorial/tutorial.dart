import 'package:education_mobile_app/controller/tutorial_controller.dart';
import 'package:flutter/material.dart';
import 'package:education_mobile_app/view/main/lessons/lessons_topic.dart';
import 'package:education_mobile_app/view/main/quiz/quiz_question.dart';
import 'package:education_mobile_app/view/widgets/card/app_lesson_card.dart';
import 'package:education_mobile_app/utils/app_size.dart';
import 'package:education_mobile_app/view/widgets/app_bar/app_main_bar.dart';
import 'package:get/get.dart';

class Tutorial extends StatefulWidget {
  @override
  _TutorialState createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  TutorialController tutorialCont = Get.put(TutorialController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppMainBar(
        title: 'Tutorial',
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
                  'Think and ',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  'learn.',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
            SizedBox(
              height: AppSize.spaceX2,
            ),
            Flexible(
              child: GestureDetector(
                onTap: () => Get.to(() => LessonTopic()),
                child: Obx(
                  () => tutorialCont.exerciseList.isEmpty
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: tutorialCont.exerciseList.length,
                          itemBuilder: (_, index) {
                            return AppLessonCard(
                              onTap: () => Get.to(
                                () => QuizQuestion(
                                  selectedQuiz:
                                      tutorialCont.exerciseList[index],
                                  exerciseType: 2,
                                ),
                              ),
                              index: index,
                              title: tutorialCont.exerciseList[index].title,
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
