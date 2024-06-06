import 'package:store_cards/src/application/usecases/delete_card_usecase.dart';
import 'package:store_cards/src/domain/usecases/add_card.dart';
import 'package:store_cards/src/domain/usecases/set_card.dart';

import 'src/application/usecases/add_card_usecase.dart';
import 'src/application/usecases/get_cards_usecase.dart';
import 'src/application/usecases/set_card_usecase.dart';
import 'src/domain/usecases/delete_card.dart';
import 'src/domain/usecases/get_cards.dart';
import 'src/infraestructure/datasources/card_remote_datasource.dart';
import 'src/infraestructure/repositories/card_repository_impl.dart';

GetCardsUseCase setupGetCardDependencyInjection() {
  final cardRemoteDataSource = CardRemoteDataSourceImpl();
  final cardRepository = CardRepositoryImpl(cardRemoteDataSource);
  final getCards = GetCards(cardRepository);
  return GetCardsUseCase(getCards);
}

SetCardUseCase setupSetCardDependencyInjection() {
  final cardRemoteDataSource = CardRemoteDataSourceImpl();
  final cardRepository = CardRepositoryImpl(cardRemoteDataSource);
  final setCard = SetCard(cardRepository);
  return SetCardUseCase(setCard);
}

AddCardUseCase setupAddCardDependencyInjection() {
  final cardRemoteDataSource = CardRemoteDataSourceImpl();
  final cardRepository = CardRepositoryImpl(cardRemoteDataSource);
  final setCard = AddCard(cardRepository);
  return AddCardUseCase(setCard);
}

DeleteCardUseCase setupDeleteCardDependencyInjection() {
  final cardRemoteDataSource = CardRemoteDataSourceImpl();
  final cardRepository = CardRepositoryImpl(cardRemoteDataSource);
  final deleteCard = DeleteCard(cardRepository);
  return DeleteCardUseCase(deleteCard);
}

void setupDependencyInjection() {
  setupGetCardDependencyInjection();
  setupSetCardDependencyInjection();
  setupAddCardDependencyInjection();
  setupDeleteCardDependencyInjection();
}
