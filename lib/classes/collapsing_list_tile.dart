import 'package:flutter/material.dart';

import '../theme.dart';


class CollapsingListTile extends StatefulWidget{

  final String title;
  final IconData icon;
  final AnimationController animationController;

  CollapsingListTile({@required this.title,@required this.icon, @required this.animationController});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CollapsingListTileState();
  }
}

class CollapsingListTileState extends State<CollapsingListTile>{

  Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();
    _widthAnimation = Tween <double> (begin: 250, end: 65).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: _widthAnimation.value,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: <Widget>[
          Icon(widget.icon, color: Colors.white30,),
          SizedBox(width: 10,),
          (_widthAnimation.value >= 220) ? Text(widget.title, style: listTitleDefaultTextStyle) : Container()

        ],
      ),
    );
  }
}