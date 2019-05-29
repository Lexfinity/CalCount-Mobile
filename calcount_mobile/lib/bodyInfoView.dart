import 'package:calcount_mobile/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



class bodyInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final Color ccColor = const Color(0xFFFF6C6C);
  TextStyle style = TextStyle(fontFamily: "Montserrat", fontSize: 20.0, color: const Color(0xFFFF6C6C));
  TextStyle style2 = TextStyle(fontFamily: "Montserrat", fontSize: 20.0, color: const Color(0xFFFFFFFF)); //color: const Color(0xFFFF6C6C));
    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Body Info"),
        backgroundColor: ccColor,
        actions: <Widget>[
          new Container(
            
            child: new FlatButton(
              child: new Text('Logout',style: style2,),
              onPressed: () {},),
            padding: EdgeInsets.all(15.0),
          ),
        
        ],
      ),
      //body: Center(
        body: Container(
          child: Column(
            children: <Widget>[
              new Text('Name:'),
              new Text('data'),
              new Text('data'),
              new Text('data'),

            ],
          ),
        //),
      ),
    );
  }
}