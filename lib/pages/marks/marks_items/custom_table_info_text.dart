import 'package:flutter/material.dart';

class CustomTableInfoText extends StatelessWidget {
  const CustomTableInfoText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
          softWrap: true,
        ),
      ),
    );
  }
}
