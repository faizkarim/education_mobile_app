import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_mobile_app/view/main/home.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppReviewController extends GetxController {
  final currentIndex = 0.obs;
  final isCorrect = false.obs;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  GetStorage storage = GetStorage();

  nextQuestion(totalQuestion) {
    if (totalQuestion > currentIndex.value + 1) {
      currentIndex.value++;
    } else {
      Get.off(() => Home());
    }

    update();
  }

  previousQuestion() {
    currentIndex.value--;
    update();
  }

  checkAnswer(correctAnswer, currentAnswer) {
    if (correctAnswer == currentAnswer) {
      isCorrect(true);
    } else {
      isCorrect(false);
    }
    update();
  }

  postQuizPerformance(
    score,
    title,
    dateTime,
    type,
  ) {
    CollectionReference quizPerformance =
        firebaseFirestore.collection('performance');

    quizPerformance.add({
      'exercise_id': storage.read('exercise_id'),
      'user_id': storage.read('uid'),
      'score': score,
      'title': title,
      'date_time': dateTime,
      'exercise_type': type,
    });
  }
}
