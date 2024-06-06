import '../../domain/entities/card_entity.dart';
import '../../domain/usecases/get_cards.dart';

class GetCardsUseCase {
  final GetCards getCards;

  GetCardsUseCase(this.getCards);

  Future<List<CardEntity>> execute() async {
    return await getCards();
  }
}
