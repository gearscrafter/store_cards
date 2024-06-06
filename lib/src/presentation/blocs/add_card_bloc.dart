import 'dart:async';
import 'package:store_cards/src/application/usecases/add_card_usecase.dart';

import '../../domain/entities/card_entity.dart';

class AddCardBloc {
  final AddCardUseCase _addCardUseCase;
  final _cardsController = StreamController<List<CardEntity>>();

  Stream<List<CardEntity>> get cards => _cardsController.stream;

  AddCardBloc(this._addCardUseCase);

  void addCard(CardEntity card) async {
    try {
      await _addCardUseCase.execute(card);
    } catch (e) {
      _cardsController.addError(e);
    }
  }

  void dispose() {
    _cardsController.close();
  }
}
