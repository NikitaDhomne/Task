import 'package:bynry_task/Screens/dashboard_screen.dart';
import 'package:bynry_task/Screens/history_screen.dart';
import 'package:bynry_task/Screens/support_screen.dart';
import 'package:bynry_task/Screens/usage_screen.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  static const routeName = './dashboard';
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> _pages = [];

  @override
  void initState() {
    _pages = [
      {
        'page': DashboardScreen(),
      },
      {
        'page': UsageScreen(),
      },
      {
        'page': HistoryScreen(),
      },
      {
        'page': SupportScreen(),
      },
    ];
    super.initState();
  }

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: 'Dashboard'),
            BottomNavigationBarItem(
                icon: Icon(Icons.data_usage), label: 'Usage'),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: 'History'),
            BottomNavigationBarItem(
                icon: Icon(Icons.support), label: 'Support'),
          ],
          currentIndex: _selectedIndex,
          backgroundColor: const Color(0xffffffff),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red,
          unselectedItemColor: const Color(0xff939393),
          onTap: onTapped,
        ));
  }
}
