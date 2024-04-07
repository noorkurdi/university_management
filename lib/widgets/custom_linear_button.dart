import 'package:flutter/material.dart';
import 'package:university_management/core/utils/media_query_values.dart';


class CustomLinearButton extends StatelessWidget {
  final List<Color> colors;
  final Widget child;
  final void Function()? onTap;
  const CustomLinearButton({
    super.key,
    required this.onTap,
    required this.child,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            gradient: LinearGradient(
              colors: colors,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
