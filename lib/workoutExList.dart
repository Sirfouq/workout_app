
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Model/exercise.dart';


class WorkoutExList extends StatefulWidget {
  const WorkoutExList({super.key});

  @override
  State<WorkoutExList> createState() => _WorkoutExListState();
}

Future<String> _loadData() async {
  return await rootBundle.loadString('data/exercises.json');
}



class _WorkoutExListState extends State<WorkoutExList> {
  ExerciseGen exerciseGen = ExerciseGen();

  bool isLoading = true;

  Future loadData() async {
    String jsonString = await _loadData();
    final jsonresponse = json.decode(jsonString);
    exerciseGen = ExerciseGen.fromJson(jsonresponse);
    
    setState (() => isLoading= false);
      
      
    
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

    return ListView.builder(
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
