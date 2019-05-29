import 'package:calcount_mobile/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



class homeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final Color ccColor = const Color(0xFFFF6C6C);
  TextStyle style = TextStyle(fontFamily: "Montserrat", fontSize: 20.0, color: const Color(0xFFFF6C6C));
  TextStyle style2 = TextStyle(fontFamily: "Montserrat", fontSize: 20.0, color: const Color(0xFFFFFFFF));
    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Your CalCount"),
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
    );
  }
}