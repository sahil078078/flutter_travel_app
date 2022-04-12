import 'package:flutter/material.dart';
import 'package:flutter_travel_app/Widgets/app_text.dart';

import '../misc/colors.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  String? text;
  IconData? icon;
  bool? isIcon;
  bool? isShadow;

  AppButtons(
      {Key? key,
      this.isIcon = false,
      this.isShadow = false,
      this.text = 'A',
      this.icon,
      required this.color,
      required this.backgroundColor,
      required this.size,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2.5),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          isShadow == true
              ? BoxShadow(
                  offset: const Offset(0.0, 5),
                  blurRadius: 6,
                  color: Colors.grey.shade600)
              : const BoxShadow(),
        ],
      ),
      child: isIcon == true
          ? Center(
              child: Icon(
                icon,
                color: color,
              ),
            )
          : Center(child: AppText(text: text.toString(), color: color)),
    );
  }
}
