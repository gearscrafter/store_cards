import '../entities/card_entity.dart';
import '../repositories/card_repository.dart';

class GetCards {
  final CardRepository repository;

  GetCards(this.repository);

  Future<List<CardEntity>> call() async {
    return await repository.getCards();
  }
}
