import 'package:equatable/equatable.dart';
import 'package:pb_app/model/task_model.dart';

class TaskState extends Equatable {
  final List<Task> tasks;

  const TaskState({required this.tasks});

  @override
  List<Object> get props => [tasks];
}

class TaskInitial extends TaskState {
   TaskInitial() : super(tasks: []);
}
