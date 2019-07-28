import 'package:calcount_mobile/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


class bodyInfoView extends StatefulWidget {
  @override
  bodyInfoViewState createState() => new bodyInfoViewState();
}

class bodyInfoViewState extends State<bodyInfoView> {
  final Color ccColor = const Color(0xFFFF6C6C);
  TextStyle style = TextStyle(fontFamily: "Montserrat", fontSize: 22.0, color: const Color(0xFFFF6C6C));
  TextStyle style2 = TextStyle(fontFamily: "Montserrat", fontSize: 20.0, color: const Color(0xFFFFFFFF)); //color: const Color(0xFFFF6C6C));
  TextStyle style3 = TextStyle(fontFamily: "Montserrat", fontSize: 22.0, color: Colors.black87,);
  TextStyle style4 = TextStyle(fontFamily: "Montserrat", fontSize: 30.0, color: const Color(0xFFFF6C6C), decoration: TextDecoration.underline);
  TextStyle style5 = TextStyle(fontFamily: "Montserrat", fontSize: 20.0, color: const Color(0xFFFF6C6C));
  List data;
  //var username = "Costanza14";
  String dataUsername, dataFirstName, dataLastName, dataHeight, dataWeight, dataSex, dataAge;

  @override
  void initState() {
    super.initState();
    this.getUserBodyInfo();
          }


  Future<String> getUserBodyInfo() async {
          //  var url = "http://localhost:8080/users/create/" + username +"/"+ firstName +"/" + lastName + "/"+ email + "/" + password;
           
             //var uri = createHttpClient();
              var uri = Uri.encodeFull("http://10.0.2.2:8080/users/get/Costanza14");
        
            //var response = await http.get(Uri.encodeFull(url), headers:{"Accept" : "application/json"});
            //Navigator.of(context).pushNamed('/bodyInfo');
            var response = await http.get(uri, headers: {"Accept": "application/json"});
            print(response.body);
        
            setState(() {
              var resBody = convert.jsonDecode(response.body);
              dataUsername = resBody["username"];
              dataFirstName = resBody["firstName"];
              dataLastName = resBody["lastName"];
              dataSex = resBody["sex"];
              dataAge = resBody["age"].toString();
              dataHeight = resBody["height"].toString();
              dataWeight = resBody["weight"].toString();
              });
        
          return "Success!";
          }
  
  @override
  Widget build(BuildContext context) {
 final EditButton = Material(
      elevation: 1.0,
      borderRadius: BorderRadius.circular(30.0),
      color: ccColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.of(context).pushNamed('/bodyInfo');
          //updateBodyInfo(username, age, sex, weight, height, physActVal);

        },
        child: Text("Edit Body Info",
            textAlign: TextAlign.center,
            style: style5.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  

   

  // final Color ccColor = const Color(0xFFFF6C6C);
  
 

    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Body Info"),
        automaticallyImplyLeading: false,
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

      body: ListView.builder(
                itemCount: 1,
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
                            new Text("Your Info", style: style4,),
                            SizedBox(height: 25.0,),
                            Text('Username: ', style: style,), 
                            SizedBox(height: 5.0,),                                                          
                            Text('$dataUsername', style: style3, ),
                          //    Row(
                          //     children: <Widget>[
                          //       Text('Username: ', style: style,),                                                           
                          //       Text('$dataUsername', style: style3, ),
                          // ],
                          // ),
                          SizedBox(height: 20,),
                           Text('First Name : ', style: style,),
                           SizedBox(height: 5.0,),                                                           
                            Text('$dataFirstName', style: style3,),
                          //  new Row(
                          //    children: <Widget>[
                          //     Text('First Name : ', style: style,),                                                           
                          //     Text('$dataFirstName', style: style3,),
                          //    ],
                          //    ),
                             SizedBox(height: 20,),
                              Text('Last Name : ', style: style,), 
                              SizedBox(height: 5.0,),                                                          
                              Text('$dataLastName', style: style3,),
                            //   new Row(
                            //  children: <Widget>[
                            //   Text('Last Name : ', style: style,),                                                           
                            //   Text('$dataLastName', style: style3,),
                            //   ],
                            //  ),
                             SizedBox(height: 20,),
                             Text('Age : ', style: style,),
                             SizedBox(height: 5.0,),                                                           
                             Text('$dataAge', style: style3,),
                            //   new Row(
                            //  children: <Widget>[
                            //   Text('Age : ', style: style,),                                                           
                            //   Text('$dataAge', style: style3,),
                            //   ],
                            //  ),
                             SizedBox(height: 20,),
                             Text('Height : ', style: style,),
                             SizedBox(height: 5.0,),                                                           
                              Text('$dataHeight m', style: style3,),
                            //   new Row(
                            //  children: <Widget>[
                            //   Text('Height : ', style: style,),                                                           
                            //   Text('$dataHeight', style: style3,),
                            //   Text(' m', style: style,)
                            //  ],
                            //  ),
                             SizedBox(height: 10,),
                             Text('Weight : ', style: style,),                                                           
                              Text('$dataWeight kg', style: style3,),
                            //  new Row(
                            //  children: <Widget>[
                            //   Text('Weight : ', style: style,),                                                           
                            //   Text('$dataWeight', style: style3,),
                            //   Text(' kg', style: style,)

                            //  ],
                            //  ),
                             SizedBox(height: 10,),
                             Text('Sex : ', style: style,),                                                           
                              Text('$dataSex', style: style3,),
                              SizedBox(height: 10,),
                              EditButton,
                            //  new Row(
                            //  children: <Widget>[
                            //   Text('Sex : ', style: style,),                                                           
                            //   Text('$dataSex', style: style3,),
                            //  ],
                            //  ),

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
        }

      //   body: Container(
      //     child: Column(
      //       children: <Widget>[
      //         new Text(data["username"]),
      //          new Text('data'),
      //          new Text('data'),
      //          new Text('data'),

      //       ],
      //     ),
      //   //),
      // ),
//     );
//   }
// }
