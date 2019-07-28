
import 'package:calcount_mobile/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


class SignupPage extends StatefulWidget {

 @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignupPageState();
  }
}
  TextStyle style = TextStyle(fontFamily: "Montserrat", fontSize: 20.0);
  final Color ccColor = const Color(0xFFFF6C6C);


class SignupPageState extends State<SignupPage> {

  
/*
  var username = TextEditingController();
  @override
  void disposeUsername() {
    // Clean up the controller when the Widget is disposed
    username.dispose();
    super.dispose();
  }

  var password = TextEditingController();
  @override
  void disposePassword() {
    // Clean up the controller when the Widget is disposed
    password.dispose();
    super.dispose();
  }

 var firstName = TextEditingController();
  @override
  void disposeFirstName() {
    // Clean up the controller when the Widget is disposed
    firstName.dispose();
    super.dispose();
  }

 var lastName = TextEditingController();
  @override
  void disposeLastName() {
    // Clean up the controller when the Widget is disposed
    lastName.dispose();
    super.dispose();
  }

  var email = TextEditingController();
  @override
  void disposeEmail() {
    // Clean up the controller when the Widget is disposed
    email.dispose();
    super.dispose();
  }

*/

String username;
String firstName;
String lastName;
String password;
String email;

final TextEditingController controller = new TextEditingController();



  Future<String> signUp(String username, String firstName, String lastName, String email, String password) async {
  //  var url = "http://localhost:8080/users/create/" + username +"/"+ firstName +"/" + lastName + "/"+ email + "/" + password;
   
     //var uri = createHttpClient();
      var uri = Uri.http('10.0.2.2:8080','/users/create/$username/$firstName/$lastName/$email/$password');

    //var response = await http.get(Uri.encodeFull(url), headers:{"Accept" : "application/json"});
    //Navigator.of(context).pushNamed('/bodyInfo');
    var response = await http.post(uri);
     if (response.statusCode < 400) {
    var signUpData = convert.jsonDecode(response.body);
    print(signUpData);
    Navigator.of(context).pushNamed('/bodyInfo');
     }
     else {
       print('error');

    }
  }

  @override
  Widget build(BuildContext context) {
  

    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        onChanged: (String str) {
                    email = str;
                  },
      );
    
    
    final passwordField = TextField(
          obscureText: true,
          style: style,
          //controller: password,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Password",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                  onChanged: (String str) {
                    password = str;
                  },
        );

    final usernameField = TextField(
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Username",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                  onChanged: (String str) {
                    username = str;
                  },
    );
     final firstnameField = TextField(
      style: style,
      //controller: firstName,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "First Name",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                  onChanged: (String str) {
                    firstName = str;
                  },
    );
     final lastnameField = TextField(
      style: style,
      //controller: lastName,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Last Name",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                  onChanged: (String str) {
                    lastName = str;
                  },
    );
    
    final SignupButton = Material(
      elevation: 1.0,
      borderRadius: BorderRadius.circular(30.0),
      color: ccColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
         // Navigator.of(context).pushNamed('/bodyInfo');
         signUp(username, firstName, lastName, email, password);
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
                    firstnameField,
                    SizedBox(height: 25.0,),
                    lastnameField,
                    SizedBox(height: 25.0,),
                    emailField,
                    SizedBox(height: 25.0),
                    usernameField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(height: 35.0,),
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

