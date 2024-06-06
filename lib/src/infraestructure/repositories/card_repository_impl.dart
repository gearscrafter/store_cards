import '../../domain/entities/card_entity.dart';
import '../../domain/repositories/card_repository.dart';
import '../datasources/card_remote_datasource.dart';
import '../models/card_model.dart';

class CardRepositoryImpl implements CardRepository {
  final CardRemoteDataSource remoteDataSource;

  CardRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<CardEntity>> getCards() async {
    final List<CardModel> cardModels = await remoteDataSource.getCards();
    return cardModels;
  }

  @override
  Future<void> addCard(CardEntity card) async {
    final cardModel = CardModel(
      id: card.id,
      title: card.title,
      description: card.description,
      color: card.color,
      imageUrl: card.imageUrl,
      barcode: card.barcode,
      amount: card.amount,
    );
    await remoteDataSource.addCard(cardModel);
  }

  @override
  Future<void> setCard(CardEntity card) async {
    final cardModels = CardModel(
      id: card.id,
      title: card.title,
      description: card.description,
      barcode: card.barcode,
      imageUrl: card.imageUrl,
      color: card.color,
      amount: card.amount,
    );
    await remoteDataSource.setCard(cardModels);
  }

  @override
  Future<void> deleteCard(String cardId) async {
    await remoteDataSource.deleteCard(cardId);
  }
}
