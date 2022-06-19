import 'package:flutter/material.dart';
import 'package:sj_member_app/UI/Pages/bottomNavPages/calculatorPage.dart';
import 'package:sj_member_app/UI/Pages/bottomNavPages/homePage.dart';
import 'package:sj_member_app/UI/Pages/bottomNavPages/profilePage.dart';
import 'package:sj_member_app/UI/UTILS/utils.dart';

class HomeBottomNavView extends StatefulWidget {
  const HomeBottomNavView({Key? key}) : super(key: key);

  @override
  _HomeBottomNavViewState createState() => _HomeBottomNavViewState();
}

class _HomeBottomNavViewState extends State<HomeBottomNavView> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          HomePage(),
          CalculatorPage(),
          ProfilePage(),
        ],
        onPageChanged: onPageChange,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryColor,
        type: BottomNavigationBarType.fixed,
        onTap: itemTapped,
        currentIndex: selectedindex,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Calculator',
            icon: Icon(Icons.language),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.account_circle_outlined),
          ),
        ],
        selectedLabelStyle: TextStyle(color: primaryColor),
        unselectedLabelStyle: TextStyle(color: Color(0x99000000)),
        showSelectedLabels: true,
        unselectedItemColor: Color(0x99000000),
      ),
    );
  }

  PageController pageController = PageController();

  void onPageChange(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  void itemTapped(int selectedIndex) {
    pageController.jumpToPage(selectedIndex);
  }
}
