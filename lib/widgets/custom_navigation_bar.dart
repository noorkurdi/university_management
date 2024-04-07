import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/core/utils/media_query_values.dart';
import 'package:university_management/provider/navigation_bar_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
    required this.provider,
  });
  final NavigationBarProvider provider;
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: AppColors.blueWpuColor,
      backgroundColor: Colors.transparent,
      height: kBottomNavigationBarHeight,
      index: provider.currentHomeIndex,
      animationDuration: const Duration(milliseconds: 400),
      onTap: (value) {
        if (value == provider.currentHomeIndex) {
          return;
        }
        provider.pageChange(value);
      },
      items: const [
        Icon(
          Icons.person,
          color: Colors.white,
        ),
        Icon(
          Icons.list_alt_rounded,
          color: Colors.white,
        ),
        Icon(
          Icons.date_range_outlined,
          color: Colors.white,
        ),
        Icon(
          Icons.home,
          color: Colors.white,
        ),
      ],
    );
  }
}

class BottomNavCurvePainter extends CustomPainter {
  BottomNavCurvePainter({
    this.backgroundColor = Colors.white,
    this.insetRadius = 38,
  });

  Color backgroundColor;
  double insetRadius;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 12);

    double insetCurveBeginnningX = size.width / 2 - insetRadius;
    double insetCurveEndX = size.width / 2 + insetRadius;
    double transitionToInsetCurveWidth = size.width * .05;
    path.quadraticBezierTo(size.width * 0.20, 0,
        insetCurveBeginnningX - transitionToInsetCurveWidth, 0);
    path.quadraticBezierTo(
        insetCurveBeginnningX, 0, insetCurveBeginnningX, insetRadius / 2);

    path.arcToPoint(Offset(insetCurveEndX, insetRadius / 2),
        radius: const Radius.circular(10.0), clockwise: false);

    path.quadraticBezierTo(
        insetCurveEndX, 0, insetCurveEndX + transitionToInsetCurveWidth, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 12);
    path.lineTo(size.width, size.height + 56);
    path.lineTo(
        0,
        size.height +
            56); //+56 here extends the navbar below app bar to include extra space on some screens (iphone 11)
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed,
      this.selectedColor = const Color(0xffFF8527),
      this.defaultColor = Colors.black54})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final Color defaultColor;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? selectedColor : defaultColor,
          ),
        ),
      ],
    );
  }
}
