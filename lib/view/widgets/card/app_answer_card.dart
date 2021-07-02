import 'package:education_mobile_app/utils/app_size.dart';
import 'package:flutter/material.dart';

class AppAnswerCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;

  AppAnswerCard({
    this.color,
    this.icon,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6.0),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.all(6),
            child: Icon(
              icon,
              color: Colors.white.withOpacity(0.6),
              size: 38,
            ),
          ),
          SizedBox(
            width: AppSize.spaceX1,
          ),
          Flexible(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
