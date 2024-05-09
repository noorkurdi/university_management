import 'package:flutter/Material.dart';

class CustomTableTitle extends StatelessWidget {
  const CustomTableTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          softWrap: true,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
