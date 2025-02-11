import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_tasky/core/theming/app_colors.dart';
import 'package:todo_tasky/core/theming/app_styles.dart';
import 'package:todo_tasky/core/utils/spacing.dart';
import 'package:todo_tasky/features/home/data/models/task_model.dart';
import 'package:todo_tasky/features/home/presentation/views/widgets/task_item_list_view_builder.dart';
import '../../manager/home_cubit.dart';
import 'home_view_app_bar.dart';

class BuildTasksSuccessWidgets extends StatefulWidget {
  const BuildTasksSuccessWidgets({
    super.key,
    required this.tasks,
    required this.onRefresh,
  });

  final List<TaskModel> tasks;
  final Future<void> Function() onRefresh;

  @override
  State<BuildTasksSuccessWidgets> createState() =>
      _BuildTasksSuccessWidgetsState();
}

bool isLoading = false;

class _BuildTasksSuccessWidgetsState extends State<BuildTasksSuccessWidgets> {
  late ScrollController _scrollController;
  int currentPage = 1;
  late HomeCubit homeCubit;

  _scrollListener() async {
    var currentPosition = _scrollController.position.pixels;
    var maxScroll = _scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxScroll) {
      if (!isLoading &&
          homeCubit.state is! NoMoreTasks &&

          // if we need user to continue scrolling and calling it (like when connection restored) after PaginationFailure don't add this PaginationFailure check

          homeCubit.state is! PaginationFailure) {
        isLoading = true;
        currentPage++;
        await homeCubit.getTasks(currentPage);
        isLoading = false;
      }
    }
  }

  @override
  void initState() {
    homeCubit = HomeCubit.get(context);
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: RefreshIndicator(
        color: AppColorsManager.mainPurple,
        onRefresh: widget.onRefresh,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            HomeViewAppBar(),
            SliverToBoxAdapter(
              child: verticalSpacing(30),
            ),
            SliverToBoxAdapter(
              child: Text(
                'My Tasks',
                style: AppTextStyles.font17GreyRegular,
              ),
            ),
            widget.tasks.isEmpty
                ? SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: Center(
                        child: Text(
                          style: AppTextStyles.font14DarkBlueMedium,
                          'You have no tasks yet..!',
                        ),
                      ),
                    ),
                  )
                : TaskItemListViewBuilder(
                    tasksList: widget.tasks,
                  )
          ],
        ),
      ),
    );
  }
}
