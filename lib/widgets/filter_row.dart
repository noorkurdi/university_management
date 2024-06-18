import 'package:flutter/material.dart';

class FilterRow extends StatelessWidget {
  const FilterRow({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.filter_list,
                color: Colors.black,
              ),
            ),
            const Text(
              "حسب السنة",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
