import 'package:flutter/material.dart';
import 'package:netflix/core/const.dart';

const image = 'assets/images/stranger.jpeg';

class MainCardItems extends StatelessWidget {
  const MainCardItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
      width: 130,
      height: 200,
      decoration: boxDecorationImage(
        rd: 10,
        image: image,
      ),
    );
  }
}
