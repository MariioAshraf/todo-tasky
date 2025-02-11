import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_tasky/core/utils/extensions.dart';
import '../../../../../core/widgets/build_dialogs.dart';
import '../../manager/home_cubit.dart';

class CreateTaskBlocListener extends StatelessWidget {
  const CreateTaskBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is CreateTaskSuccess) {
            context.pop();
            context.pop();
            HomeCubit.get(context).getTasks(1);
          }
          if (state is CreateTaskFailure) {
            buildFailureDialog(context, state.errMsg);
          }
          if (state is CreateTaskLoading) {
            buildLoadingDialog(context);
          }
        },
        child: const SizedBox.shrink());
  }
}
