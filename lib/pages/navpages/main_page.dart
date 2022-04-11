import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel_app/pages/navpages/bar_item_page.dart';
import 'package:flutter_travel_app/pages/navpages/home_page.dart';
import 'package:flutter_travel_app/pages/navpages/my_page.dart';
import 'package:flutter_travel_app/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const HomePage(),
    const BarItemPage(),
    const SearchPage(),
    const MyPage(),
  ];
  int currentIndex = 0;

  void onTap(int index) {
    print(index);
    setState(() {
      currentIndex = index;
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        /*
        onTap: (index){
          print(index);
          setState(() {
            currentIndex=index;
          });
        },
        */

        // below method is same as above but here pass the function
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.green[400],
        currentIndex: currentIndex,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0.0,
        unselectedFontSize: 0.0,
        selectedFontSize: 0.0,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_sharp), label: "Bar"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "My"),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
