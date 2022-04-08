import 'package:flutter/material.dart';

import '../models/game.dart';

class BoardCell extends StatelessWidget {
  final GameCell gameCell;
  final void Function() onClick;

  const BoardCell({
    Key? key,
    required this.gameCell,
    required this.onClick,
  }) : super(key: key);

  Color get cellColor {
    if (gameCell.isReadOnly) {
      return Colors.grey;
    }
    if (gameCell.isRepeated) {
      return Colors.redAccent;
    }
    if (gameCell.isSelected) {
      return Colors.blueAccent;
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(color: cellColor),
      child: TextButton(
        onPressed: onClick,
        child: Text(gameCell.number),
      ),
    );
  }
}
