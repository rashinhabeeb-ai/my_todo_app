import 'package:flutter/material.dart';
import 'package:mytodo/calender.dart';
import 'package:mytodo/home.dart';
import 'package:mytodo/settings.dart';

class BottomSheetPage extends StatefulWidget {
  const BottomSheetPage({super.key});

  @override
  State<BottomSheetPage> createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  int selectIndex = 0;
  List pages = [
    Home(),
    CalendarScreen(),
    Settings()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[selectIndex],
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (value){
            selectIndex = value;
            setState(() {
      
            });
          },
          currentIndex: selectIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),
            label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined),
            label: 'Calender'),
            BottomNavigationBarItem(icon: Icon(Icons.settings),
            label: 'Settings'),
          ],
        )
      ),
    );
  }
}
