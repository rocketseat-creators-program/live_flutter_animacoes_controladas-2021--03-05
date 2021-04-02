import 'package:flutter/foundation.dart';
import 'package:live_animacoes_controladas/draggable/models/board_model.dart';
import 'package:live_animacoes_controladas/draggable/models/card_model.dart';

class BoardController {
  final ValueNotifier<List<CardModel>> cardsNotifier =
      ValueNotifier<List<CardModel>>(<CardModel>[]);

  List<CardModel> get cards => cardsNotifier.value;
  set cards(List<CardModel> cards) => cardsNotifier.value = cards;

  final BoardModel board;

  BoardController({
    this.board,
  }) {
    cards = this.board.cards;
  }

  void addCard(CardModel card) {
    final actual = cards;
    actual.add(card);
    cards = List.from(actual);
  }

  void removeCard(int index) {
    final actual = cards;
    actual.removeAt(index);
    cards = List.from(actual);
  }

  void reorderList(ondIndex, newIndex) {
    final actual = cards;
    if (newIndex > ondIndex) {
      newIndex -= 1;
    }
    final items = actual.removeAt(ondIndex);
    actual.insert(newIndex, items);
    cards = List.from(actual);
  }
}
