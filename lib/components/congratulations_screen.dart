import 'package:flutter/material.dart';

class CongratulationScreen extends StatelessWidget {
  final void Function() restartPressed;

  const CongratulationScreen({Key? key, required this.restartPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Congratulations, you won!"),
          TextButton(
            onPressed: restartPressed,
            child: const Text("Restart game?"),
          )
        ],
      ),
    );
  }
}
