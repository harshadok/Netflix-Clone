import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/const.dart';
import 'package:netflix/presentation/new_and_hot/widgets/coming_soon.dart';
import 'package:netflix/presentation/new_and_hot/widgets/everyones_watching.dart';
import 'package:netflix/presentation/widgets/space.dart';

class NewHotScreen extends StatelessWidget {
  const NewHotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.cast,
                  color: whiteColor,
                  size: 30,
                ),
              ),
              Center(
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/ntAvatar.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              space()
            ],
            bottom: TabBar(
              physics: const BouncingScrollPhysics(),
              isScrollable: true,
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 1,
              ),
              labelColor: blackColor,
              unselectedLabelColor: whiteColor,
              indicator: boxDecoration(color: whiteColor, rd: 30),
              tabs: const [
                Tab(text: '🍿 Coming Soon'),
                Tab(text: "👀 Everyone's Watching"),
              ],
            ),
          ),
          body: const TabBarView(children: [
            ComingSoon(),
            EveryonesWatching(),
          ]),
        ),
      ),
    );
  }
}
