import 'package:carton2me/presentation/screens/add_details_screen.dart';
import 'package:carton2me/presentation/screens/home_screen.dart';
import 'package:carton2me/presentation/screens/show_details_screen.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  
  int _currentIndex = 0;
  final item1Controller = TextEditingController();
  final item2Controller = TextEditingController();
  final item3Controller = TextEditingController();
  final item4Controller = TextEditingController();
  final item5Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        flexibleSpace: Container(
            height: 90,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.red,
                Colors.pink,
              ]),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 40, left: 30),
              child: Text(
                'Home Screen',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )),
      ),
      body: _currentIndex == 0
          ?  const HomeScreen()
          : _currentIndex == 1
              ? AddDetailsScreen(item1Controller: item1Controller)
              : const ShowDetailsScreen(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          selectedItemColor: Colors.red,
          selectedLabelStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          unselectedLabelStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.book,
                size: 30,
              ),
              label: 'Show Details',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_rounded,
                size: 30,
              ),
              label: 'Profile',
            ),
          ]),
    );
    
  }
  
}
