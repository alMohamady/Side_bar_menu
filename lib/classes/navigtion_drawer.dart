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
  double minWidth = 75;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  int currentSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
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
    return Material(
      elevation: 80,
      child: Container(
        width: widthAnimation.value,
        color: drawerBackgroundColor,
        child: Column(
          children: <Widget>[
            CollapsingListTile(title: 'Ahmed Mohamdy', icon: Icons.person, animationController: _animationController,),
            Divider(color: Colors.grey, height: 40.0,),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, counter) {
                  return Divider(height: 12.0);
                },
                itemBuilder: (context, counter) {
                  return CollapsingListTile(
                    onTap: () {
                      setState(() {
                        currentSelectedIndex = counter;
                      });
                    },
                    isSelected: currentSelectedIndex == counter,
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
              child: AnimatedIcon(
                icon: AnimatedIcons.close_menu,
                progress: _animationController,
                color: selectedColor,
                size: 50.0,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
