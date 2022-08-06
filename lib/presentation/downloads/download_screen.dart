import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/const.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';
import 'package:netflix/presentation/widgets/space.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidgets(
            name: 'Downloads',
          ),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            space(he: 4),
            const _SmartDownloads(),
            const SectionTwo(),
            const SectionThree(),
          ],
        ),
      ),
    );
  }
}

class SectionThree extends StatelessWidget {
  const SectionThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            color: blueColor,
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Set up',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: whiteColor),
              ),
            ),
          ),
        ),
        space(),
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: whiteColor,
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Text(
              'See what you can download',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: blackColor),
            ),
          ),
        ),
      ],
    );
  }
}

class SectionTwo extends StatelessWidget {
  const SectionTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        BlocProvider.of<DownloadsBloc>(context).add(
          const DownloadsEvent.getDownloadsImage(),
        );
      },
    );
    final Size mediaSize = MediaQuery.of(context).size;
    return Column(
      children: [
        space(he: 20),
        const Center(
          child: Text(
            'Introducing Downloads for you',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Text(
            'Well download a personalized selection of movies and shows for you, so there is always somthing to watch on your device',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: greyColor,
            ),
          ),
        ),
        BlocBuilder<DownloadsBloc, DownloadState>(
          builder: (context, states) {
            return SizedBox(
              width: mediaSize.width,
              height: mediaSize.width,
              child: states.isLoading == true
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: whiteColor,
                      ),
                    )
                  : states.downloads.isEmpty
                      ? const CircularProgressIndicator(
                          color: whiteColor,
                        )
                      : Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: greyColor.withOpacity(.25),
                              radius: mediaSize.width * .33,
                            ),
                            DownloadsImageWidget(
                              isLoading: states.isLoading,
                              size: Size(
                                  mediaSize.width * .32, mediaSize.width * .44),
                              image:
                                  '$imageUppendUrl${states.downloads[2].posterPath}',
                              angle: 20,
                              margin: const EdgeInsets.only(left: 150, top: 20),
                            ),
                            DownloadsImageWidget(
                              isLoading: states.isLoading,
                              size: Size(
                                  mediaSize.width * .32, mediaSize.width * .44),
                              image:
                                  '$imageUppendUrl${states.downloads[1].posterPath}',
                              angle: -20,
                              margin:
                                  const EdgeInsets.only(right: 150, top: 20),
                            ),
                            DownloadsImageWidget(
                              size: Size(
                                  mediaSize.width * .36, mediaSize.width * .49),
                              image:
                                  '$imageUppendUrl${states.downloads[0].posterPath}',
                              margin: const EdgeInsets.only(left: 0),
                              isLoading: states.isLoading,
                            )
                          ],
                        ),
            );
          },
        ),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        space(),
        const Icon(
          Icons.settings,
          color: whiteColor,
        ),
        space(wi: 10),
        const Text(
          'Smart Downloads',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget(
      {Key? key,
      required this.size,
      required this.image,
      this.angle = 0,
      required this.isLoading,
      required this.margin})
      : super(key: key);
  final String image;
  final Size size;
  final double angle;
  final EdgeInsets margin;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            color: isLoading == false ? greyColor : transParentColor,
            borderRadius: BorderRadius.circular(8),
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
