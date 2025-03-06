//import 'package:car_rental/car_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/car_list_screen.dart';
//import 'package:helloworld/login_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      title: 'Car Rental',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CarListScreen(),
    );
  }
}
