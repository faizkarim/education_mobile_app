import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_mobile_app/controller/performance/performance_controller.dart';
import 'package:education_mobile_app/model/question.dart';
import 'package:education_mobile_app/model/quizs.dart';
import 'package:education_mobile_app/view/widgets/app_dialog.dart';
import 'package:education_mobile_app/view/widgets/text_field/app_review.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  final exerciseList = List<Quizs>().obs;
  final currentAnswerList = [].obs;
  final currentQuestionIndex = 0.obs;
  final point = 0.obs;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  PerformanceController performanceCont = Get.put(PerformanceController());

  @override
  onInit() {
    getExercise('quiz');
    super.onInit();
  }

  getExercise(path) {
    exerciseList.clear();
    firebaseFirestore
        .collection(path)
        .orderBy('title')
        .snapshots()
        .listen((snap) {
      snap.docs.forEach((d) {
        List questions = d["questions"];
        List<Question> questionListing;
        questionListing = questions.map((v) => Question.fromJson(v)).toList();
        exerciseList.add(
          Quizs(
            id: d.id,
            questions: questionListing,
            title: d['title'],
          ),
        );
      });
    });
  }

  nextQuestion(totalQuestion, currentQuestion, selectedQuiz, exerciseType) {
    if (totalQuestion > (currentQuestion + 1)) {
      currentQuestionIndex.value++;
      update();
    } else {
      currentQuestionIndex(0);
      Get.dialog(
        AppDialog(
          isSuccess: true,
          title: '$point/$totalQuestion',
          btnTitle: 'Review Now',
          onPressed: () {
            Get.back();
            Get.off(
              () => AppReview(
                selectedQuiz: selectedQuiz,
                exerciseType: exerciseType,
              ),
            );
          },
        ),
      );
    }
  }

  checkAnswer(correctAnswer, currentAnswer) {
    currentAnswerList.add(currentAnswer);
    if (correctAnswer == currentAnswer) {
      point.value++;
      update();
    }
  }
}
