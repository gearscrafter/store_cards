import 'package:flutter/material.dart';

Color getColorForIndex(int index) {
  final List<Color> colors = [
    const Color(0xffebc861),
    const Color(0xff4caf50),
    const Color(0xff975e49),
    const Color(0xffff9800),
  ];
  return colors[index % colors.length];
}

String getColorHexForIndex(int index) {
  final List<String> colorHex = [
    'ebc861',
    '4caf50',
    '975e49',
    'ff9800',
  ];
  return colorHex[index % colorHex.length];
}
