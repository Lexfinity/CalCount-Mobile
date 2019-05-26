import 'package:calcount_mobile/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  TextStyle style = TextStyle(fontFamily: "Montserrat", fontSize: 20.0);
  final Color ccColor = const Color(0xFFFF6C6C);

@override
  _MainPageState createState() => _MainPageState();

}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  final pageOptions = [
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
  ];

  final Color ccColor = const Color(0xFFFF6C6C);
  TextStyle style = TextStyle(fontFamily: "Montserrat", fontSize: 20.0, color: const Color(0xFFFF6C6C));

  
  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Your CalCount"),
        backgroundColor: ccColor,
      ),
      body: pageOptions[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPage,
        selectedItemColor: ccColor,
        onTap: (int index) {
          setState(() {
            selectedPage = index;
          });
        },
        items: [
           BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profile')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings')
          ),
        ],
      ),
    );
  }
}