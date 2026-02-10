class Tasks {
  String task;
  bool isDone;

  Tasks({required this.task, this.isDone = false});
}

// or
/**
class Tasks {
  String task;
  bool isDone = false;

  Tasks(this.task, this.isDone);
}
 */
