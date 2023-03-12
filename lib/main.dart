// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'workoutExList.dart';
import 'util/credit_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  
  const HomePage({super.key, required this.title});
  
  @override
  State<HomePage> createState() => _HomePageState();

}  
  
  class _HomePageState extends State<HomePage>{
    final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 25),
            SizedBox(
              height: 200,
              child: PageView(
                controller: _controller,
                clipBehavior:Clip.hardEdge,
                children: [
                CreditCard(),
                CreditCard(),
                CreditCard()
                ],
                
                
              ),
            ),
            SizedBox(height: 10,),
            SmoothPageIndicator(controller: _controller, count: 3)
            
          ],
        ),
      ),
    );
  }
}

