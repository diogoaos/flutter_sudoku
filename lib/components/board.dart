import 'package:flutter/material.dart';
import 'package:sudoku/components/board_cell.dart';

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

    for (var row = 0; row < 9; row++) {
      boardRows.add(row % 3 == 0 ? thickDivider : thinDivider);

      var boardRow = BoardRow(
        cells: [for (var col = 0; col < 9; col++) game.getCell(row, col)],
        row: row,
        onSelect: onCellClick,
      );

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
  final int row;
  final void Function(int, int) onSelect;

  void select(int col) {
    onSelect(row, col);
  }

  const BoardRow({
    Key? key,
    required this.cells,
    required this.row,
    required this.onSelect,
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
      boardCells.add(BoardCell(gameCell: cells[i], onClick: () => select(i)));
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
