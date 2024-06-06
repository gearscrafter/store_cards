import 'package:flutter/material.dart';

class DotsWidget extends StatelessWidget {
  final bool isCurrentDot;
  const DotsWidget({this.isCurrentDot = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCurrentDot ? Colors.orange : const Color(0xff545f6c),
      ),
    );
  }
}
