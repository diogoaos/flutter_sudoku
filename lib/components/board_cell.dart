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
    final button = TextButton(
      onPressed: onClick,
      child: Text(
        gameCell.number,
        style: TextStyle(color: numberColor, fontWeight: FontWeight.bold),
      ),
    );

    Widget cellChild = button;
    if (gameCell.number == "" && gameCell.hasAnnotations) {
      cellChild = Stack(
        children: [
          AnnotationGrid(annotations: gameCell.annotations),
          button,
        ],
      );
    }

    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(color: cellColor),
      child: cellChild,
    );
  }
}

class AnnotationGrid extends StatelessWidget {
  final Set<int> annotations;

  const AnnotationGrid({Key? key, required this.annotations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < 3; i++)
          Row(
            children: [
              for (int j = 0; j < 3; j++)
                if (annotations.contains(i * 3 + j + 1))
                  Container(
                      height: 12,
                      width: 12,
                      child: FittedBox(child: Text("${i * 3 + j + 1}")))
                else
                  Container(
                      height: 12, width: 12, child: FittedBox(child: Text("")))
            ],
          )
      ],
    );
  }
}
