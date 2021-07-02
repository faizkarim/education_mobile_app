import 'package:flutter/material.dart';
import 'package:education_mobile_app/utils/app_constant.dart';
import 'package:education_mobile_app/utils/app_size.dart';
import 'package:education_mobile_app/view/main/performance/exercise_performance.dart';
import 'package:education_mobile_app/view/widgets/card/app_performance_card.dart';
import 'package:education_mobile_app/view/widgets/app_bar/app_main_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/route_manager.dart';

class SelectPerformance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppMainBar(
        title: 'Performance',
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppSize.spaceX2,
            ),
            Row(
              children: [
                Text(
                  'Select your ',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  'performance.',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
            SizedBox(
              height: AppSize.spaceX5,
            ),
            Expanded(
              child: StaggeredGridView.countBuilder(
                shrinkWrap: true,
                crossAxisCount: 4,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return AppPerformanceCard(
                    title: AppConstant.title[index],
                    color: AppConstant.color[index],
                    onTap: () => Get.to(
                      () => ExercisePerformance(
                        index: index, 
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (int index) =>
                    StaggeredTile.count(2, index.isEven ? 1.5 : 2.5),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
