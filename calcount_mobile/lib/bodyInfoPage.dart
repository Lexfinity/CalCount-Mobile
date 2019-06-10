import 'package:calcount_mobile/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


class BodyInfoPage extends StatefulWidget {
  TextStyle style = TextStyle(fontFamily: "Montserrat", fontSize: 20.0);
  final Color ccColor = const Color(0xFFFF6C6C);

  @override
  _bodyInfoPageState createState() => _bodyInfoPageState();
}

class _bodyInfoPageState extends State<BodyInfoPage> {
  String groupVal;
  final Color ccColor = const Color(0xFFFF6C6C);
  TextStyle style = TextStyle(
      fontFamily: "Montserrat", fontSize: 20.0, color: const Color(0xFFFF6C6C));

  var physActVal;
  var username;
  var age;
  var weight;
  var height;
  var sex;

  Future<String> updateBodyInfo(String username, int age, String sex, double weight, double height, int physActVal) async {
  //  var url = "http://localhost:8080/users/create/" + username +"/"+ firstName +"/" + lastName + "/"+ email + "/" + password;
   
     //var uri = createHttpClient();
      var uri = Uri.http('10.0.2.2:8080','/users/bodyInfo/$username/$age/$sex/$weight/$height/$physActVal');

    //var response = await http.get(Uri.encodeFull(url), headers:{"Accept" : "application/json"});
    //Navigator.of(context).pushNamed('/bodyInfo');
    var response = await http.post(uri);
     if (response.statusCode < 400) {
    var loginData = convert.jsonDecode(response.body);
    print(loginData);
    Navigator.of(context).pushNamed('/homePage');
     }
     else {
       print('error');

    }
  }

  @override
  Widget build(BuildContext context) {
    final ageField = TextField(
        obscureText: false,
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Age",
            //labelText: "Age",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                 onChanged: (String str) {
                    age = int.parse(str);
                  },
                );

    final weightField = TextField(
        obscureText: false,
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Weight",
            //labelText: "Weight",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                 onChanged: (String str) {
                    weight = double.parse(str);
                  }
                );

    final heightField = TextField(
        obscureText: false,
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Height",
            //labelText: "Height",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                onChanged: (String str) {
                    height = double.parse(str);
                  }
                );

    final SaveButton = Material(
      elevation: 1.0,
      borderRadius: BorderRadius.circular(30.0),
      color: ccColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          //Navigator.of(context).pushNamed('/homePage');
          updateBodyInfo(username, age, sex, weight, height, physActVal);

        },
        child: Text("Save",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
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
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: Container(
                          child: ageField,
                        ),
                        //SizedBox(height: 25.0),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: new Text(
                            'Years',
                            style: style,
                          ),
                          padding: EdgeInsets.all(23.0),
                        ),
                      ),
                    ],
                  ),
                  //ageField,
                  SizedBox(height: 25.0),
                  Row(
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: Container(
                          child: weightField,
                        ),
                        //SizedBox(height: 25.0),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: new Text(
                            'Kilograms',
                            style: style,
                          ),
                          padding: EdgeInsets.all(10.0),
                        ),
                      ),
                    ],
                  ),
                  //weightField,
                  SizedBox(height: 25.0),
                  Row(
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: Container(
                          child: heightField,
                        ),
                        //SizedBox(height: 25.0),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: new Text(
                            'Meters',
                            style: style,
                          ),
                          padding: EdgeInsets.all(19.0),
                        ),
                      ),
                    ],
                  ),
                  //heightField,
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                        onChanged: (e) => selectSex(e),
                        activeColor: ccColor,
                        value: "M",
                        groupValue: sex,
                      ),
                      new Text(
                        'Male',
                        style: style,
                      ),]),

                    Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                        onChanged: (e) => selectSex(e),
                        activeColor: ccColor,
                        value: "F",
                        groupValue: sex,
                      ),
                      new Text(
                        'Female',
                        style: style,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  new Text(
                    'How Active Are You?',
                    style: style,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: .0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Radio(
                        onChanged: (e) => selectPA(e),
                        activeColor: ccColor,
                        value: 0,
                        groupValue: physActVal,
                      ),
                      Text(
                        'Sedentary',
                        style: style,
                      )
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Radio(
                        onChanged: (e) => selectPA(e),
                        activeColor: ccColor,
                        value: 1,
                        groupValue: physActVal,
                      ),
                      Text(
                        'Low Active',
                        style: style,
                      )
                    ],
                  ),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
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
                      ]),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
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
                    ],
                  ),
                  SizedBox(height: 15.0),
                  SaveButton,
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
      if (e == "M") {
        sex = "M";
      } else if (e == "F") {
        sex = "F";
      }
    });
  }

  void selectPA(int e) {
    setState(() {
      if (e == 0) {
        physActVal = 0;
      } else if (e == 1) {
        physActVal = 1;
      } else if (e == 2) {
        physActVal = 2;
      } else if (e == 3) {
        physActVal = 3;
      }
    });
  }
}
