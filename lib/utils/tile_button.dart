import 'package:flutter/material.dart';

class TileButton extends StatelessWidget {
  const TileButton({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color:
                color == Colors.deepPurple ? Colors.white : Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}
