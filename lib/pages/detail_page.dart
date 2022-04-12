import 'package:flutter/material.dart';
import 'package:flutter_travel_app/Widgets/app_large_text.dart';
import 'package:flutter_travel_app/Widgets/app_text.dart';
import 'package:flutter_travel_app/misc/colors.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
                        (index) => Container(
                              margin: const EdgeInsets.only(left: 10),
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(index.toString()),
                            )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
