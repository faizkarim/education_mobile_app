import 'package:education_mobile_app/controller/app_review_controller.dart';
import 'package:education_mobile_app/controller/quiz_controller.dart';
import 'package:education_mobile_app/model/quizs.dart';
import 'package:education_mobile_app/utils/app_size.dart';
import 'package:education_mobile_app/utils/theme/app_colors.dart';
import 'package:education_mobile_app/view/main/quiz/quiz_question.dart';
import 'package:education_mobile_app/view/widgets/app_bar/app_main_bar.dart';
import 'package:education_mobile_app/view/widgets/button/app_navigate_button.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppReview extends StatefulWidget {
  @override
  _AppReviewState createState() => _AppReviewState();

  final Quizs selectedQuiz;
  final int exerciseType;

  AppReview({
    this.selectedQuiz,
    this.exerciseType,
  });
}

class _AppReviewState extends State<AppReview> {
  QuizController quizCont = Get.put(QuizController());
  AppReviewController appReviewCont = Get.put(AppReviewController());

  @override
  void initState() {
    appReviewCont.currentIndex(0);
    appReviewCont.checkAnswer(
      widget.selectedQuiz.questions[appReviewCont.currentIndex.value]
          .correctAnswer,
      quizCont.currentAnswerList[appReviewCont.currentIndex.value],
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppMainBar(
        title:
            'Score : ${quizCont.point}/${widget.selectedQuiz.questions.length}',
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Container(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            margin: MediaQuery.of(context).padding,
            child: Column(
              children: [
                SizedBox(
                  height: AppSize.spaceX2,
                ),
                widget.selectedQuiz.questions[appReviewCont.currentIndex.value]
                            .imagePath !=
                        null
                    ? Image.network(
                        widget
                            .selectedQuiz
                            .questions[appReviewCont.currentIndex.value]
                            .imagePath,
                      )
                    : Container(),
                Text(
                  widget.selectedQuiz
                      .questions[appReviewCont.currentIndex.value].question,
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: AppSize.spaceX2,
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Correct Answer',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: AppSize.spaceX1,
                      ),
                      Row(
                        children: [
                          Icon(
                            EvaIcons.checkmarkCircleOutline,
                            size: 32,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: AppSize.spaceX1,
                          ),
                          Flexible(
                            child: Text(
                              widget
                                  .selectedQuiz
                                  .questions[appReviewCont.currentIndex.value]
                                  .correctAnswer,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppSize.spaceX2,
                ),
                Container(
                  // height: AppSize.spaceX6,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: appReviewCont.isCorrect.value
                        ? AppColor.primaryColor
                        : AppColor.dangerColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Answer',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: AppSize.space,
                      ),
                      Row(
                        children: [
                          Icon(
                            appReviewCont.isCorrect.value
                                ? EvaIcons.checkmarkCircleOutline
                                : EvaIcons.closeCircleOutline,
                            size: 32,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: AppSize.spaceX1,
                          ),
                          Flexible(
                            child: Text(
                              quizCont.currentAnswerList[
                                  appReviewCont.currentIndex.value],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppSize.spaceX5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    appReviewCont.currentIndex.value != 0
                        ? AppNavigateButton(
                            onTap: () {
                              appReviewCont.previousQuestion();
                              appReviewCont.checkAnswer(
                                widget
                                    .selectedQuiz
                                    .questions[appReviewCont.currentIndex.value]
                                    .correctAnswer,
                                quizCont.currentAnswerList[
                                    appReviewCont.currentIndex.value],
                              );
                            },
                            btnTitle: 'Previous',
                            isPrevious: true,
                          )
                        : Container(),
                    widget.selectedQuiz.questions.length ==
                            appReviewCont.currentIndex.value + 1
                        ?
                        // ? GestureDetector(
                        //     onTap: () => Get.to(
                        //       () => QuizQuestion(
                        //         selectedQuiz: widget.selectedQuiz,
                        //         exerciseType: widget.exerciseType,
                        //       ),
                        //     ),
                        //     child: Container(
                        //       padding: EdgeInsets.all(8.0),
                        //       decoration: BoxDecoration(
                        //         color: AppColor.darkTextColor,
                        //         borderRadius: BorderRadius.circular(50.0),
                        //       ),
                        //       child: Icon(
                        //         Icons.replay,
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //   )
                        AppNavigateButton(
                            onTap: () => Get.to(
                              () => QuizQuestion(
                                selectedQuiz: widget.selectedQuiz,
                                exerciseType: widget.exerciseType,
                              ),
                            ),
                            btnTitle: 'Reattempt',
                            color: Colors.blueAccent,
                          )
                        : Container(),
                    AppNavigateButton(
                      onTap: () {
                        appReviewCont.nextQuestion(
                          widget.selectedQuiz.questions.length,
                        );
                        appReviewCont.checkAnswer(
                          widget
                              .selectedQuiz
                              .questions[appReviewCont.currentIndex.value]
                              .correctAnswer,
                          quizCont.currentAnswerList[
                              appReviewCont.currentIndex.value],
                        );
                      },
                      btnTitle: widget.selectedQuiz.questions.length ==
                              appReviewCont.currentIndex.value + 1
                          ? 'Done'
                          : 'Next',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
