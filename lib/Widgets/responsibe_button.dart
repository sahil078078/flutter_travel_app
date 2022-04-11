import 'package:flutter/material.dart';
import 'package:flutter_travel_app/misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  double? width;
  bool isResponsive;

  ResponsiveButton({Key? key, this.width, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [],
      ),
    );
  }
}
