import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pb_app/bloc/task_event.dart';
import 'package:pb_app/bloc/task_state.dart';
import 'package:pb_app/model/task_model.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super( TaskInitial()) {
    on<AddTask>((event, emit) {
      final newTasks = List<Task>.from(state.tasks)..add(Task(title: event.title));
      emit(TaskState(tasks: newTasks));
    });

    on<ToggleTaskStatus>((event, emit) {
      final newTasks = List<Task>.from(state.tasks);
      final task = newTasks[event.index];
      task.isCompleted = !task.isCompleted;
      emit(TaskState(tasks: newTasks));
    });

    on<RemoveTask>((event, emit) {
      final newTasks = List<Task>.from(state.tasks)..removeAt(event.index);
      emit(TaskState(tasks: newTasks));
    });
  }
}
