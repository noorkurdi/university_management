
import 'package:flutter/material.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/core/utils/media_query_values.dart';

class BackGroundProfileImage extends StatelessWidget {
  const BackGroundProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height,
      width: context.width,
      child: Image.asset(
        AppAssets.profileBackGroundPic,
        fit: BoxFit.fill,
      ),
    );
  }
}
