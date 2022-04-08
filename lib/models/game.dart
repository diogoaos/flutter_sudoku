class Game {
  bool _isToggled = false;

  bool get isToggled => _isToggled;

  final List<int?> selected = [null, null];
  final String initialState = "700602105"
      "000008000"
      "003000620"
      "090000400"
      "070001000"
      "060200300"
      "000000080"
      "024090006"
      "000500790";

  final List<String> currentState = [for (var i = 0; i < 81; i++) "0"];
  final List<Set<int>> currentAnnotations = [for (var i = 0; i < 81; i++) {}];

  void toggle() {
    _isToggled = !_isToggled;
  }

  void numberPressed(String numberPressed) {
    if (selected[0] == null || selected[1] == null) {
      return;
    }

    int r = selected[0]!;
    int c = selected[1]!;

    if (isReadOnly(r, c)) return;

    if (!_isToggled) {
      if (numberPressed == 'X') {
        numberPressed = "0";
      }
      currentState[r * 9 + c] = numberPressed;
    } else {
      if (numberPressed == 'X') {
        currentAnnotations[r * 9 + c].clear();
      } else {
        var num = int.tryParse(numberPressed);
        if (num == null) {
          return;
        }
        if (currentAnnotations[r * 9 + c].contains(num)) {
          currentAnnotations[r * 9 + c].remove(num);
        } else {
          currentAnnotations[r * 9 + c].add(num);
        }
      }
    }
  }

  void cellClick(int row, int col) {
    selected[0] = row;
    selected[1] = col;
  }

  GameCell getCell(int row, int col) {
    return GameCell(
      isSelected: isSelected(row, col),
      number: number(row, col),
      isRepeated: isRepeated(row, col),
      isReadOnly: isReadOnly(row, col),
      annotations: annotations(row, col),
    );
  }

  Set<int> annotations(int row, int col) => currentAnnotations[row * 9 + col];

  bool isSelected(int row, int col) => row == selected[0] && col == selected[1];

  bool isReadOnly(int row, int col) => initialState[row * 9 + col] != '0';

  String number(int row, int col) => initialState[row * 9 + col] != '0'
      ? initialState[row * 9 + col].toString()
      : currentState[row * 9 + col];

  bool isRepeated(int row, int col) {
    if (number(row, col) == "0") return false;

    for (var r = 0; r < 9; r++) {
      for (var c = 0; c < 9; c++) {
        if (r == row && c == col) continue;
        if (number(r, c) != number(row, col)) continue;
        if (r == row || c == col) return true;
        if (square(r, c) == square(row, col)) return true;
      }
    }
    return false;
  }

  int square(int r, int c) => 3 * (r ~/ 3) + (c ~/ 3);

  void restart() {
    for (var i = 0; i < 81; i++) {
      currentState[i] = "0";
    }
  }

  bool get isEnded {
    for (var row = 0; row < 9; row++) {
      for (var col = 0; col < 9; col++) {
        if (number(row, col) == "0" || isRepeated(row, col)) {
          return false;
        }
      }
    }
    return true;
  }

  void moveUp() {
    if (selected[0] != null && selected[0]! > 0) {
      selected[0] = selected[0]! - 1;
    }
  }

  void moveDown() {
    if (selected[0] != null && selected[0]! < 8) {
      selected[0] = selected[0]! + 1;
    }
  }

  void moveLeft() {
    if (selected[1] != null && selected[1]! > 0) {
      selected[1] = selected[1]! - 1;
    }
  }

  void moveRight() {
    if (selected[1] != null && selected[1]! < 8) {
      selected[1] = selected[1]! + 1;
    }
  }
}

class GameCell {
  final bool isSelected;
  final String _number;
  final bool isRepeated;
  final bool isReadOnly;
  final Set<int> _annotations;

  GameCell({
    required this.isSelected,
    required number,
    required this.isRepeated,
    required this.isReadOnly,
    required annotations,
  })  : _number = number,
        _annotations = annotations;

  String get number => _number == "0" ? "" : _number;

  get annotations => _annotations;

  bool get hasAnnotations => _annotations.isNotEmpty;
}
