import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_tasky/core/utils/extensions.dart';
import 'package:todo_tasky/core/widgets/build_dialogs.dart';
import '../../manager/home_cubit.dart';

class EditTaskBlocListener extends StatelessWidget {
  const EditTaskBlocListener({super.key, required this.taskId});

  final String taskId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      child: SizedBox.shrink(),
      listener: (context, state) {
        if (state is EditTaskLoading) {
          buildLoadingDialog(context);
        }
        if (state is EditTaskSuccess) {
          context.pop();
          context.pop();
        }
        if (state is EditTaskFailure) {
          context.pop();
          buildFailureDialog(context, state.errMsg);
        }
      },
    );
  }
}
