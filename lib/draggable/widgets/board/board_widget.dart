import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:live_animacoes_controladas/draggable/models/board_model.dart';
import 'package:live_animacoes_controladas/draggable/models/card_model.dart';
import 'package:live_animacoes_controladas/draggable/widgets/add_another_card_widget.dart';
import 'package:live_animacoes_controladas/draggable/widgets/board/board_controller.dart';
import 'package:live_animacoes_controladas/draggable/widgets/card_widget.dart';

class BoardWidget extends StatefulWidget {
  final BoardModel board;

  BoardWidget({
    Key key,
    @required this.board,
  }) : super(key: key);

  @override
  _BoardWidgetState createState() => _BoardWidgetState();
}

class _BoardWidgetState extends State<BoardWidget> {
  final _scrollController = ScrollController();
  BoardController controller;
  bool enableDrag = false;

  @override
  void initState() {
    controller = BoardController(board: widget.board);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.board.isTarget) {
      return DragTarget<BoardModel>(
        builder: (context, List<BoardModel> candidateData, rejectedData) {
          return Container(
            color: Colors.green,
            width: 250,
            height: MediaQuery.of(context).size.height,
          );
        },
        onWillAccept: (data) {
          return true;
        },
        onAccept: (data) {},
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Container(
            width: 250,
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: PreferredSize(
                child: Container(
                  color: Color(0xFFEBECF0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          controller.board.title,
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF192A4D),
                              fontWeight: FontWeight.w500),
                        ),
                        IconButton(
                            icon: Icon(
                              FontAwesomeIcons.ellipsisH,
                              size: 14,
                              color: Color(0xFF192A4D),
                            ),
                            onPressed: () {})
                      ],
                    ),
                  ),
                ),
                preferredSize: Size.fromHeight(34),
              ),
              body: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4)),
                child: Container(
                  color: Color(0xFFEBECF0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ValueListenableBuilder<List<CardModel>>(
                        valueListenable: controller.cardsNotifier,
                        builder: (_, cards, __) => cards.length > 0
                            ? Flexible(
                                child: Scrollbar(
                                    isAlwaysShown: true,
                                    controller: _scrollController,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 12,
                                      ),
                                      child: ListView.builder(
                                          itemCount: cards.length,
                                          shrinkWrap: true,
                                          controller: _scrollController,
                                          itemBuilder: (context, index) =>
                                              Draggable(
                                                data: cards[index],
                                                onDragStarted: () {
                                                  controller.removeCard(index);
                                                },
                                                feedback: CardWidget(
                                                  card: cards[index],
                                                ),
                                                child: CardWidget(
                                                  card: cards[index],
                                                ),
                                                childWhenDragging: Container(),
                                              )),
                                    )),
                              )
                            : Container(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: DragTarget<CardModel>(
                          builder: (context, List<CardModel> candidateData,
                              rejectedData) {
                            return Container(
                              width: 250,
                              height: 50,
                              color: Colors.red,
                            );
                          },
                          onWillAccept: (data) {
                            return true;
                          },
                          onAccept: (data) {
                            controller.addCard(data);
                          },
                        ),
                      ),
                      AddAnotherCardWidget(
                        onChange: (card) {
                          controller.addCard(card);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
