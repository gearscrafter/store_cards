import 'package:store_cards/src/domain/entities/card_entity.dart';

import '../repositories/card_repository.dart';

class SetCard {
  final CardRepository repository;

  SetCard(this.repository);

  Future<void> call(CardEntity card) async {
    return await repository.setCard(card);
  }
}
