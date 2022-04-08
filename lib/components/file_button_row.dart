import 'package:flutter/material.dart';

class FileButtonRow extends StatelessWidget {
  final void Function(String) onButtonClick;

  const FileButtonRow({
    Key? key,
    required this.onButtonClick,
  }) : super(key: key);

  Widget createButton(String element) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      child: ElevatedButton(
        onPressed: () => onButtonClick(element),
        child: Text(element),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const numbers = "123456789X";
    final numberButtons = numbers.characters.map(createButton).toList();
    return IntrinsicWidth(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: numberButtons.sublist(0, 5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: numberButtons.sublist(5),
            ),
          ],
        ),
      ),
    );
  }
}
