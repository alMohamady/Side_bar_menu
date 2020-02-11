import 'package:flutter/material.dart';
import 'package:flutter_app_side_menu/models/navigation_model.dart';
import 'package:flutter_app_side_menu/theme.dart';

import 'collapsing_list_tile.dart';


class NavigationDrawer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NavigationDrawerState();
  }
}

class NavigationDrawerState extends State<NavigationDrawer> with SingleTickerProviderStateMixin {
  double maxWidth = 250;
  double minWidth = 65;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth).animate(
        _animationController);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) {
        return getWidget(context, widget);
      },
    );
  }

  Widget getWidget(context, widget) {
    return Container(
      width: widthAnimation.value,
      color: drawerBackgroundColor,
      child: Column(
        children: <Widget>[
          SizedBox(height: 50,),
          CollapsingListTile(
            title: 'Ahmed Mohamady',
            icon: Icons.person,
            animationController: _animationController,
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, counter) {
              return CollapsingListTile(
                title: navigationItems[counter].title,
                icon: navigationItems[counter].icon,
                animationController: _animationController,
              );
            },
              itemCount: navigationItems.length,
            ),
          ),
          InkWell(
              onTap: () {
                setState(() {
                  isCollapsed = !isCollapsed;
                  isCollapsed
                      ? _animationController.forward()
                      : _animationController.reverse();
                });
              },
              child: Icon(Icons.chevron_left, color: Colors.white, size: 50,)
          ),
          SizedBox(height: 50,),
        ],
      ),
    );
  }
}
