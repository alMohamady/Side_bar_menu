import 'package:flutter/material.dart';
import 'package:flutter_app_side_menu/theme.dart';
import 'classes/navigtion_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Side Menu Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: drawerBackgroundColor,
        title: Text('Navigation Drawer'),
      ),
      body: Stack(
        children: <Widget>[
          Container(color: Colors.red,),
          NavigationDrawer(),
        ],

      ),
    );
  }
}


