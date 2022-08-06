import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_failures.freezed.dart';

@freezed
class MainFailures with _$MainFailures {
  const factory MainFailures.clientFailures() = _ClientFailures;
  const factory MainFailures.serverFailures() = _ServerFailures;
}
