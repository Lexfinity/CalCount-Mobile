import 'package:calcount_mobile/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: "Montserrat", fontSize: 20.0);
  final Color ccColor = const Color(0xFFFF6C6C);

  @override
  Widget build(BuildContext context) {
  

    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)))
      );
    
    
    final passwordField = TextField(
          obscureText: true,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Password",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        );

    final usernameField = TextField(
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Username",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    
    final SignupButton = Material(
      elevation: 1.0,
      borderRadius: BorderRadius.circular(30.0),
      color: ccColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.of(context).pushNamed('/bodyInfo');
        },
        child: Text("Sign Up",
        textAlign: TextAlign.center,
         style: style.copyWith(
         color: Colors.white, fontWeight: FontWeight.bold)
          ),
      ),
    );
    

   
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Register"),
        backgroundColor: ccColor,
      ),
      body: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 155.0,
                      child: Image.asset(
                        "assets/ccLogo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45.0),
                    emailField,
                    SizedBox(height: 25.0),
                    usernameField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(
                      height: 35.0,
                    ),
                    SignupButton,
                    SizedBox(height: 15.0),
                    ],
                ),
                ),
              ),
            ),
          ),
    );
  }
}

