import '../../infraestructure/models/card_model.dart';

final List<CardModel> cards = [
  CardModel(
      id: '0',
      title: 'Sainsbury\'s',
      description: 'Charity Card',
      barcode:
          'https://barcode.tec-it.com/barcode.ashx?data=ABC-abc-1234&code=Code128&translate-esc=on',
      imageUrl: 'https://picsum.photos/200/300',
      color: 'ebc861',
      amount: 2.0),
  CardModel(
      id: '1',
      title: 'Another Shop',
      description: 'Bank Card',
      barcode:
          'https://barcode.tec-it.com/barcode.ashx?data=ABC-abc-1234&code=Code128&translate-esc=on',
      imageUrl: 'https://picsum.photos/200/300',
      color: '4caf50',
      amount: 7.5),
  CardModel(
      id: '2',
      title: 'Coffee Shop',
      description: 'Mocka Card',
      barcode:
          'https://barcode.tec-it.com/barcode.ashx?data=ABC-abc-1234&code=Code128&translate-esc=on',
      imageUrl: 'https://picsum.photos/200/300',
      color: '975e49',
      amount: 12.35),
];
