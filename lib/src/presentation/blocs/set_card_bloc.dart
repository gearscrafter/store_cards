import 'dart:async';
import '../../application/usecases/set_card_usecase.dart';
import '../../domain/entities/card_entity.dart';

class SetCardBloc {
  final SetCardUseCase _setCardUseCase;

  SetCardBloc(this._setCardUseCase);

  void setCard(CardEntity card) async {
    await _setCardUseCase.execute(card);
  }
}
