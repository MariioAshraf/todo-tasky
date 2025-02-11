import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_tasky/core/routing/routes.dart';
import 'package:todo_tasky/core/utils/extensions.dart';
import 'package:todo_tasky/features/home/presentation/views/widgets/task_item.dart';
import '../task_details_view.dart';
import '../../../data/models/task_model.dart';

class TaskItemListViewBuilder extends StatelessWidget {
  const TaskItemListViewBuilder({super.key, required this.tasksList});

  final List<TaskModel> tasksList;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: EdgeInsets.only(
            top: index == 0 ? 20.h : 0.h,
            bottom: index == tasksList.length - 1 ? 0 : 30.h,
          ),
          child: TextButton(
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              padding: WidgetStateProperty.all(EdgeInsets.zero),
            ),
            onPressed: () {
              context.pushNamed(Routes.taskDetailsView,
                  arguments: tasksList[index]);
            },
            child: TaskItem(
              task: tasksList[index],
            ),
          ),
        ),
        childCount: tasksList.length,
      ),
    );
  }
}
