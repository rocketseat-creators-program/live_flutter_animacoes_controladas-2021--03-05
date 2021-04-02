import 'package:flutter/material.dart';

class CardTrelloWidget extends StatefulWidget {
  const CardTrelloWidget({Key key}) : super(key: key);

  @override
  _CardTrelloWidgetState createState() => _CardTrelloWidgetState();
}

class _CardTrelloWidgetState extends State<CardTrelloWidget>
    with SingleTickerProviderStateMixin {
  var posy = 0.0;
  var posx = 0.0;

  AnimationController _controller;
  Animation _animationPosy;
  Animation _animationPosx;

  void initAnimation() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animationPosy = Tween(begin: 0.0, end: 300).animate(_controller);
    _animationPosx = Tween(begin: 0.0, end: 300).animate(
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
  }

  @override
  void initState() {
    initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: posx,
      top: posy,
      child: Draggable(
        onDragUpdate: (details) {
          posx = details.globalPosition.dx - 50;
          posy = details.globalPosition.dy - 50;
          setState(() {});
        },
        child: Container(
          color: Colors.green,
          width: 100,
          height: 100,
          child: Center(child: Text("X: $posx \nY: $posy")),
        ),
        feedback: Container(
          color: Colors.green,
          width: 100,
          height: 100,
          child: Material(
            color: Colors.green,
            child: Center(child: Text("X: $posx \nY: $posy")),
          ),
        ),
        childWhenDragging: Container(),
      ),
    );
  }
}
