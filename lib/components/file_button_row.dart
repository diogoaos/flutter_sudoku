import 'package:flutter/material.dart';

class FileButtonRow extends StatelessWidget {
  final void Function(String) onButtonClick;

  const FileButtonRow({
    Key? key,
    required this.onButtonClick,
  }) : super(key: key);

  ElevatedButton createButton(String element) {
    return ElevatedButton(
      onPressed: () => onButtonClick(element),
      child: Text(element),
    );
  }

  @override
  Widget build(BuildContext context) {
    const numbers = "123456789X";
    final numberButtons = numbers.characters.map(createButton).toList();
    return Container(
      margin: EdgeInsets.all(10),
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
    );
  }
}
