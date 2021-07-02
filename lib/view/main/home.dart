import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_mobile_app/controller/auth/login_controller.dart';
import 'package:education_mobile_app/view/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:education_mobile_app/utils/app_constant.dart';
import 'package:education_mobile_app/utils/app_size.dart';
import 'package:education_mobile_app/utils/theme/app_colors.dart';
import 'package:education_mobile_app/view/widgets/card/app_performance_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shape_of_view/shape_of_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTap: () => loginController.logout(),
      ),
      body: Column(
        children: [
          ShapeOfView(
            shape: ArcShape(
              height: 20,
              direction: ArcDirection.Outside,
              position: ArcPosition.Bottom,
            ),
            child: Container(
              // margin: MediaQuery.of(context).padding,
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              width: AppSize.widthScreen(context),
              height: 150.0,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 10,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppSize.spaceX3,
                  ),
                  Text(
                    'Learn online',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    'from your home.',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: AppSize.spaceX3,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: StaggeredGridView.countBuilder(
                shrinkWrap: true,
                crossAxisCount: 4,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return AppPerformanceCard(
                    title: AppConstant.title[index],
                    color: AppConstant.color[index],
                    subtitle: AppConstant.subtitle[index],
                    onTap: () => Get.to(() => AppConstant.widget[index]),
                  );
                },
                staggeredTileBuilder: (int index) =>
                    StaggeredTile.count(2, index.isEven ? 2 : 2.5),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
