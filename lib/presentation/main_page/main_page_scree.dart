import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/main_page/functions/functions.dart';
import 'package:netflix/presentation/main_page/widgets/bottom_navigation.dart';

class MainPageScreen extends StatelessWidget {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: ValueListenableBuilder(
          valueListenable: index,
          builder: (context, int value, _) {
            return MainPageF().pages[value];
          }),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
