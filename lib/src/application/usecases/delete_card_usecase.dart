import '../../domain/usecases/delete_card.dart';

class DeleteCardUseCase {
  final DeleteCard deleteCard;

  DeleteCardUseCase(this.deleteCard);

  Future<void> execute(String cardId) async {
    return await deleteCard(cardId);
  }
}
