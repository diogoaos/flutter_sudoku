import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sudoku/components/annotation_toggle.dart';
import 'package:sudoku/components/board.dart';
import 'package:sudoku/components/congratulations_screen.dart';
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
      game.numberPressed(buttonPressed);
    });
  }

  void toggle() {
    setState(() {
      game.toggle();
    });
  }

  void restart() {
    setState(() {
      game.restart();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (game.isEnded) {
      return RawKeyboardListener(
        onKey: eventRestart,
        autofocus: true,
        focusNode: FocusNode(),
        child: CongratulationScreen(restartPressed: restart),
      );
    } else {
      return RawKeyboardListener(
        onKey: eventBoard,
        autofocus: true,
        focusNode: FocusNode(),
        child: Column(
          children: [
            Board(game: game, onCellClick: onCellClick),
            FileButtonRow(onButtonClick: onButtonClick),
            AnnotationToggle(isToggled: game.isToggled, toggle: toggle)
          ],
        ),
      );
    }
  }

  void eventRestart(RawKeyEvent event) {
    if (event.isKeyPressed(LogicalKeyboardKey.enter) ||
        event.isKeyPressed(LogicalKeyboardKey.space)) {
      restart();
    }
  }

  void eventBoard(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      final operator = {
        LogicalKeyboardKey.arrowUp: game.moveUp,
        LogicalKeyboardKey.arrowDown: game.moveDown,
        LogicalKeyboardKey.arrowLeft: game.moveLeft,
        LogicalKeyboardKey.arrowRight: game.moveRight,
      };

      final command = operator[event.logicalKey];
      if (command != null) {
        setState(() {
          command();
        });
        return;
      }

      final numbers = "123456789Xx";
      if (numbers.characters.contains(event.character ?? "Z")) {
        onButtonClick(event.character!.toUpperCase());
        return;
      }
    }
  }
}
