class CardModel {
  final String title;

  CardModel({
    this.title,
  });

  CardModel copyWith({
    String title,
  }) {
    return CardModel(
      title: title ?? this.title,
    );
  }
}
