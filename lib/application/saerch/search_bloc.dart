import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failures.dart';
import 'package:netflix/domain/downloads/download_service.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:netflix/domain/search/models/search_resp/search_resp.dart';
import 'package:netflix/domain/search/models/search_service.dart';
part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchService _serchService;
  final DownloadService _downloadService;
  SearchBloc(this._serchService, this._downloadService)
      : super(SearchState.initial()) {
    /* idle State */
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(
          state.copyWith(
            searchResultList: [],
            idleList: state.idleList,
            isLoading: false,
            isError: false,
          ),
        );
        return;
      }

      emit(
        state.copyWith(
          searchResultList: [],
          idleList: [],
          isLoading: true,
          isError: false,
        ),
      );
      //get trending

      // show to ui

      final _dData = await _downloadService.getDownloadsImages();
      log(_dData.toString());

      final data = _dData.fold(
        (MainFailures failure) {
          return state.copyWith(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true,
          );
        },
        (List<Downloads> download) {
          return state.copyWith(
            searchResultList: [],
            idleList: download,
            isLoading: false,
            isError: false,
          );
        },
      );

      emit(data);
    });
/* search result state */
    on<SearchMovie>((event, emit) async {
      emit(
        state.copyWith(
          searchResultList: [],
          idleList: [],
          isLoading: true,
          isError: false,
        ),
      );
      // call search api
      final result =
          await _serchService.searchMovies(movieQuery: event.movieQuery);

      // show to api

      final data = result.fold(
        (MainFailures failure) {
          return state.copyWith(
            searchResultList: [],
            idleList: [],
            isLoading: true,
            isError: false,
          );
        },
        (SearchResp respones) {
          return state.copyWith(
            searchResultList: respones.results,
            idleList: [],
            isLoading: false,
            isError: false,
          );
        },
      );

      emit(data);
    });
  }
}
