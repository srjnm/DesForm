import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/profileModel.dart';
import '../heading.dart';
import '../smallCard.dart';

// ignore: must_be_immutable
class YourCourses extends StatelessWidget {
  Profile p;
  List<DocumentSnapshot> filteredCourses = [];

  YourCourses({this.p});

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler();
    final double mainCurve = 20.0;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 40.0, bottom: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(mainCurve),
                  bottomRight: Radius.circular(mainCurve),
                ),
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Theme.of(context).primaryColorLight,
                    Theme.of(context).primaryColor
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 25.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.chevron_left),
                    color: Color(0xffffffff),
                    iconSize: scaler.getWidth(3.0),
                  ),
                  Heading(
                    text: 'Your Courses',
                    color: Color(0xffffffff),
                    weight: FontWeight.w900,
                    fontSize: scaler.getTextSize(8.5),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: StreamBuilder(
                stream: Firestore.instance.collection('courses').snapshots(),
                builder: (context, snapshot){
                  if(!snapshot.hasData)
                    return Text('');

                  for(int i=0; i<snapshot.data.documents.length; i++){
                    DocumentSnapshot course = snapshot.data.documents[i];
                    if(p.courses.contains(course['code'].toString())){
                      filteredCourses.add(course);
                    }
                  }

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    primary: false,
                    shrinkWrap: true,
                    itemCount: filteredCourses.length,
                    itemBuilder: (context, index){
                      var course = filteredCourses[index];
                      return SCCard(course: course);
                    },
                  );
                },
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}