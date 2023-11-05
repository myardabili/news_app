import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/data/models/news_response_model.dart';

class NewsRemoteDatasource {
  Future<Either<String, NewsResponseModel>> getNews() async {
    final response = await http.get(
        Uri.parse('https://newsapi.org/v2/everything?q=headlines&$ApiKeys'));
    if (response.statusCode == 200) {
      return Right(NewsResponseModel.fromJson(response.body));
    } else {
      return const Left('Get News Error');
    }
  }
}
