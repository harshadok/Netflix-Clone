import 'package:netflix/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = '$baseKey/trending/movie/week?api_key=$apiKey';

  static const search = '$baseKey/search/movie?api_key=$apiKey';
}
