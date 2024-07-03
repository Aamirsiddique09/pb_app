import 'package:equatable/equatable.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TaskEvent {
  final String title;

  const AddTask(this.title);

  @override
  List<Object> get props => [title];
}

class ToggleTaskStatus extends TaskEvent {
  final int index;

  const ToggleTaskStatus(this.index);

  @override
  List<Object> get props => [index];
}

class RemoveTask extends TaskEvent {
  final int index;

  const RemoveTask(this.index);

  @override
  List<Object> get props => [index];
}
