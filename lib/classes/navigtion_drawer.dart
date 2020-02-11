import 'package:flutter/material.dart';
import 'package:flutter_app_side_menu/models/navigation_model.dart';

import 'collapsing_list_tile.dart';


class NavigationDrawer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NavigationDrawerState();
  }
}

class NavigationDrawerState extends State<NavigationDrawer>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 250,
      child: Column(
        children: <Widget>[
          ListView.builder(itemBuilder: (context, counter) {
            return CollapsingListTile(
              title: navigationItems[counter].title,
              icon: navigationItems[counter].icon
            );
          })
        ],
      ),
    );
  }
}
