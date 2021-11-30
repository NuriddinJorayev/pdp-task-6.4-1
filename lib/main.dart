import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_6_1/pages/home_page.dart';
import 'package:task_6_1/pages/signin_page.dart';
import 'package:task_6_1/pages/signup_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
 await Hive.openBox("hive1");
 await Hive.openBox("hive2");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: Sign_In_page(),
      routes: {
        Home().id : (context) => Home(),
        Sign_In_page().id : (context) => Sign_In_page(),
        Sign_Up_page().id : (context) => Sign_Up_page(),
      },
    );
  }
}