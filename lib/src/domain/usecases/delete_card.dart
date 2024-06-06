import '../repositories/card_repository.dart';

class DeleteCard {
  final CardRepository repository;

  DeleteCard(this.repository);

  Future<void> call(String cardId) async {
    return await repository.deleteCard(cardId);
  }
}
