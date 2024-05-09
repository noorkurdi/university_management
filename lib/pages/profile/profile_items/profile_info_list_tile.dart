import 'package:flutter/material.dart';

class ProfileInfoListTile extends StatelessWidget {
  const ProfileInfoListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
  });
  final String title, subTitle;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile(
        leading: icon,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          subTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}
