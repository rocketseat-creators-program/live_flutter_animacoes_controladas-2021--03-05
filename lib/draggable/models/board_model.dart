import 'package:live_animacoes_controladas/draggable/models/card_model.dart';

class BoardModel {
  final String title;
  final List<CardModel> cards;
  final bool isTarget;
  BoardModel({
    this.title,
    this.cards = const <CardModel>[],
    this.isTarget = false,
  });
}
