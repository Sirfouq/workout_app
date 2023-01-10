import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Model/exercise.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainList(),
    );
  }
}

class MainList extends StatefulWidget {
  const MainList({super.key});

  @override
  State<MainList> createState() => _MainListState();
}

Future<String> _loadData() async {
  return await rootBundle.loadString('data/exercises.json');
}

class _MainListState extends State<MainList> {
  ExerciseGen exerciseGen = ExerciseGen();

  bool isLoading = true;

  Future loadData() async {
    String jsonString = await _loadData();
    final jsonresponse = json.decode(jsonString);
    exerciseGen = ExerciseGen.fromJson(jsonresponse);
    
    setState(() {
      
      isLoading = false;
    });
    //print('${exerciseGen.exercise![0].level} ${exerciseGen.exercise![78].instructions}');
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Container(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(top: 20),
        shrinkWrap: false,
        itemCount: exerciseGen.exercise?.length,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            child: Text('$index'),
          ),
          subtitle: Text('${exerciseGen.exercise?[index].name}'),
        ),
      ),
    );

    // return ListView.builder(
    //     shrinkWrap: true,
    //     itemCount: exerciseGen.exercise?.length.compareTo(0),
    //     itemBuilder: ((context, index) {
    //       return Card(
    //         child: ListTile(
    //             title: Text('$index'),
    //             subtitle: Text('${exerciseGen.exercise?[index].name}')),
    //       );
    //     }));
  }
}
