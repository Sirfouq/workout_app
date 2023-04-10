// main.dart
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:workout_app/util/horizontal_menu.dart';
import 'util/credit_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController(viewportFraction: 0.8, initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
          leading: Builder(
        builder: (context) => IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Icon(Icons.menu)),
      )),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 25),
            SizedBox(
              height: 250, // Adjust this value according to your needs.
              child: HorizontalMenu(
                controller: controller,
                items: [
                  CreditCard(
                      balance: 08.45,
                      date: '04/28',
                      number: '*****8914',
                      user: 'Georgios Kokkinos'),
                  CreditCard(
                      balance: 1444.45,
                      date: '04/28',
                      number: '*****9120',
                      user: 'Georgios Kokkinos'),
                  CreditCard(
                      balance: 123.45,
                      date: '04/28',
                      number: '*****7734',
                      user: 'Georgios Kokkinos'),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
