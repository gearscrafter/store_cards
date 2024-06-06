import 'dart:async';
import '../../application/usecases/get_cards_usecase.dart';
import '../../domain/entities/card_entity.dart';

class GetCardBloc {
  final GetCardsUseCase _getCardsUseCase;
  final _cardsController = StreamController<List<CardEntity>>();

  Stream<List<CardEntity>> get cards => _cardsController.stream;

  GetCardBloc(this._getCardsUseCase);

  void loadCards() async {
    try {
      final List<CardEntity> cards = await _getCardsUseCase.execute();
      _cardsController.add(cards);
    } catch (e) {
      _cardsController.addError(e);
    }
  }

  void dispose() {
    _cardsController.close();
  }
}
