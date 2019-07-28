import 'package:calcount_mobile/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


class historyView extends StatefulWidget {
  @override
  historyViewState createState() => new historyViewState();
}

class historyViewState extends State<historyView> {
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
              data = resBody["consummedFoodItems"];
              });
        
          return "Success!";
          }


  @override
  Widget build(BuildContext context) {
  final Color ccColor = const Color(0xFFFF6C6C);
  TextStyle style = TextStyle(fontFamily: "Montserrat", fontSize: 20.0, color: const Color(0xFFFF6C6C));
  TextStyle style2 = TextStyle(fontFamily: "Montserrat", fontSize: 20.0, color: const Color(0xFFFFFFFF),);
  TextStyle style3 = TextStyle(fontFamily: "Montserrat", fontSize: 20.0, color: Colors.black87,);
  //var username = 'Ammar4';
            
            return new Scaffold(
              appBar: new AppBar(
                title: new Text("History"),
                automaticallyImplyLeading: false,
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
              body: ListView.builder(
                itemCount: data == null? 0: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return new Container(
                    child: new Center(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                        new Card(
                          child: new Container(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              children: <Widget>[
                             Row(
                              children: <Widget>[
                                Text('Food Name: ', style: style,),                                                           
                                Text(data[index]["foodName"], style: style3, ),
                                
                          ],
                          ),
                           new Row(
                             children: <Widget>[
                              Text('Item Calorie: ', style: style,),                                                           
                              Text('${data[index]["itemCalorie"]}', style: style3 ,),
                             ],
                             ),
                             new Row(
                             children: <Widget>[
                              Text('Date Consummed: ', style: style,),                                                           
                              Text('${data[index]["dateConsummed"]}', style: style3 ,),
                             ],
                             ),
                          ],)),
                        ),
                        // Card(
                        //   child: new Container(
                        //     padding: EdgeInsets.all(20.0),
                        //     child: Row(
                        //       children: <Widget>[
                        //         Text('Item Calorie', style: style,),                                                           
                        //         Text('${data[index]["itemCalorie"]}'),
        
                        //   ],
                        //   )),
                        // ),
                        ],
        
                      ),
                      ),
        
                  );
        
                },
        
        
        
        
        
        
        
        
        
        
        
                // child: Container(
                //   //color: Colors.white,
                //   child: Padding(
                //     padding: const EdgeInsets.all(30.0),
                //     child: Column(
                //       // crossAxisAlignment: CrossAxisAlignment.start,
                //       //mainAxisAlignment: MainAxisAlignment.start,
                //       children: <Widget>[
                //         new InkWell(
                //           child: new Text('History', style: style,),
                //           ListView.builder()
                //         ),
                //       ],
                //     ),
                //   ),
                //  ),
              ),
              
        
            );
        
          }
    
  //     Future<String> getConsummedItems() async {
  // //  var url = "http://localhost:8080/users/create/" + username +"/"+ firstName +"/" + lastName + "/"+ email + "/" + password;
   
  //    //var uri = createHttpClient();
  //     var uri = Uri.encodeFull('10.0.2.2:8080/users/get/Ammar4');

  //   //var response = await http.get(Uri.encodeFull(url), headers:{"Accept" : "application/json"});
  //   //Navigator.of(context).pushNamed('/bodyInfo');
  //   var response = await http.get(uri, headers: {"Accept": "application/json"});
  //   print(response.body);

  //   setState(() {
  //     var resBody = convert.jsonDecode(response.body);
  //     data = resBody["consummedFoodItems"];
  //     });

  // return "Success!";
  // }

  // @override
  //   void initState() {
  //     super.initState();
  //     this.getConsummedItems();
  //         }

}