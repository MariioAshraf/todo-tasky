import 'package:flutter/material.dart';
import 'package:todo_tasky/features/home/data/models/task_model.dart';
import 'package:todo_tasky/features/home/presentation/views/widgets/task_details_view_body.dart';

class TaskDetailsView extends StatelessWidget {
  const TaskDetailsView({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
      ),
      body: TaskDetailsViewBody(
        task: task,
      ),
    );
  }
}
