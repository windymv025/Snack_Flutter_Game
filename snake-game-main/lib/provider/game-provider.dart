import 'dart:math';

import 'package:flutter/material.dart';

class GameProvider {
  final prizeList = [
    '🍎',
    '🍎',
    '🍎',
    '🍊',
    '🍇',
    '🍒',
    '🍋',
    '🍉',
    '🍊',
    '🍇',
    '🍎',
    '🍒',
    '🍊',
    '🍇',
    '🍒',
  ];
  void showPrize(context, score) {
    var prize = getPrize(score);
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Center(child: Text('Your prize is')),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(prize, style: const TextStyle(fontSize: 50.0)),
                ),
              ],
            ),
            actions: <Widget>[
              Center(
                child: ElevatedButton(
                  child: const Text('Try again'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          );
        });
  }

  getPrize(score) {
    if (score < 5 && prizeList.isNotEmpty && prizeList.contains('🍎')) {
      var index = prizeList.indexOf('🍎');
      prizeList.removeAt(index);
      return '🍎';
    } else if (score < 10 && prizeList.isNotEmpty && prizeList.contains('🍊')) {
      var index = prizeList.indexOf('🍊');
      prizeList.removeAt(index);
      return '🍊';
    } else if (score < 20 && prizeList.isNotEmpty && prizeList.contains('🍋')) {
      var index = prizeList.indexOf('🍋');
      prizeList.removeAt(index);
      return '🍋';
    } else {
      return prizeList[Random().nextInt(prizeList.length)];
    }
  }
}
