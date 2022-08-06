import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/application/saerch/search_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/domain/core/dependencies_injection/injectable.dart';
import 'package:netflix/presentation/main_page/main_page_scree.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<DownloadsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<SearchBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<FastLaughBloc>(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: blackColor),
          scaffoldBackgroundColor: blackColor,
          backgroundColor: blackColor,
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: whiteColor),
            bodyText2: TextStyle(color: whiteColor),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const MainPageScreen(),
      ),
    );
  }
}
