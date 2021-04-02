import 'package:flutter/material.dart';
import 'package:live_animacoes_controladas/card/card_trello_widget.dart';
import 'package:live_animacoes_controladas/draggable/pages/draggable_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Trello',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DraggablePage());
  }
}
