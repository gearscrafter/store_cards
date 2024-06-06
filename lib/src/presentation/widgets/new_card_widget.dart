import 'dart:math';

import 'package:flutter/material.dart';
import '../../domain/entities/card_entity.dart';

class NewCardWidget extends StatelessWidget {
  final double scale;

  final Function()? onPressed;

  const NewCardWidget({super.key, this.onPressed, required this.scale});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200 * scale,
      width: double.infinity,
      child: Card(
          color: Colors.white,
          margin: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Transform.rotate(
                angle: pi / 4,
                child: const Icon(
                  Icons.close,
                  color: Colors.grey,
                  size: 80,
                )),
          )),
    );
  }
}
