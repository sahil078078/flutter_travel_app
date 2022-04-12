import 'package:flutter/material.dart';
import 'package:flutter_travel_app/Widgets/app_large_text.dart';
import 'package:flutter_travel_app/Widgets/app_text.dart';
import 'package:flutter_travel_app/misc/colors.dart';

import '../Widgets/app_buttons.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              width: double.maxFinite,
              height: 350,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/iceland.jpg'),
                      fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                  const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 320,
            child: Container(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              height: 500,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AppLargeText(
                          text: 'Roshan', color: Colors.black.withOpacity(0.5)),
                      AppLargeText(
                        text: "\$250",
                        color: AppColors.mainColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.location_on,
                        color: AppColors.mainColor,
                      ),
                      const SizedBox(width: 10),
                      AppText(
                        text: "USA ,California ",
                        color: AppColors.mainTextColor,
                        size: 19,
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            color: index <= 3
                                ? AppColors.starColor
                                : Colors.grey.withOpacity(0.5),
                          );
                        }),
                      ),
                      const SizedBox(width: 15),
                      AppText(text: "(4.9)", color: AppColors.textColor2),
                    ],
                  ),
                  const SizedBox(height: 25),
                  AppLargeText(
                    text: "People",
                    size: 22,
                    color: Colors.black.withOpacity(0.8),
                  ),
                  AppText(
                    text: "Number of people in your group",
                    color: AppColors.mainTextColor,
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    children: List.generate(
                      5,
                      (index) => InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: AppButtons(
                            color: selectedIndex == index
                                ? const Color(0xff5c6898)
                                : const Color(0xff095761),
                            backgroundColor: selectedIndex == index
                                ? const Color(0xffaee4fe)
                                : const Color(0xfffee5e1),
                            size: 50,
                            borderColor: selectedIndex == index
                                ? Colors.blueAccent.shade100
                                : Colors.grey,
                            isShadow: selectedIndex == index ? true : false,
                            text: (index + 1).toString(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  AppLargeText(
                    text: "Description",
                    color: Colors.black.withOpacity(0.5),
                    size: 25,
                  ),
                  const SizedBox(height: 8),
                  AppText(
                    text:
                        'to go from one place to another, as by car, train, plane, or ship; take a trip; journey: to travel for pleasure. to move or go from one place or point to another. to proceed or advance in any way',
                    color: AppColors.mainTextColor,
                  ),
                  Row(
                    children: <Widget>[],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 10,
            child: Row(
              children: <Widget>[
                AppButtons(
                  color: const Color(0xffaee4fe),
                  backgroundColor: const Color(0xfffee5e1),
                  size: 60,
                  borderColor: AppColors.textColor2,
                  isIcon: true,
                  icon: Icons.favorite,
                  isShadow: false,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
