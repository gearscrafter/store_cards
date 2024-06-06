import '../../domain/entities/card_entity.dart';

class CardModel extends CardEntity {
  CardModel(
      {required super.id,
      required super.title,
      required super.description,
      required super.barcode,
      required super.imageUrl,
      required super.color,
      required super.amount});

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        barcode: json['barcode'],
        imageUrl: json['imageUrl'],
        color: json['color'],
        amount: json['amount']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'barcode': barcode,
      'imageUrl': imageUrl,
    };
  }
}
