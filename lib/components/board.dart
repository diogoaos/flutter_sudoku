import 'package:flutter/material.dart';

import '../models/game.dart';

class Board extends StatelessWidget {
  final Game game;
  final void Function(int, int) onCellClick;

  const Board({
    Key? key,
    required this.game,
    required this.onCellClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const thickDivider = Divider(
      height: 0,
      thickness: 1,
      color: Colors.black,
    );
    const thinDivider = Divider(
      height: 0,
      thickness: 0.5,
      color: Colors.black,
    );
    List<Widget> boardRows = [];

    var boardRow = BoardRow(cells: [
      for (var i = 0; i < 9; i++)
        GameCell(
          isSelected: false,
          number: "1",
          isRepeated: true,
        )
    ]);

    for (var i = 0; i < 9; i++) {
      boardRows.add(i % 3 == 0 ? thickDivider : thinDivider);
      boardRows.add(boardRow);
    }
    boardRows.add(thickDivider);

    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: boardRows,
      ),
    );
  }
}

class BoardRow extends StatelessWidget {
  final List<GameCell> cells;

  const BoardRow({
    Key? key,
    required this.cells,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const thickDivider = VerticalDivider(
      thickness: 1,
      color: Colors.black,
    );
    const thinDivider = VerticalDivider(
      thickness: 0.5,
      color: Colors.black,
    );
    List<Widget> boardCells = [];

    for (var i = 0; i < cells.length; i++) {
      boardCells.add(i % 3 == 0 ? thickDivider : thinDivider);
      boardCells.add(const SizedBox(width: 10));
    }
    boardCells.add(thickDivider);

    return Container(
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: boardCells,
      ),
    );
  }
}
