import 'dart:async';
import 'package:flutter/material.dart';
import 'package:homemanagement/view/login.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Set a timer to navigate to another page after 5 seconds
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
       // color: Colors.purpleAccent,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Home Management",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20), // Add spacing between text and animation
                Container(
                  height: size.height * 0.2,
                  width: size.width * 0.6,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Lottie.asset("assets/images/home.json"),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0), // Set the distance here
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
