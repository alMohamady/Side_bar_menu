import 'package:flutter/material.dart';


class CollapsingListTile extends StatefulWidget{

  final String title;
  final IconData icon;


  CollapsingListTile({@required this.title,@required this.icon});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CollapsingListTileState();
  }
}

class CollapsingListTileState extends State<CollapsingListTile>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Icon(widget.icon, color: Colors.white30,),
        SizedBox(width: 10,),
        Text(widget.title)
      ],


    );
  }
}