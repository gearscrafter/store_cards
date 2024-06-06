import '../../core/mocks/card_list.dart';
import '../models/card_model.dart';

abstract class CardRemoteDataSource {
  Future<List<CardModel>> getCards();
  Future<void> addCard(CardModel card);
  Future<void> setCard(CardModel card);
  Future<void> deleteCard(String cardId);
}

class CardRemoteDataSourceImpl implements CardRemoteDataSource {
  @override
  Future<void> addCard(CardModel card) async {
    final int lastId = int.parse(cards.last.id ?? '-1');
    card.id = (lastId + 1).toString();
    cards.add(card);
  }

  @override
  Future<void> setCard(CardModel card) async {
    final index = cards.indexWhere((element) => element.id == card.id);

    if (index != -1) {
      cards[index] = card;
    }
  }

  @override
  Future<void> deleteCard(String cardId) async {
    final index = cards.indexWhere((element) => element.id == cardId);
    if (index != -1) {
      cards.removeAt(index);
    }
  }

  @override
  Future<List<CardModel>> getCards() async {
    return cards;
  }
}
