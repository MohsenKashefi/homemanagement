import 'package:flutter/material.dart';
import 'package:homemanagement/view/register.dart';
import 'package:lottie/lottie.dart';

// Import the RegisterScreen

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Container(
                //   alignment: Alignment.centerLeft,
                //   padding: EdgeInsets.symmetric(horizontal: 40),
                //   child: Text(
                //     "LOGIN",
                //     style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       color: Color(0xFF2661FA),
                //       fontSize: 36
                //     ),
                //     textAlign: TextAlign.left,
                //   ),
                // ),
                Container(
                  //  padding: EdgeInsets.only(top: 5),
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Lottie.asset("assets/images/login.json"),

                    //      Image.asset('assets/images/login.gif' ,
                    // ),
                  ),
                ),

                SizedBox(height: size.height * 0.02),

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            9.0), // optional, for rounded corners
                      ),
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.02),

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            9.0), // optional, for rounded corners
                      ),
                    ),
                    obscureText: true,
                  ),
                ),

                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(fontSize: 12, color: Color(0XFF2661FA)),
                  ),
                ),

                SizedBox(height: size.height * 0.05),

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 255, 136, 34),
                            Color.fromARGB(255, 255, 177, 41)
                          ],
                        ),
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        width: size.width * 0.5,
                        child: Text(
                          "LOGIN",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()))
                    },
                    child: Text(
                      "Don't Have an Account? Sign up",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2661FA)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
    
    );
  }
}
