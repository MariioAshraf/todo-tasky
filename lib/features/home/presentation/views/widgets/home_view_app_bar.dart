import 'package:flutter/material.dart';
import '../../../../../core/theming/app_colors.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: 10.0,
      title: Text(
        'Logo',
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: <Widget>[
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.account_circle_outlined,
              color: Colors.black,
              size: 30,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.logout,
              color: AppColorsManager.mainPurple,
            )),
      ],
    );
  }
}
