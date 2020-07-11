import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:uiPractice/models/profileModel.dart';
import 'card.dart';
import 'models/courseModel.dart';

// ignore: must_be_immutable
class CourseCards extends StatelessWidget {
  final bool all;
  final Profile p;

  CourseCards({this.all, this.p});

  var count = 0;
  final int limit = 3;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = new ScreenScaler();

    return Container(
      height: scaler.getHeight(15.0),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: courses.length,
        // ignore: missing_return
        itemBuilder: (context, index) {
          Course course = courses[index];
          try{
            if(all == true && count<limit){
              count++;
              return CCard(course: course);
            }
            else if(p.courses.contains(course.code) && count<limit){
              count++;
              return CCard(course: course);
            }
            else{
              return Container(width: 0, height: 0);
            }
          }catch(e){}
        },
      ),
    );
  }
}