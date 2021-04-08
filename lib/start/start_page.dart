import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  var posX = 0.0;
  var posY = 0.0;
  bool isDrawing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Star Page"),
        ),
        body: Stack(
          children: [
            if (isDrawing)
              Positioned(
                left: MediaQuery.of(context).size.width / 2,
                top: MediaQuery.of(context).size.height / 2,
                child: DragTarget<Color>(
                  builder: (context, candidateData, rejectedData) {
                    return Container(
                      height: 100,
                      width: 100,
                      color: Colors.grey,
                    );
                  },
                  onAccept: (data) {
                    posX = MediaQuery.of(context).size.width / 2;
                    posY = MediaQuery.of(context).size.height / 2;
                    setState(() {});
                  },
                  onWillAccept: (data) {
                    return data != null;
                  },
                ),
              ),
            Positioned(
              top: posY,
              left: posX,
              child: Draggable<Color>(
                onDragStarted: () {
                  isDrawing = true;
                  setState(() {});
                },
                onDragEnd: (_) {
                  isDrawing = false;
                  setState(() {});
                },
                data: Colors.purple,
                feedback: Container(
                  width: 100,
                  height: 100,
                  color: Colors.purple,
                ),
                childWhenDragging: Container(
                  width: 100,
                  height: 100,
                  color: Colors.transparent,
                ),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ));
  }
}
