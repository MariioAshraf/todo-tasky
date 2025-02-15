import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:todo_tasky/core/theming/app_colors.dart';
import 'package:todo_tasky/core/utils/extensions.dart';
import 'package:todo_tasky/core/widgets/build_dialogs.dart';
import '../../../../../core/routing/routes.dart';
import '../manager/home_cubit.dart';

class QRScannerView extends StatefulWidget {
  const QRScannerView({super.key});

  @override
  QRScannerViewState createState() => QRScannerViewState();
}

class QRScannerViewState extends State<QRScannerView> {
  late HomeCubit homeCubit;
  bool isProcessing = false;

  @override
  void initState() {
    homeCubit = HomeCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Scanner')),
      body: BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is GetTaskSuccess) {
            context.pushReplacementNamed(Routes.taskDetailsView,
                arguments: state.task);
          }
          if (state is GetTaskFailure) {
            buildFailureDialog(context, state.errMsg);
          }
        },
        child: Stack(
          children: [
            MobileScanner(
              onDetect: (capture) async {
                if (!isProcessing) {
                  isProcessing = true;
                  final List<Barcode> barcodes = capture.barcodes;

                  if (barcodes.isNotEmpty) {
                    final String? taskId = barcodes.first.rawValue;
                    if (taskId != null) {
                      await homeCubit.getTask(taskId);
                    }
                  }
                  Future.delayed(const Duration(seconds: 2), () {
                    isProcessing = false;
                  });
                }
              },
            ),
            Center(
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColorsManager.mainPurple, width: 3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
