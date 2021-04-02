import 'package:flutter/material.dart';
import 'package:live_animacoes_controladas/draggable/models/board_model.dart';
import 'package:live_animacoes_controladas/draggable/models/card_model.dart';

class DraggableController {
  static DraggableController _instance;

  static get instance {
    if (_instance == null) {
      _instance = DraggableController();
    }
    return _instance;
  }

  final ValueNotifier<List<BoardModel>> boardsNotifier =
      ValueNotifier<List<BoardModel>>(<BoardModel>[
    BoardModel(title: "TODO", cards: [
      CardModel(title: "Iniciar a live"),
      CardModel(title: "Abrir o VSCode"),
      CardModel(title: "Primeira live do Experts Club!"),
    ]),
    BoardModel(title: "DOING", cards: []),
    BoardModel(title: "DONE", cards: []),
  ]);

  List<BoardModel> get boards => boardsNotifier.value;
  set boards(List<BoardModel> boards) => boardsNotifier.value = boards;

  void addBoard(BoardModel board) {
    final actual = boards;
    actual.add(board);
    boards = actual;
  }

  void reorderList(int index) {
    final actual = boards;
    final board = actual[index];
    //REMOVER ELEMENTO DA LISTA
    actual.removeAt(index);
    final indexTarget =
        boards.indexWhere((element) => element.isTarget == true);
    actual[indexTarget] = board;
    boards = List.from(actual);
  }

  void addTarget(int index) {
    final actual = boards;
    if (index <= actual.length) {
      actual.removeWhere((element) => element.isTarget == true);
      actual.insert(index, BoardModel(isTarget: true));
    } else {
      actual.add(BoardModel(isTarget: true));
    }
    boards = List.from(actual);
  }
}
