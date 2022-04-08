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
    if (gameCell.isSelected) {
      return Colors.blueAccent;
    }
    if (gameCell.isRepeated) {
      return Colors.redAccent;
    }
    return Colors.white;
  }

  Color get numberColor {
    if ((gameCell.isReadOnly || gameCell.isSelected) && gameCell.isRepeated) {
      return Colors.red;
    }

    if (gameCell.isReadOnly && gameCell.isSelected) {
      return Colors.blue;
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(color: cellColor),
      child: TextButton(
        onPressed: onClick,
        child: Text(
          gameCell.number,
          style: TextStyle(color: numberColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
