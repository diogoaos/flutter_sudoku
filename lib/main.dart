import 'package:flutter/material.dart';
import 'package:sudoku/components/annotation_toggle.dart';
import 'package:sudoku/components/board.dart';
import 'package:sudoku/components/file_button_row.dart';

import 'models/game.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Sudoku Flutter")),
        body: const SudokuGame(),
      ),
    );
  }
}

class SudokuGame extends StatefulWidget {
  const SudokuGame({Key? key}) : super(key: key);

  @override
  State<SudokuGame> createState() => _SudokuGameState();
}

class _SudokuGameState extends State<SudokuGame> {
  final Game game = Game();

  void onCellClick(int i, int j) {
    setState(() {
      game.cellClick(i, j);
    });
  }

  void onButtonClick(String buttonPressed) {
    setState(() {
      game.buttonClick(buttonPressed);
    });
  }

  void toggle() {
    setState(() {
      game.toggle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Board(game: game, onCellClick: onCellClick),
        FileButtonRow(onButtonClick: onButtonClick),
        AnnotationToggle(isToggled: game.isToggled, toggle: toggle)
      ],
    );
  }
}
