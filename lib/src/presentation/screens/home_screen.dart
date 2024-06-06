import 'dart:math';

import 'package:flutter/material.dart';
import 'package:store_cards/src/domain/entities/card_entity.dart';
import 'package:store_cards/src/presentation/widgets/card_widget.dart';
import 'package:store_cards/src/presentation/widgets/dots_widget.dart';
import 'package:store_cards/src/presentation/widgets/new_card_widget.dart';

import '../blocs/get_card_bloc.dart';
import 'package:store_cards/injection_container.dart' as di;

import '../routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GetCardBloc _cardBloc;
  late PageController _pageController;

  double _currentIndex = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
    final getCardsUseCase = di.setupGetCardDependencyInjection();
    _cardBloc = GetCardBloc(getCardsUseCase);
    _cardBloc.loadCards();
  }

  @override
  void dispose() {
    _cardBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: const Color(0xFF2e363f),
        appBar: AppBar(
          backgroundColor: const Color(0xFF2e363f),
          centerTitle: true,
          title: const Text(
            'Store Cards',
            style: TextStyle(
                color: Color(0xffcb7854), fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
        ),
        body: StreamBuilder<List<CardEntity>>(
            stream: _cardBloc.cards,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    SizedBox(
                      height: 250,
                      child: NotificationListener<ScrollNotification>(
                        onNotification: (ScrollNotification notification) {
                          if (notification is ScrollUpdateNotification) {
                            setState(() {
                              _currentIndex = _pageController.page ?? 0.0;
                            });
                          }
                          return true;
                        },
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: snapshot.data!.length + 1,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final scale = max(0.7,
                                (1.0 - (index - _currentIndex).abs()) + 0.8);
                            if (index == snapshot.data!.length) {
                              return AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.form,
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: NewCardWidget(scale: scale),
                                  ),
                                ),
                              );
                            } else {
                              return AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.details,
                                      arguments: snapshot.data![index],
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CardWidget(
                                        card: snapshot.data![index],
                                        scale: scale),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          snapshot.data!.length,
                          (index) {
                            return DotsWidget(
                                isCurrentDot: index == _currentIndex.round());
                          },
                        ),
                      ),
                    )
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
