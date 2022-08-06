import 'package:netflix/infrastructure/api_key.dart';

//create your on api by TMDB database
class ApiEndPoints {
  static const downloads = '$baseKey/trending/movie/week?api_key=$apiKey';

  static const search = '$baseKey/search/movie?api_key=$apiKey';
}
