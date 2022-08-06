part of 'downloads_bloc.dart';

@freezed
class DownloadState with _$DownloadState {
  const factory DownloadState({
    required bool isLoading,
    required List<Downloads> downloads,
    required Option<Either<MainFailures, List<Downloads>>> downloadOrFailure,
  }) = _DownloadState;

  factory DownloadState.initial() {
    return const DownloadState(
      isLoading: false,
      downloadOrFailure: None(),
      downloads: [],
    );
  }
}
