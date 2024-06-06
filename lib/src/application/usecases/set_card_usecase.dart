import '../../domain/entities/card_entity.dart';
import '../../domain/usecases/set_card.dart';

class SetCardUseCase {
  final SetCard setCard;

  SetCardUseCase(this.setCard);

  Future<void> execute(CardEntity card) async {
    return await setCard(card);
  }
}
