import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Model/exercise.dart';
import 'package:draggable_home/draggable_home.dart';

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
  Future loadData() async {
    String jsonString = await _loadData();
    final jsonresponse = json.decode(jsonString);
    exerciseGen = ExerciseGen.fromJson(jsonresponse);
    //print('${exerciseGen.exercise![0].level} ${exerciseGen.exercise![78].instructions}');
  }

  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
        return DraggableHome(
          body:[ ListView.builder(
            padding: EdgeInsets.only(top: 0),
            shrinkWrap: true,
            itemCount: exerciseGen.exercise?.length,
            itemBuilder: (context, index) => ListTile(
              leading: const CircleAvatar(),
              title: Text('$index'),
              subtitle:Text('${exerciseGen.exercise?[index].name}') ,
            ),
          )],
          headerWidget: const Text('data'),
          title: const Text('data'),
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
