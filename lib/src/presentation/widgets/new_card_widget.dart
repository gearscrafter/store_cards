import 'dart:math';

import 'package:flutter/material.dart';

class NewCardWidget extends StatelessWidget {
  final double scale;

  final Function()? onPressed;

  const NewCardWidget({super.key, this.onPressed, required this.scale});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100 * scale,
      width: 300,
      child: Card(
          color: const Color(0xffff9800),
          margin: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: const Center(
            child: Text(
              'Agrega una tarjeta',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          )),
    );
  }
}
