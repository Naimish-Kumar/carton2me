import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:carton2me/core/app_helper.dart';
import 'package:carton2me/data/model/user_model/user_model.dart';
import 'package:carton2me/data_not_found.dart';
import 'package:carton2me/presentation/screens/add_details_screen.dart';
import 'package:carton2me/presentation/screens/house_connect.dart';
import 'package:carton2me/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 0
          ? AppBar(
              title: Row(
                children: [
                  const Text(
                    'Hello, ',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  Text(
                    AppHelper.firstName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 18),
                  ),
                ],
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.notifications,
                    size: 30,
                  ),
                )
              ],
              bottom: TabBar(
                isScrollable: true,
                controller: _tabController,
                tabAlignment: TabAlignment.start,
                labelStyle:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                tabs: const [
                  Tab(text: 'House Connection'),
                  Tab(text: 'Long Digging'),
                  Tab(text: 'Drilling'),
                  Tab(text: 'HP +'),
                ],
              ))
          : PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(),
            ),
      body: _currentIndex == 0
          ? TabBarView(
              controller: _tabController,
              children: const [
                HouseConnect(),
                DataNotFound(),
                DataNotFound(),
                DataNotFound(),
               
              ],
            )
          : ProfileScreen(
            ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: Colors.white,
        shape: const CircleBorder(eccentricity: 0.5),
        child: const Icon(
          Icons.add,
          color: Colors.red,
          size: 40,
        ),
        onPressed: () {
          showModalBottomSheet(
            elevation: 0,
            isScrollControlled: true,
            context: context,
            builder: (context) => AddDetailsScreen(),
          );
        },
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        height: 60,
        backgroundGradient:
            const LinearGradient(colors: [Colors.red, Colors.pink]),
        iconSize: 40,
        activeColor: Colors.white,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        inactiveColor: Colors.grey,
        icons: const [Icons.home_rounded, Icons.account_circle_rounded],
        activeIndex: _currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => setState(() => _currentIndex = index),
        //other params
      ),
    );
  }
}
