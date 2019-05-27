import 'package:calcount_mobile/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



class settingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final Color ccColor = const Color(0xFFFF6C6C);
  TextStyle style = TextStyle(fontFamily: "Montserrat", fontSize: 20.0, color: const Color(0xFFFF6C6C));
    
    return new Scaffold(
      // appBar: new AppBar(
      //   title: new Text("Settings"),
      //   backgroundColor: ccColor,
      //),
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
                  child: new Text('Logout', style: style),
                ),
              ],
            ),
          ),
        ),
      ),
      

    );
  }

}