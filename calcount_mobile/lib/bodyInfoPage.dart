import 'package:calcount_mobile/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BodyInfoPage extends StatefulWidget {

  TextStyle style = TextStyle(fontFamily: "Montserrat", fontSize: 20.0);
  final Color ccColor = const Color(0xFFFF6C6C);
  
@override
  _bodyInfoPageState createState() => _bodyInfoPageState();

}

class _bodyInfoPageState extends State<BodyInfoPage> {
  String groupVal;
  final Color ccColor = const Color(0xFFFF6C6C);
  TextStyle style = TextStyle(fontFamily: "Montserrat", fontSize: 20.0, color: const Color(0xFFFF6C6C));
  
  int physActVal;

  


  @override
  Widget build(BuildContext context) {

      final ageField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Age",
        //labelText: "Age",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)))
      );

      final weightField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Weight",
        //labelText: "Weight",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)))
      );

      final heightField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Height",
        //labelText: "Height",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)))
      );

      final SaveButton = Material(
      elevation: 1.0,
      borderRadius: BorderRadius.circular(30.0),
      color: ccColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.of(context).pushNamed('/homePage');
        },
        child: Text("Save",
        textAlign: TextAlign.center,
         style: style.copyWith(
         color: Colors.white, fontWeight: FontWeight.bold)
          ),
      ),
    );
      
  
  
  



    return new Scaffold(
       appBar: new AppBar(
        title: new Text("Body Info"),
        backgroundColor: ccColor,
      ),
       body: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(55.0),
                child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ageField,
                    SizedBox(height: 25.0),
                    weightField,
                    SizedBox(height: 25.0),
                    heightField,
                    SizedBox(
                      height: 35.0,
                    ),
                     Row(
                       children: <Widget>[
                          new Radio(
                          onChanged: (e) => selectSex(e),
                          activeColor: ccColor,
                          value: "M",
                          groupValue: groupVal,
                    ),
                    new Text(
                      'Male',
                      style: style,
                    ),
                    new Radio(
                          onChanged: (e) => selectSex(e),
                          activeColor: ccColor,
                          value: "F",
                          groupValue: groupVal,
                    ),
                    new Text(
                      'Female',
                      style: style,
                    ),
                       ],
                     ),
                    
                    new Text(
                      'How Active Are You?',
                      style: style,
                    ),

                    Row(
                      children: <Widget>[
                    new Radio(
                        onChanged: (e) => selectPA(e),
                        activeColor: ccColor,
                        value: 0,
                        groupValue: physActVal,
                    ),
                     new Text(
                      'Sedentary',
                      style: style,
                    ),
                    new Radio(
                        onChanged: (e) => selectPA(e),
                        activeColor: ccColor,
                        value: 1,
                        groupValue: physActVal,
                    ),
                     new Text(
                      'Low Active',
                      style: style,
                    ),
                    ],),

                    Row( children: <Widget>[
                    new Radio(
                        onChanged: (e) => selectPA(e),
                        activeColor: ccColor,
                        value: 2,
                        groupValue: physActVal,
                    ),
                     new Text(
                      'Active',
                      style: style,
                    ),

                    new Radio(
                        onChanged: (e) => selectPA(e),
                        activeColor: ccColor,
                        value: 3,
                        groupValue: physActVal,
                    ),
                     new Text(
                      'Very Active',
                      style: style,
                    ),
                    ],),
                    SaveButton,
                    SizedBox(height: 15.0),
                    ],
                ),
                ),
              ),
            ),
          ),
      );
  }

  void selectSex(String e) {
    setState(() {
     if(e == "M") {
       groupVal = "M";
     } else if (e == "F") {
       groupVal = "F";
     }
    } 
    );
  }

  
  void selectPA(int e) {
    setState(() {
     if(e == 0) {
       physActVal = 0;
     } else if (e == 1) {
       physActVal = 1;
     }  else if (e == 2) {
       physActVal = 2;
     }  else if (e == 3) {
       physActVal = 3;
     }
    } 
    );
  }



}
