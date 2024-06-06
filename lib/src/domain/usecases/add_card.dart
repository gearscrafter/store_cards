import '../entities/card_entity.dart';
import '../repositories/card_repository.dart';

class AddCard {
  final CardRepository repository;

  AddCard(this.repository);

  Future<void> call(CardEntity card) async {
    return await repository.addCard(card);
  }
}
