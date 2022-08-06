import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/fats_laugh/functions/functions.dart';
import 'package:netflix/presentation/widgets/space.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: greyColor.withOpacity(.3),
                  radius: 25,
                  child: const Icon(
                    Icons.volume_down,
                    color: blackColor,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          const AssetImage('assets/images/squidGame.jpg'),
                      backgroundColor: greyColor.withOpacity(.3),
                      radius: 30,
                    ),
                    space(),
                    const VideoActions(icon: Icons.emoji_emotions, name: 'LOL'),
                    const VideoActions(icon: Icons.add, name: 'My List'),
                    const VideoActions(icon: Icons.share, name: 'Share'),
                    const VideoActions(icon: Icons.play_arrow, name: 'Play'),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActions extends StatelessWidget {
  final IconData icon;
  final String name;
  const VideoActions({Key? key, required this.icon, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Icon(
            icon,
            color: whiteColor,
          ),
          space(he: 5),
          Text(
            name,
          )
        ],
      ),
    );
  }
}
