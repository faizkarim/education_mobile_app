import 'package:education_mobile_app/controller/app_review_controller.dart';
import 'package:education_mobile_app/utils/app_date.dart';
import 'package:education_mobile_app/view/main/home.dart';
import 'package:flutter/material.dart';
import 'package:education_mobile_app/model/quizs.dart';
import 'package:education_mobile_app/controller/quiz_controller.dart';
import 'package:education_mobile_app/view/widgets/app_progress_bar.dart';
import 'package:education_mobile_app/view/widgets/card/app_answer_card.dart';
import 'package:education_mobile_app/utils/app_constant.dart';
import 'package:education_mobile_app/utils/app_size.dart';
import 'package:education_mobile_app/view/widgets/app_bar/app_main_bar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class QuizQuestion extends StatefulWidget {
  @override
  _QuizQuestion createState() => _QuizQuestion();

  final Quizs selectedQuiz;
  final int exerciseType;

  QuizQuestion({
    this.selectedQuiz,
    this.exerciseType,
  });
}

class _QuizQuestion extends State<QuizQuestion> {
  QuizController quizCont = Get.put(QuizController());
  AppReviewController appReviewCont = Get.put(AppReviewController());
  GetStorage storage = GetStorage();

  @override
  void initState() {
    quizCont.currentQuestionIndex(0);
    quizCont.point(0);
    storage.write('exercise_id', widget.selectedQuiz.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppMainBar(
        title: widget.selectedQuiz.title,
        elevation: 0.0,
        onPressed: () => Get.to(() => Home()),
      ),
      body: Container(
        padding: EdgeInsets.only(
          bottom: 16,
        ),
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppProgressBar(
                question: widget.selectedQuiz.questions.length.toString(),
                currentQuestion: quizCont.currentQuestionIndex.value.toString(),
              ),
              widget.selectedQuiz.questions[quizCont.currentQuestionIndex.value]
                          .imagePath !=
                      null
                  ? SizedBox(
                      height: AppSize.spaceX1,
                    )
                  : Container(),
              Expanded(
                child: ListView(
                  children: [
                    widget
                                .selectedQuiz
                                .questions[quizCont.currentQuestionIndex.value]
                                .imagePath !=
                            null
                        ? Image.network(widget
                            .selectedQuiz
                            .questions[quizCont.currentQuestionIndex.value]
                            .imagePath)
                        : Container(),
                    SizedBox(
                      height: AppSize.spaceX2,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Text(
                        widget
                            .selectedQuiz
                            .questions[quizCont.currentQuestionIndex.value]
                            .question,
                        style: Theme.of(context).textTheme.headline1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text('data'),
                    Text('data2'),
                    SizedBox(
                      height: AppSize.spaceX4,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget
                          .selectedQuiz
                          .questions[quizCont.currentQuestionIndex.value]
                          .answer
                          .length,
                      itemBuilder: (_, i) {
                        return GestureDetector(
                          onTap: () {
                            quizCont.checkAnswer(
                              widget
                                  .selectedQuiz
                                  .questions[
                                      quizCont.currentQuestionIndex.value]
                                  .correctAnswer,
                              widget
                                  .selectedQuiz
                                  .questions[
                                      quizCont.currentQuestionIndex.value]
                                  .answer[i],
                            );

                            quizCont.nextQuestion(
                              widget.selectedQuiz.questions.length,
                              quizCont.currentQuestionIndex.value,
                              widget.selectedQuiz,
                              widget.exerciseType,
                            );
                            if (widget.selectedQuiz.questions.length ==
                                quizCont.currentQuestionIndex.value + 1)
                              appReviewCont.postQuizPerformance(
                                quizCont.point.value,
                                widget.selectedQuiz.title,
                                AppDateTime.getDateTime(),
                                widget.exerciseType,
                              );
                          },
                          child: AppAnswerCard(
                            icon: AppConstant.icons[i],
                            color: AppConstant.color[i],
                            title: widget
                                .selectedQuiz
                                .questions[quizCont.currentQuestionIndex.value]
                                .answer[i],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
