import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_tasky/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:todo_tasky/features/home/data/models/task_model.dart';
import 'package:todo_tasky/features/home/presentation/manager/home_cubit.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/widgets/build_dialogs.dart';
import 'build_tasks_success_widgets.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

late HomeCubit homeCubit;

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    final loginCubit = LoginCubit.get(context);
    homeCubit = HomeCubit.get(context);
    await loginCubit.getUserId();
    await homeCubit.getTasks(1);
  }

  Map<String, TaskModel> allTasks = {};

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is GetTasksSuccess ||
          current is GetTasksFailure ||
          current is EditTaskSuccess ||
          current is GetTasksLoading,
      listener: (context, state) {
        if (state is GetTasksFailure) {
          buildFailureDialog(context, state.errMsg);
        }
        if (state is EditTaskSuccess) {
          allTasks[state.task.id] = state.task;
        }
        if (state is GetTasksSuccess) {
          state.tasks.map((task) {
            if (!allTasks.containsKey(task.id)) allTasks[task.id] = task;
          }).toList();
        }
      },
      builder: (context, state) {
        if (state is GetTasksSuccess ||
            state is PaginationLoading ||
            state is EditTaskSuccess) {
          return allTasks.isEmpty
              ? Center(
                  child: Text(
                    'No tasks yet',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                )
              : BuildTasksSuccessWidgets(
                  tasks: allTasks.values.toList(),
                  onRefresh: () async {
                    await homeCubit.getTasks(1);
                  },
                );
        }
        if (state is GetTasksLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColorsManager.mainPurple,
            ),
          );
        }

        // called when GetTasksFailure state is emitted, with listener to show dialog
        // we can wrap this with refresh to call it on pull to refresh also

        return RefreshIndicator(
          onRefresh: () async => homeCubit.getTasks(1),
          child: SingleChildScrollView(
            child: Container(
              color: Colors.red,
              width: double.infinity,
              height: 1000, // Ensure it's scrollable
            ),
          ),
        );
      },
    );
  }
}
