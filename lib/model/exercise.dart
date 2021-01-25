

class Plan {
  String planName;
  DateTime starDate;
  DateTime endDate;
  List<Exercise> exercises;

  Plan(this.planName, this.starDate, this.endDate, this.exercises);

}

class Exercise {
  int set;
  double weight;
  int rep;
  String exerciseName;

  Exercise(this.set, this.weight, this.rep, this.exerciseName);
}