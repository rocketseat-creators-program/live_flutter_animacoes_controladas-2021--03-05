import 'package:flutter/material.dart';

class TrelloPage extends StatefulWidget {
  TrelloPage({Key key}) : super(key: key);

  @override
  _TrelloPageState createState() => _TrelloPageState();
}

class _TrelloPageState extends State<TrelloPage> {
  final tarefas = <String, List<String>>{
    "todo": ["Fazer almoco", "Criar Video"],
    "done": []
  };

  List<Widget> buildTarefas() {
    final widgets = <Widget>[];
    tarefas.forEach((key, value) => widgets.add(Container(
          width: 250,
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  key.toUpperCase(),
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 8,
                ),
                ...value
                    .map((e) => Draggable<String>(
                          data: e,
                          feedback: Container(
                            width: 250,
                            child: Card(
                                child: ListTile(
                              title: Text(e),
                            )),
                          ),
                          childWhenDragging: Container(),
                          child: Container(
                            width: 250,
                            child: Card(
                                child: ListTile(
                              title: Text(e),
                            )),
                          ),
                        ))
                    .toList(),
                DragTarget<String>(
                  builder: (_, __, ___) => Container(
                    height: 50,
                  ),
                  onWillAccept: (data) {
                    return data != null;
                  },
                  onAccept: (data) {
                    if (!tarefas[key].contains(data)) tarefas[key].add(data);
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        )));
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Trello"),
        ),
        body: Row(children: buildTarefas()));
  }
}
