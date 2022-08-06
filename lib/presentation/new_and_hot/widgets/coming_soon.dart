import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/images/images.dart';
import 'package:netflix/presentation/widgets/space.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index) => const ComingSoonWidgetDemo(),
    );
  }
}

class ComingSoonWidgetDemo extends StatelessWidget {
  const ComingSoonWidgetDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            child: Column(
              children: const [
                Text(
                  'FEB',
                  style: TextStyle(
                    color: greyColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '11',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage(squidgame),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: CircleAvatar(
                        backgroundColor: blackColor.withOpacity(.5),
                        radius: 20,
                        child: const Icon(
                          Icons.volume_down,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
                space(),
                Row(
                  children: [
                    const FittedBox(
                      child: Text(
                        'Squid Game',
                        style: TextStyle(
                            fontSize: 35,
                            letterSpacing: -2,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        const Icon(Icons.notifications_none_outlined,
                            color: whiteColor),
                        space(he: 5),
                        const Text('Remind me'),
                      ],
                    ),
                    space(),
                    Column(
                      children: [
                        const Icon(Icons.info_outline, color: whiteColor),
                        space(he: 5),
                        const Text('Info'),
                      ],
                    ),
                    space()
                  ],
                ),
                space(),
                const Text(
                  'Coming on Friday',
                ),
                space(),
                Row(
                  children: [
                    Stack(
                      children: [
                        const SizedBox(
                          width: 150,
                        ),
                        Image.asset(
                          'assets/images/logo.png',
                          width: 25,
                          height: 25,
                        ),
                        const Positioned(
                          bottom: 5,
                          left: 18,
                          child: Text(
                            'FILM',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                space(he: 5),
                const Text(
                  'Squid Game',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                space(),
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    'Landing the lead in the school musical is a dream come truee for Jodi untill the pressure sends her confidence - and her relation ship into a tailspin',
                    style: TextStyle(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
