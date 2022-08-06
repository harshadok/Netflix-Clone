import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/widgets/space.dart';

class AppBarWidgets extends StatelessWidget {
  final String name;
  const AppBarWidgets({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        space(),
        Text(
          name,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
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
