import 'package:calcount_mobile/signup_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'bodyInfoPage.dart';
import 'main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CalCount',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage(),
        '/loggedIn': (BuildContext context) => new MainPage(),
        '/bodyInfo': (BuildContext context) => new BodyInfoPage(),
        '/homePage': (BuildContext context) => new MainPage(),
        '/startPage': (BuildContext context) => new MyHomePage(),
      },
      home: MyHomePage(title: 'CalCount Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: "Montserrat", fontSize: 20.0);
  
  
  String password;
  String username;
  var firstName;
  var lastName;
  var email;

  Future<String> login(String username, String password) async {
  //  var url = "http://localhost:8080/users/create/" + username +"/"+ firstName +"/" + lastName + "/"+ email + "/" + password;
   
     //var uri = createHttpClient();
      var uri = Uri.http('10.0.2.2:8080','/users/auth/$username/$password');

    //var response = await http.get(Uri.encodeFull(url), headers:{"Accept" : "application/json"});
    //Navigator.of(context).pushNamed('/bodyInfo');
    var response = await http.get(uri);
     if (response.statusCode < 400) {
    var loginData = convert.jsonDecode(response.body);
    print(loginData);
    Navigator.of(context).pushNamed('/loggedIn');
     }
     else {
       print('error');

    }
  }
 
  


  
  @override
  Widget build(BuildContext context) {

    final usernameField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Username",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        onChanged: (String str) {
                    username = str;
                  },
      );
    
    
    final passwordField = TextField(
          obscureText: true,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Password",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                  onChanged: (String str) {
                    password = str;
                  },
        );

    final Color ccColor = const Color(0xFFFF6C6C);

    final loginButton = Material(
      elevation: 1.0,
      borderRadius: BorderRadius.circular(30.0),
      color: ccColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          login(username, password);
        },
        child: Text("Login",
        textAlign: TextAlign.center,
        style: style.copyWith(
          color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final registerButton = FlatButton(
      //color: ccColor,
      child: MaterialButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/signup');
      },
      child: Text("Register",
      textAlign: TextAlign.center,
      style: style.copyWith(
        color: ccColor,
        fontWeight: FontWeight.bold))
      ),
    );

    final skipButton = Material (
    elevation: 0,
    child: MaterialButton(
      onPressed: (){
        Navigator.of(context).pushNamed('/loggedIn');
      },
      child: Text("Skip",
      textAlign: TextAlign.center,
      style: style.copyWith(
        color: ccColor,
        fontWeight: FontWeight.bold))
      ),
    );
    


    return Scaffold(
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
                    usernameField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(
                      height: 35.0,
                    ),
                    loginButton,
                    SizedBox(
                      height: 15.0,
                    ),
                    registerButton,
                    SizedBox(
                      height: 5.0,
                    ),
                    skipButton,
                    SizedBox(height: 5.0,
                    )
                  ],
                ),
                ),
              ),
            ),
          ),
        );

  }
}
