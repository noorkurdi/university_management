import 'package:flutter/material.dart';

class SubjectInfoRow extends StatelessWidget {
  const SubjectInfoRow({super.key, required this.info, required this.title});
  final String title;
  final String info;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            info,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
