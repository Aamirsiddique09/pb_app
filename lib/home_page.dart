import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pb_app/bloc/task_bloc.dart';
import 'package:pb_app/bloc/task_event.dart';
import 'package:pb_app/bloc/task_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        backgroundColor: Colors.teal,
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (context, index) {
              final task = state.tasks[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Card(
                  elevation: 4.0,
                  child: ListTile(
                    title: Text(
                      task.title,
                      style: TextStyle(
                        decoration: task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                        fontSize: 18.0,
                      ),
                    ),
                    leading: Checkbox(
                      value: task.isCompleted,
                      onChanged: (value) {
                        context.read<TaskBloc>().add(ToggleTaskStatus(index));
                      },
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        context.read<TaskBloc>().add(RemoveTask(index));
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Add Task'),
              content: TextField(
                controller: controller,
                decoration: const InputDecoration(labelText: 'Task Title'),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Add'),
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      context.read<TaskBloc>().add(AddTask(controller.text));
                      controller.clear();
                      Navigator.of(context).pop(); // Close the dialog
                    }
                  },
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
