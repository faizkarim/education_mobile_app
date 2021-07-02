import 'package:flutter/material.dart';
import 'package:education_mobile_app/controller/quiz_controller.dart';
import 'package:education_mobile_app/view/main/quiz/quiz_question.dart';
import 'package:education_mobile_app/view/widgets/card/app_lesson_card.dart';
import 'package:education_mobile_app/utils/app_size.dart';
import 'package:education_mobile_app/view/widgets/app_bar/app_main_bar.dart';
import 'package:get/get.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  QuizController quizCont = Get.put(QuizController());

  @override
  void initState() {
    super.initState();
    // quizCont.getExercise('quiz');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppMainBar(
        title: 'Quiz',
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
                  'Test your ',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  'brain.',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
            SizedBox(
              height: AppSize.spaceX2,
            ),
            Flexible(
              child: Obx(
                () => quizCont.exerciseList.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: quizCont.exerciseList.length,
                        itemBuilder: (_, index) {
                          return AppLessonCard(
                            index: index,
                            onTap: () {
                              quizCont.currentQuestionIndex(0);
                              quizCont.currentAnswerList.clear();
                              Get.to(
                                () => QuizQuestion(
                                  selectedQuiz: quizCont.exerciseList[index],
                                  exerciseType: 1,
                                ),
                              );
                            },
                            title: quizCont.exerciseList[index].title,
                          );
                        },
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
