import 'package:flutter/material.dart';

class ButtomWidget extends StatelessWidget {
  final Function() onPress;
  final String text;
  const ButtomWidget({super.key, required this.onPress, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        width: MediaQuery.of(context).size.width * .5,
        decoration: const BoxDecoration(color: Colors.blue),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
