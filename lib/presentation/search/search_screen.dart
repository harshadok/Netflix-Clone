import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/saerch/search_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/debouncer/debouncer.dart';
import 'package:netflix/presentation/search/widgets/search_idle.dart';
import 'package:netflix/presentation/search/widgets/search_result.dart';
import 'package:netflix/presentation/widgets/space.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        BlocProvider.of<SearchBloc>(context).add(
          const Initialize(),
        );
      },
    );
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            space(),
            SearchButton(),
            space(),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  return state.searchResultList.isEmpty
                      ? const SearchIdle()
                      : const SearchResultWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchButton extends StatelessWidget {
  SearchButton({
    Key? key,
  }) : super(key: key);

  final _debouncer = Debouncer(milliseconds: 1 * 600);

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      backgroundColor: greyColor.withOpacity(.16),
      suffixIcon: const Icon(
        CupertinoIcons.xmark_circle_fill,
        color: greyColor,
      ),
      prefixIcon: const Icon(
        CupertinoIcons.search,
        color: greyColor,
      ),
      style: const TextStyle(
        color: whiteColor,
      ),
      onChanged: (query) {
        if (query.isEmpty) {
          return;
        }
        _debouncer.run(() {
          BlocProvider.of<SearchBloc>(context).add(
            SearchMovie(movieQuery: query),
          );
        });
      },
    );
  }
}
