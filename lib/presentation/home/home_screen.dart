import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/home/widgets/main_backround_image.dart';
import 'package:netflix/presentation/home/widgets/number_card.dart';
import 'package:netflix/presentation/widgets/main_card_list.dart';
import 'package:netflix/presentation/widgets/space.dart';
import 'package:netflix/presentation/widgets/title_widget.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.of(context).size;
    return SafeArea(
      child: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (context, value, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: ((notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              } else if (direction == ScrollDirection.idle) {
                scrollNotifier.value = true;
              }
              return true;
            }),
            child: Stack(
              children: [
                ListView(
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    MainBackgroundImage(),
                    ContentAndCards(title: 'Relesed in the past year'),
                    ContentAndCards(title: 'Trending now'),
                    NumberContentCards(title: 'Top 10 Tv Shows In India Today'),
                    ContentAndCards(title: 'Tense Dramas'),
                    ContentAndCards(title: 'South Indian Cinema'),
                  ],
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        curve: Curves.elasticOut,
                        color: blackColor.withOpacity(.7),
                        width: double.infinity,
                        height: mediaSize.width * .25,
                        child: Column(
                          children: [
                            const AppBarSectionOne(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  'Tv Shows',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  'Movies',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  'Categories',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )
                              ],
                            ),
                            space()
                          ],
                        ),
                      )
                    : space(he: 0, wi: 0)
              ],
            ),
          );
        },
      ),
    );
  }
}

class AppBarSectionOne extends StatelessWidget {
  const AppBarSectionOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: 60,
          height: 60,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.cast,
            color: whiteColor,
            size: 30,
          ),
        ),
        space(wi: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            image: const DecorationImage(
                image: AssetImage('assets/images/ntAvatar.png'),
                fit: BoxFit.cover),
          ),
          height: 30,
          width: 30,
        ),
        space()
      ],
    );
  }
}

class ContentAndCards extends StatelessWidget {
  final String title;
  const ContentAndCards({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWidget(
            title: title,
            fsize: 24,
          ),
          LimitedBox(
            maxHeight: 200,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => const MainCardItems()),
          ),
        ],
      ),
    );
  }
}
