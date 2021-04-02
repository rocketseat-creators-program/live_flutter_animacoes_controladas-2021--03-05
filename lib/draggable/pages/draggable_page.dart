import 'package:flutter/material.dart';
import 'package:live_animacoes_controladas/draggable/models/board_model.dart';
import 'package:live_animacoes_controladas/draggable/pages/draggable_controller.dart';

import 'package:live_animacoes_controladas/draggable/widgets/board/board_widget.dart';

class DraggablePage extends StatefulWidget {
  DraggablePage({Key key}) : super(key: key);

  @override
  _DraggablePageState createState() => _DraggablePageState();
}

class _DraggablePageState extends State<DraggablePage> {
  final DraggableController controller = DraggableController.instance;
  double min = 0.0;
  double max = 0.0;
  double middle = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF89619E),
      appBar: AppBar(
        backgroundColor: Color(0xFF745286),
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          "assets/images/logo.png",
          width: 80,
        ),
      ),
      body: Scrollbar(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Container(
              child: ValueListenableBuilder<List<BoardModel>>(
            valueListenable: controller.boardsNotifier,
            builder: (_, boards, __) => ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (var i = 0; i < boards.length; i++)
                  Draggable(
                      key: ValueKey(boards[i].title),
                      onDragStarted: () {
                        min = 250.0 * i;
                        max = 250.0 * (i + 1);
                        middle = max / 2;
                      },
                      onDragUpdate: (details) {
                        final posx = details.globalPosition.dx;
                        print("POSX: $posx , MAX: $max, MIN: $min");
                        if (posx < min) {
                          controller.addTarget(i - 2);
                        } else if (posx > max) {
                          controller.addTarget(i + 2);
                        } else if (posx > middle && posx < max) {
                          controller.addTarget((i - 1) < 0 ? 0 : i - 1);
                        }
                      },
                      data: boards[i],
                      feedback: BoardWidget(
                        board: boards[i],
                      ),
                      onDragCompleted: () {
                        controller.reorderList(i);
                      },
                      child: BoardWidget(
                        board: boards[i],
                      ),
                      childWhenDragging: Container()),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
