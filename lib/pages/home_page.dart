import 'package:flutter/material.dart';
import 'package:flutter_travel_app/Widgets/app_large_text.dart';
import 'package:flutter_travel_app/Widgets/app_text.dart';
import 'package:flutter_travel_app/misc/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<String> tabBarImage = [
    "mountain.jpg",
    "river1.jpg",
    "river2.jpg",
    "arora.jpg",
    "iceland.jpg",
  ];

  Map<String, String> imageForIcon = {
    "Balloning": "balloon.jpg",
    "Hiking": "hiking.png",
    "Kayaking": "kayaking.jpg",
    "Snorkeling": "snorkeling.jpg",
    "Paragliding": "paragliding.png",
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // menu text
              Container(
                margin: const EdgeInsets.only(top: 70, left: 20),
                child: Row(
                  children: <Widget>[
                    const Icon(Icons.menu),
                    const Expanded(child: SizedBox()),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // discover text
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: AppLargeText(text: "Discover"),
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelColor: Colors.black,
                  controller: _tabController,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: _CircleTabIndicator(
                      color: AppColors.mainColor, radius: 4),
                  tabs: const [
                    Tab(
                      text: "Places",
                    ),
                    Tab(
                      text: "Inspiration",
                    ),
                    Tab(
                      text: "Emotions",
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                height: 300,
                width: double.maxFinite,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      itemCount: tabBarImage.length, // 3 pela hataa
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(right: 15, top: 10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/${tabBarImage[index]}'),
                                fit: BoxFit.cover),
                          ),
                        );
                      },
                    ),
                    const Text('There'),
                    const Text('Bye'),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    AppLargeText(text: "Explore More", size: 22.0),
                    AppText(
                      text: "See All",
                      color: AppColors.textColor2,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.maxFinite,
                height: 120,
                margin: const EdgeInsets.only(left: 20),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageForIcon.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 30),
                        child: Column(
                          children: [
                            Container(
                              // margin: const EdgeInsets.only(right: 30),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/${imageForIcon.values.elementAt(index)}'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: AppText(
                                text: imageForIcon.keys
                                    .elementAt(index)
                                    .toString(),
                                color: AppColors.textColor2,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CircleTabIndicator extends Decoration {
  Color color;
  double radius;

  _CircleTabIndicator({required this.radius, required this.color});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(radius: radius, color: color);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.radius, required this.color});

  @override
  void paint(
    Canvas canvas,
    Offset offset,
    ImageConfiguration configuration,
  ) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
