import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failures.dart';
import 'package:netflix/domain/downloads/download_service.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final _videoUrls = [
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"
      "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4"
];

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  final DownloadService _downloadService;
  FastLaughBloc(this._downloadService) : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      //sending loading to ui

      emit(const FastLaughState(
        videos: [],
        isLoading: true,
        isError: false,
      ));

      //get trending moivies
      final result = await _downloadService.getDownloadsImages();

      final data = result.fold((MainFailures failure) {
        state.copyWith(
          videos: [],
          isLoading: false,
          isError: true,
        );
      }, (List<Downloads> download) {
        state.copyWith(
          videos: download,
          isLoading: false,
          isError: false,
        );
      });

      // send to ui

      emit(data);
    });
  }
}
