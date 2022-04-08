class Game {
  bool _isToggled = false;

  bool get isToggled => _isToggled;

  final List<int?> selected = [null, null];

  void toggle() {
    _isToggled = !_isToggled;
  }

  void buttonClick(String buttonPressed) {}

  void cellClick(int row, int col) {
    selected[0] = row;
    selected[1] = col;
  }

  getCell(int row, int col) {}
}

class GameCell {
  final bool isSelected;
  final String number;
  final bool isRepeated;
  final bool isReadOnly;

  GameCell({
    required this.isSelected,
    required this.number,
    required this.isRepeated,
    required this.isReadOnly,
  });
}
