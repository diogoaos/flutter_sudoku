import 'package:flutter/material.dart';
import 'package:sudoku/components/board_cell.dart';

import '../models/game.dart';

class Board extends StatefulWidget {
  final Game game;

  const Board({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  void onCellClick(row, col) {
    setState(() {
      widget.game.cellClick(row, col);
    });
  }

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
      final rowCells = [
        for (var col = 0; col < 9; col++) widget.game.getCell(row, col)
      ];

      boardRows.add(row % 3 == 0 ? thickDivider : thinDivider);
      boardRows.add(BoardRow(cells: rowCells, row: row, onSelect: onCellClick));
    }
    boardRows.add(thickDivider);

    return IntrinsicWidth(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: boardRows,
        ),
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
      width: 2,
      thickness: 1,
      color: Colors.black,
    );
    const thinDivider = VerticalDivider(
      width: 0.1,
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
      height: 36,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: boardCells,
      ),
    );
  }
}
