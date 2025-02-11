import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_tasky/features/home/presentation/manager/home_cubit.dart';
import 'package:todo_tasky/features/home/presentation/views/widgets/pick_task_image_bottom_sheet.dart';

class EditTaskImage extends StatelessWidget {
  const EditTaskImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pickTaskImageBottomSheet(context);
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => current is ImagePickedSuccess,
        builder: (context, state) {
          if (state is ImagePickedSuccess) {
            return AspectRatio(
              aspectRatio: 2 / 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  color: Colors.red,
                  child: Image.file(
                    fit: BoxFit.cover,
                    File(state.imagePicked.path),
                  ),
                ),
              ),
            );
          }
          return AspectRatio(
            aspectRatio: 2 / 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                color: Colors.red,
                child: Image.file(
                  fit: BoxFit.cover,
                  File(image),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
