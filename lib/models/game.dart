class Game {
  bool _isToggled = false;

  bool get isToggled => _isToggled;

  void toggle() {
    _isToggled = !_isToggled;
  }

  void buttonClick(String buttonPressed) {}

  void cellClick(int i, int j) {}
}

class GameCell {
  final bool isSelected;
  final String number;
  final bool isRepeated;

  GameCell({
    required this.isSelected,
    required this.number,
    required this.isRepeated,
  });
}
