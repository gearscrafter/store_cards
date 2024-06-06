import 'package:flutter/material.dart';
import 'dart:math';
import 'package:store_cards/src/domain/entities/card_entity.dart';
import 'package:store_cards/src/presentation/blocs/delete_card_bloc.dart';
import 'package:store_cards/injection_container.dart' as di;

import '../../core/utils/form_screen_arguments.dart';
import '../routes/app_routes.dart';
import '../widgets/card_widget.dart';

class DetailsScreen extends StatefulWidget {
  final CardEntity card;
  const DetailsScreen({required this.card, super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with TickerProviderStateMixin {
  late DeleteCardBloc _deleteCardBloc;

  late AnimationController _controller;
  late AnimationController _rotationController;

  late Animation _animation;
  late Animation _rotationAnimation;

  @override
  void initState() {
    final deleteCardUseCase = di.setupDeleteCardDependencyInjection();
    _deleteCardBloc = DeleteCardBloc(deleteCardUseCase);

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
    _rotationAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _rotationController,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _rotationController.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2e363f),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2e363f),
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Row(
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
                              ..rotateY(_rotationAnimation.value * 3 / 2 * pi),
                            child: SizedBox(
                                height: 250 + (animationValue * 120.0),
                                width: 290 + (animationValue * 70.0),
                                child: CardWidget(
                                  card: widget.card,
                                  scale: 1.8,
                                  animationValue: _animation.value,
                                  onPressed: () {
                                    _rotationController.forward();
                                    Future.delayed(
                                        const Duration(milliseconds: 1200), () {
                                      Navigator.pushNamed(
                                        context,
                                        AppRoutes.form,
                                        arguments: FormScreenArguments(
                                          card: widget.card,
                                          isFromDetailsScreen: true,
                                        ),
                                      );
                                    });
                                  },
                                )),
                          );
                        });
                  }),
            ],
          ),
          const Expanded(child: SizedBox.shrink()),
          AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _animation.value,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(26.0),
                        child: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: IconButton(
                              onPressed: () {
                                _deleteCardBloc
                                    .deleteCard(widget.card.id ?? "");
                                Navigator.pushNamedAndRemoveUntil(
                                    context, AppRoutes.home, (route) => false);
                              },
                              icon: const Icon(
                                Icons.delete,
                                size: 60,
                                color: Colors.white,
                              ))),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
