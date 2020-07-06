import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() { 
  Paint.enableDithering = true;

  return  runApp(
            MaterialApp(
              theme: ThemeData(
                primaryColor: Color(0xff2f2ea6),
                primaryColorLight: Color(0xff4241a6),
                accentColor: Color(0xffe6e5f5),
                scaffoldBackgroundColor: Color(0xffffffff),
              ),
              home: Home(),
              debugShowCheckedModeBanner: false,
            )
          );
}