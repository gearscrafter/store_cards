class CardEntity {
  String? id;
  final String title;
  final String description;
  final String? barcode;
  final String? imageUrl;
  final String? color;
  final double amount;

  CardEntity({
    this.id,
    required this.title,
    required this.description,
    this.barcode,
    this.imageUrl,
    this.color,
    required this.amount,
  });
}
