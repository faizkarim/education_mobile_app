import 'package:flutter/material.dart';

class AppSize {
  // tabsize
  static double tabHeight(BuildContext context) =>
      MediaQuery.of(context).padding.top + kToolbarHeight;

  // space
  static double space = 5.0;
  static double spaceX1 = 10.0;
  static double spaceX2 = 20.0;
  static double spaceX3 = 30.0;
  static double spaceX4 = 40.0;
  static double spaceX5 = 50.0;
  static double spaceX6 = 60.0;
  static double spaceX7 = 70.0;
  static double spaceX8 = 80.0;
  static double spaceX9 = 90.0;
  static double spaceX10 = 100.0;

  // screen
  static bool keyboardShowing(BuildContext context) =>
      MediaQuery.of(context).viewInsets.vertical > 0;
  static double keyboardHight(BuildContext context) =>
      MediaQuery.of(context).viewInsets.bottom;
  static double heightScreen(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double widthScreen(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double maxWidthScreen(BuildContext context) =>
      widthScreen(context) >= 400
          ? 380
          : widthScreen(context) >= 360
              ? widthScreen(context) - 60
              : 300;

  // font size
  static double fontSmall = 12.0;
  static double fontMedium = 14.0;
  static double fontLarge = 16.0;
  static double fontLargeX2 = 18.0;
  static double fontLargeX3 = 20.0;
  static double fontLargeX4 = 22.0;
  static double fontLargeX5 = 24.0;
  static double fontLargeX6 = 26.0;
  static double fontX32 = 32.0;
}

typedef void OnWidgetSizeChange(Size size);

// class MeasureSize extends StatefulWidget {
//   final Widget child;
//   final OnWidgetSizeChange onChange;

//   const MeasureSize({
//     Key key,
//     @required this.onChange,
//     @required this.child,
//   }) : super(key: key);

//   @override
//   _MeasureSizeState createState() => _MeasureSizeState();
// }

// class _MeasureSizeState extends State<MeasureSize> {
//   @override
//   Widget build(BuildContext context) {
//     SchedulerBinding.instance.addPostFrameCallback(postFrameCallback);
//     return Container(
//       key: widgetKey,
//       child: widget.child,
//     );
//   }

//   var widgetKey = GlobalKey();
//   var oldSize;

//   void postFrameCallback(_) {
//     var context = widgetKey.currentContext;
//     if (context == null) return;

//     var newSize = context.size;
//     if (oldSize == newSize) return;

//     oldSize = newSize;
//     widget.onChange(newSize);
//   }
// }
