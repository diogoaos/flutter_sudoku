import 'package:flutter/material.dart';

class AnnotationToggle extends StatelessWidget {
  final bool isToggled;
  final void Function() toggle;

  const AnnotationToggle({
    Key? key,
    required this.isToggled,
    required this.toggle,
  }) : super(key: key);

  ButtonStyle buttonStyle(bool toggled) {
    if (toggled) {
      return ElevatedButton.styleFrom(
        primary: Colors.black,
        onPrimary: Colors.white,
      );
    } else {
      return ElevatedButton.styleFrom(
        primary: Colors.grey,
        onPrimary: Colors.black,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: buttonStyle(!isToggled),
          onPressed: toggle,
          child: Text("Normal"),
        ),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
          style: buttonStyle(isToggled),
          onPressed: toggle,
          child: Text("Annotation"),
        ),
      ],
    );
  }
}
