import 'package:flutter/material.dart';
import 'package:flutter_travel_app/Widgets/app_text.dart';
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
        mainAxisAlignment:isResponsive==true? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
        children: [
          isResponsive==true ? const Padding(
         padding: EdgeInsets.only(left: 30),
         child:  Text("Book Trip Now",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w800),),
       ):const SizedBox(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/arrow.png')
          ),

        ],
      ),
    );
  }
}
