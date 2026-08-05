import 'package:flutter/material.dart';
import 'package:mytodo/bottom_sheet.dart';
import 'package:mytodo/settings.dart';
import 'login_page.dart';
import 'settings.dart';
import 'add_task.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            fontFamily: 'BrandonGrotesque'
        ),
        debugShowCheckedModeBanner: false,
        home:LoginPage(),
    );
  }
}
