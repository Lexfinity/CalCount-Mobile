import 'package:calcount_mobile/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


class homeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final Color ccColor = const Color(0xFFFF6C6C);
  TextStyle style = TextStyle(fontFamily: "Montserrat", fontSize: 20.0, color: const Color(0xFFFF6C6C));
  TextStyle style2 = TextStyle(fontFamily: "Montserrat", fontSize: 20.0, color: const Color(0xFFFFFFFF));
    
  var username;

  Future<String> logout(String username) async {
  //  var url = "http://localhost:8080/users/create/" + username +"/"+ firstName +"/" + lastName + "/"+ email + "/" + password;
   
     //var uri = createHttpClient();
      var uri = Uri.http('10.0.2.2:8080','/users/logout/$username');

    //var response = await http.get(Uri.encodeFull(url), headers:{"Accept" : "application/json"});
    //Navigator.of(context).pushNamed('/bodyInfo');
    var response = await http.post(uri);
     if (response.statusCode < 400) {
    var signUpData = convert.jsonDecode(response.body);
    print(signUpData);
    Navigator.of(context).pushNamed('/startPage');
     }
     else {
       print('error');

    }
  }


    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Your CalCount"),
        backgroundColor: ccColor,
        actions: <Widget>[
          new Container(
            
            child: new FlatButton(
              child: new Text('Logout',style: style2,), //style: style2,), fillColor: ccColor,
              onPressed: () {

              },),
            padding: EdgeInsets.all(15.0),
          ),
        
        ],
      ),
      body: Center(
        child: Container(
          child: Column(children: <Widget>[
            
            // TextBox(
            //   new Text('Calories Required Today:'),
              
            // ),
          ],),
        ),),
    );
  }
}