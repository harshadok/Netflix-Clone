import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

//box decoration

BoxDecoration boxDecorationImage(
    {double rd = 0, Color color = blackColor, required String image}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(rd),
    image: DecorationImage(
      image: AssetImage(image),
      fit: BoxFit.cover,
    ),
  );
}

BoxDecoration boxDecoration({double rd = 0, Color color = transParentColor}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(rd),
  );
}

// image url

const imageUppendUrl = 'https://image.tmdb.org/t/p/w500';
