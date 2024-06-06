import 'package:store_cards/src/domain/usecases/add_card.dart';

import '../../domain/entities/card_entity.dart';

class AddCardUseCase {
  final AddCard addCard;

  AddCardUseCase(this.addCard);

  Future<void> execute(CardEntity card) async {
    return await addCard(card);
  }
}
