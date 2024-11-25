import 'package:flutter/material.dart';
import 'package:homemanagement/view/login.dart';
import 'package:lottie/lottie.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                //  padding: EdgeInsets.only(top: 5),
                height: MediaQuery.sizeOf(context).height * 0.3,
                width: MediaQuery.sizeOf(context).width * 0.7,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Lottie.asset("assets/images/register.json"),

                  //      Image.asset('assets/images/login.gif' ,
                  // ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            9.0), // optional, for rounded corners
                      ),
                      labelText: "Name"),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            9.0), // optional, for rounded corners
                      ),
                      labelText: "Mobile Number"),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            9.0), // optional, for rounded corners
                      ),
                      labelText: "Username"),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            9.0), // optional, for rounded corners
                      ),
                      labelText: "Password"),
                  obscureText: true,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
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
                        "SIGN UP",
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()))
                  },
                  child: Text(
                    "Already Have an Account? Sign in",
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
