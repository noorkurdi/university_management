import 'package:flutter/material.dart';
import 'package:university_management/core/utils/app_constants.dart';

class ShowPasswordIcon extends StatelessWidget {
  const ShowPasswordIcon({
    super.key,
    required this.onPressed,
    required this.isVisible,
  });

  final void Function()? onPressed;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        isVisible ? Icons.visibility_off : Icons.remove_red_eye,
        color: AppColors.yelloWpuColor.withOpacity(.9),
      ),
    );
  }
}
