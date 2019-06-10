import 'package:calcount_mobile/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


class historyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final Color ccColor = const Color(0xFFFF6C6C);
  TextStyle style = TextStyle(fontFamily: "Montserrat", fontSize: 20.0, color: const Color(0xFFFF6C6C));
  TextStyle style2 = TextStyle(fontFamily: "Montserrat", fontSize: 25.0, color: const Color(0xFFFFFFFF),);
    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("History"),
        backgroundColor: ccColor,
        actions: <Widget>[
          new Container(
            
            child: new FlatButton(
              child: new Text('Logout',style: style2,), //style: style2,), fillColor: ccColor,
              onPressed: () {},),
            padding: EdgeInsets.all(15.0),
          ),
        
        ],
      ),
      body: Center(
        child: Container(
          //color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new InkWell(
                  child: new Text('History', style: style,),
                ),
              ],
            ),
          ),
        ),
      ),
      

    );
  }

}