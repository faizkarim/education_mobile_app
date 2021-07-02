import 'package:education_mobile_app/utils/theme/app_text_theme.dart';
import 'package:education_mobile_app/view/auth/login.dart';
import 'package:education_mobile_app/view/main/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GetStorage storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: AppTextTheme.textTheme,
      ),
      home: storage.read('uid') != null ? Home() : Login(),
    );
  }
}
