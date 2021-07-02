import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_mobile_app/controller/app_review_controller.dart';
import 'package:education_mobile_app/model/lessons.dart';
import 'package:education_mobile_app/utils/app_date.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LessonController extends GetxController {
  final lessonList = List<Lessons>().obs;
  final searchController = TextEditingController().obs;

  AppReviewController appReviewController = Get.put(AppReviewController());
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  onInit() {
    super.onInit();
  }

  getLessons() {
    lessonList.clear();
    firebaseFirestore.collection('lessons').get().then(
      (QuerySnapshot querySnapshot) {
        List<QueryDocumentSnapshot> snapshot = querySnapshot.docs;
        snapshot.forEach(
          (e) {
            Lessons lesson = Lessons(
              title: e['title'],
              link: e['link'],
              rate: e['rate'],
              id: e.id,
            );
            lessonList.add(lesson);
          },
        );
      },
    );
  }

  searchLessons(value) {
    lessonList.clear();
    firebaseFirestore
        .collection('lessons')
        .where('title', isGreaterThanOrEqualTo: value)
        .where('title', isLessThanOrEqualTo: value + '\uf8ff')
        .get()
        .then(
      (QuerySnapshot querySnapshot) {
        List<QueryDocumentSnapshot> snapshot = querySnapshot.docs;
        snapshot.forEach(
          (e) {
            Lessons lesson = Lessons(
              title: e['title'],
              link: e['link'],
              rate: e['rate'],
              id: e.id,
            );

            lessonList.add(lesson);
          },
        );
      },
    );
  }

  postLessonPerformance(title) {
    appReviewController.postQuizPerformance(
      0,
      title,
      AppDateTime.getDateTime(),
      0,
    );
  }
}
