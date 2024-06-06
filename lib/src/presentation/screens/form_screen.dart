import 'dart:math';

import 'package:flutter/material.dart';
import 'package:store_cards/src/core/utils/form_colors.dart';
import 'package:store_cards/src/presentation/blocs/add_card_bloc.dart';
import 'package:store_cards/src/presentation/blocs/set_card_bloc.dart';
import 'package:store_cards/src/presentation/widgets/form_widget.dart';
import 'package:store_cards/injection_container.dart' as di;

import '../../domain/entities/card_entity.dart';
import '../routes/app_routes.dart';

class FormScreen extends StatefulWidget {
  final CardEntity? card;
  final bool? isFromDetailsScreen;
  const FormScreen({this.card, this.isFromDetailsScreen, super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> with TickerProviderStateMixin {
  late SetCardBloc _setCardBloc;
  late AddCardBloc _addCardBloc;

  late AnimationController _controller;
  late AnimationController _rotationController;

  late Animation _animation;
  late Animation _rotationAnimation;

  @override
  void initState() {
    super.initState();
    final setCardUseCase = di.setupSetCardDependencyInjection();
    final addCardUseCase = di.setupAddCardDependencyInjection();

    _setCardBloc = SetCardBloc(setCardUseCase);
    _addCardBloc = AddCardBloc(addCardUseCase);

    _controller = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );

    _rotationController = AnimationController(
        duration: const Duration(milliseconds: 1200), vsync: this);
    _rotationAnimation =
        Tween<double>(begin: (1 / 2) * pi, end: 2 * pi).animate(
      CurvedAnimation(
        parent: _rotationController,
        curve: Curves.easeInOut,
      ),
    );

    _rotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.forward();
      }
    });

    _rotationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2e363f),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2e363f),
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.home, (route) => false);
          },
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                double animationValue = _animation.value.toDouble();
                return AnimatedBuilder(
                    animation: _rotationController,
                    builder: (context, child) {
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..rotateY(_rotationAnimation.value),
                        child: SizedBox(
                            height: 370 + (animationValue * 300),
                            width: 360 + (animationValue * 10.0),
                            child: FormWidget(
                              card: widget.card,
                              animation: animationValue,
                              onPressed: (String title, String description,
                                  double amount, int colorIndex) {
                                if (widget.isFromDetailsScreen ?? false) {
                                  _setCardBloc.setCard(CardEntity(
                                      id: widget.card?.id ?? '-1',
                                      title: title,
                                      description: description,
                                      imageUrl: 'https://picsum.photos/200/300',
                                      barcode:
                                          'https://barcode.tec-it.com/barcode.ashx?data=ABC-abc-1234&code=Code128&translate-esc=on',
                                      color: getColorHexForIndex(colorIndex),
                                      amount: amount));
                                } else {
                                  _addCardBloc.addCard(CardEntity(
                                      title: title,
                                      description: description,
                                      imageUrl: 'https://picsum.photos/200/300',
                                      barcode:
                                          'https://barcode.tec-it.com/barcode.ashx?data=ABC-abc-1234&code=Code128&translate-esc=on',
                                      color: getColorHexForIndex(colorIndex),
                                      amount: amount));
                                }

                                Navigator.pushNamedAndRemoveUntil(context,
                                    AppRoutes.home, (route) => route.isFirst);
                              },
                            )),
                      );
                    });
              })
        ],
      ),
    );
  }
}
