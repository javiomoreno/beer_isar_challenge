import 'package:flutter/material.dart';

class LinkIconWidget extends StatelessWidget {
  final Function() onPress;
  final IconData icon;
  final String text;
  const LinkIconWidget(
      {super.key,
      required this.onPress,
      required this.icon,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 5.0),
          Text(
            text,
            style: const TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
