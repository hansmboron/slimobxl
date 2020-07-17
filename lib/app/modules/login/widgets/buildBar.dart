import 'package:flutter/material.dart';

Widget builbar(int n, String pass) {
  final int level = _calqScore(pass);
  return Expanded(
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: n <= level ? _getColor(level) : Colors.transparent,
        border: n > level ? Border.all(color: Colors.grey) : null,
      ),
    ),
  );
}

int _calqScore(String text) {
  int score = 0;
  if (text.length > 8) {
    score += 1;
  }
  if (text.contains(RegExp(r'[0-9]'))) {
    score += 1;
  }
  if (text.contains(RegExp(r'[A-Z]'))) {
    score += 1;
  }
  return score;
}

Color _getColor(int level) {
  switch (level) {
    case 0:
      return Colors.red;
      break;
    case 1:
      return Colors.orange;
      break;
    case 2:
      return Colors.greenAccent;
      break;
    case 3:
      return Colors.green;
      break;
    default:
      return Colors.red;
  }
}
