class ExerciseGen{

List<Exercise>? exercise;

ExerciseGen({this.exercise});

factory ExerciseGen.fromJson(Map<String,dynamic>json){
  var list = json['exercises'] as List;
  List<Exercise> exercise_list = list.map((exercise) => Exercise.fromJson(exercise)).toList(growable: true);
  return ExerciseGen(
    exercise: exercise_list
  );
}


}

class Exercise {
  String? name;
  String? force;
  String? level;
  String? mechanic;
  String? equipment;
  List<dynamic>? primaryMuscles;
  List<dynamic>? secondaryMuscles;
  List<dynamic>? instructions;
  String? category;

  Exercise(
      {this.name,
      this.force,
      this.level,
      this.mechanic,
      this.equipment,
      this.primaryMuscles,
      this.secondaryMuscles,
      this.instructions,
      this.category});

     factory Exercise.fromJson(Map<String,dynamic> json){
        return Exercise(
        name:json['name'],
        force:json['force'],
        level:json['level'],
        mechanic: json['mechanic'],
        equipment: json['equipment'],
        primaryMuscles: json['primaryMuscles'],
        secondaryMuscles: json['secondaryMuscles'],
        instructions: json['instructions'],
        category: json['category']

      );
    }
}