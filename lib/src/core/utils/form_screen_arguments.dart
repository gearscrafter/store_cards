import '../../domain/entities/card_entity.dart';

class FormScreenArguments {
  final CardEntity? card;
  final bool isFromDetailsScreen;

  FormScreenArguments({
    required this.card,
    required this.isFromDetailsScreen,
  });
}
