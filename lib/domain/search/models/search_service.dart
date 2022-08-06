import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failures/main_failures.dart';
import 'package:netflix/domain/search/models/search_resp/search_resp.dart';

abstract class SearchService {
  Future<Either<MainFailures, SearchResp>> searchMovies({
    required String movieQuery,
  });
}
