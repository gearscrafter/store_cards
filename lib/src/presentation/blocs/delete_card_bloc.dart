import '../../application/usecases/delete_card_usecase.dart';

class DeleteCardBloc {
  final DeleteCardUseCase _deleteCardUseCase;

  DeleteCardBloc(this._deleteCardUseCase);

  void deleteCard(String cardId) async {
    try {
      await _deleteCardUseCase.execute(cardId);
    } catch (_) {}
  }
}
