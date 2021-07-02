import 'package:education_mobile_app/view/main/lessons/lesson.dart';
import 'package:education_mobile_app/view/main/performance/select_performance.dart';
import 'package:education_mobile_app/view/main/quiz/quiz.dart';
import 'package:education_mobile_app/view/main/tutorial/tutorial.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class AppConstant {
  static const List<Color> color = [
    Color(0XFF1063AE),
    Color(0XFFFFBA45),
    Color(0XFFFF9642),
    Color(0XFFEA4C4C),
  ];

  static const List<String> title = [
    'Lessons',
    'Quiz',
    'Tutorial',
    'Performance',
  ];
  static const List<String> subtitle = [
    'The fastest way to learn basic Control Structure',
    'Practice to improve your understanding',
    'Challenge yourself and test your knowledge',
    'Track your performance',
  ];

  static List<Widget> widget = [
    Lesson(),
    Quiz(),
    Tutorial(),
    SelectPerformance(),
  ];

  static const List<IconData> icons = [
    EvaIcons.sunOutline,
    EvaIcons.globe2Outline,
    EvaIcons.tvOutline,
    EvaIcons.dropletOutline,
  ];

  static const List<String> exercise = [
    'Lessons',
    'Quiz',
    'Tutorial',
  ];
}
