import 'package:flutter/material.dart';
//import 'package:my_app/organization/homepage.dart';
import 'package:my_app/admin/adminDashboard.dart';
import 'package:my_app/donor/donorHomePage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elbi Donation System',
      home: DonorHomepage(title: "Organizations"),
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
