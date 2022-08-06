import 'package:flutter/material.dart';
import 'package:netflix/presentation/downloads/download_screen.dart';
import 'package:netflix/presentation/fats_laugh/fast_laugh_screen.dart';
import 'package:netflix/presentation/home/home_screen.dart';
import 'package:netflix/presentation/new_and_hot/new_and_hot_screen.dart';
import 'package:netflix/presentation/search/search_screen.dart';

class MainPageF {
  ValueNotifier<int> index = ValueNotifier(0);

  final pages = [
    const HomeScreen(),
    const NewHotScreen(),
    const FastLaugh(),
    const SearchScreen(),
    const DownloadScreen()
  ];
}
