import 'package:calcount_mobile/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


class homeView extends StatefulWidget {
  @override
  homeViewState createState() => new homeViewState();
}

class homeViewState extends State<homeView> {
  //var username;
  var foodName;
  var itemCal;
  var portionsize;
  var dataCalRequired;
  var dataCalConsummed;
  List data;
  var username = "Costanza14";
   @override
  void initState() {
    super.initState();
    this.getConsummedItems();
          }

   Future<String> getConsummedItems() async {
          //  var url = "http://localhost:8080/users/create/" + username +"/"+ firstName +"/" + lastName + "/"+ email + "/" + password;
           
             //var uri = createHttpClient();
              var uri = Uri.encodeFull("http://10.0.2.2:8080/users/get/$username");
        
            //var response = await http.get(Uri.encodeFull(url), headers:{"Accept" : "application/json"});
            //Navigator.of(context).pushNamed('/bodyInfo');
            var response = await http.get(uri, headers: {"Accept": "application/json"});
            print(response.body);
        
            setState(() {
              var resBody = convert.jsonDecode(response.body);
              dataCalRequired = resBody["calorieRequired"];
              dataCalConsummed = resBody["caloriesConsummed"];
              });
        
          return "Success!";
          }


  @override
  Widget build(BuildContext context) {
  final Color ccColor = const Color(0xFFFF6C6C);
  TextStyle style = TextStyle(fontFamily: "Montserrat", fontSize: 20.0, color: const Color(0xFFFF6C6C));
  TextStyle style2 = TextStyle(fontFamily: "Montserrat", fontSize: 20.0, color: const Color(0xFFFFFFFF));
  TextStyle style3 = TextStyle(fontFamily: "Montserrat", fontSize: 28.0, color: const Color(0xFFFF6C6C));

  
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


  final foodNameField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Food Name",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        onChanged: (String str) {
                    foodName = str;
                  },
      );

      final itemCalField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Food Calorie",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        onChanged: (String str) {
                    foodName = str;
                  },
      );

      final itemPortionField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Portion Multiplier (default = 1)",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        onChanged: (String str) {
                    foodName = str;
                  },
      );

      final calCountButton = Material(
      elevation: 1.0,
      borderRadius: BorderRadius.circular(30.0),
      color: ccColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
         // Navigator.of(context).pushNamed('/bodyInfo');
         //signUp(username, firstName, lastName, email, password);
        },
        child: Text("Update CalCount",
        textAlign: TextAlign.center,
         style: style.copyWith(
         color: Colors.white, fontWeight: FontWeight.bold)
          ),
      ),
    );


    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Your CalCount"),
        automaticallyImplyLeading: false,
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
          padding: EdgeInsets.all(25),
          child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
            SizedBox(height: 20.0,),
            new Text("Calories Needed Today: ", style: style3,),
            SizedBox(height: 10.0,),
            Text('$dataCalRequired', style: style3, ),
            SizedBox(height: 30.0,),
            new Text("Calories Consummed Today: ", style: style3,),
            SizedBox(height: 10.0,),
            Text('$dataCalConsummed', style: style3, ),
            SizedBox(height: 60.0,),
            foodNameField,
            SizedBox(height: 15.0,),
            itemCalField,
            SizedBox(height: 15.0,),
            itemPortionField,
            SizedBox(height: 15.0,),
            calCountButton
            // TextBox(
            //   new Text('Calories Required Today:'),
              
            // ),
          ],),
        ),
      ),
  ),
  );

  }
}