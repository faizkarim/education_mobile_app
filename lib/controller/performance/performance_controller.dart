import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_mobile_app/model/performance_modal.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class PerformanceController extends GetxController {
  GetStorage storage = GetStorage();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final exercisePerformance = List<PerformanceModel>().obs;

  getExercisePerformance(exerciseType) {
    exercisePerformance.clear();
    firebaseFirestore
        .collection('performance')
        .where('exercise_type', isEqualTo: exerciseType)
        .where('user_id', isEqualTo: storage.read('uid'))
        .snapshots()
        .listen(
      (snap) {
        snap.docs.forEach((d) {
          exercisePerformance.add(
            PerformanceModel(
              title: d['title'],
              score: d['score'],
              dateTime: d['date_time'],
            ),
          );
        });
      },
    );
  }
}
