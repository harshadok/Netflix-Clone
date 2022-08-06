// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

ValueNotifier<int> index = ValueNotifier(0);

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: index,
      builder: (context, int newValue, _) {
        return BottomNavigationBar(
          currentIndex: newValue,
          onTap: (newIndex) {
            index.value = newIndex;
            index.notifyListeners();
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: blackColor.withOpacity(.7),
          selectedItemColor: whiteColor,
          unselectedItemColor: greyColor,
          selectedIconTheme: const IconThemeData(color: whiteColor),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.collections), label: 'New & Hot'),
            BottomNavigationBarItem(
                icon: Icon(Icons.emoji_emotions), label: 'FastLaughs'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.downloading), label: 'Downloads'),
          ],
        );
      },
    );
  }
}
