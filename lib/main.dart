import 'package:flutter/material.dart';
import 'package:homemanagement/view/chat_page.dart';
import 'package:homemanagement/view/home.dart';
import 'package:homemanagement/view/login.dart';
import 'package:homemanagement/view/register_hosue.dart';
import 'package:homemanagement/view/splashScreen.dart';
import 'package:homemanagement/view/user_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/second': (context) => LoginScreen(),
      },
    );
  }
}
