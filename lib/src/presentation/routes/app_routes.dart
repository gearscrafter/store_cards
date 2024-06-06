import 'package:flutter/material.dart';
import 'package:store_cards/src/domain/entities/card_entity.dart';
import 'package:store_cards/src/presentation/screens/details_screen.dart';
import 'package:store_cards/src/presentation/screens/form_screen.dart';
import 'package:store_cards/src/presentation/screens/home_screen.dart';

import '../../core/utils/form_screen_arguments.dart';

class AppRoutes {
  static const String home = '/home';
  static const String details = '/details';
  static const String form = '/form';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case details:
        final args = settings.arguments as CardEntity;
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => DetailsScreen(card: args),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      case form:
        final args = settings.arguments as FormScreenArguments?;
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => FormScreen(
            card: args?.card ??
                CardEntity(title: '', description: '', amount: 0.0),
            isFromDetailsScreen: args?.isFromDetailsScreen ?? false,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}'))));
    }
  }
}
