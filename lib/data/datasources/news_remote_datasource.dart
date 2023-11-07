import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/data/models/news_response_model.dart';

class NewsRemoteDatasource {
  Future<Either<String, NewsResponseModel>> getNews() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=f53d2d6a50fa4bfc99d56f00a09f1757'));
    if (response.statusCode == 200) {
      return Right(NewsResponseModel.fromJson(response.body));
    } else {
      return const Left('Get News Error');
    }
  }

  Future<Either<String, NewsResponseModel>> getNewsCategory(
      String category) async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=f53d2d6a50fa4bfc99d56f00a09f1757'));
    if (response.statusCode == 200) {
      return Right(NewsResponseModel.fromJson(response.body));
    } else {
      return const Left('Get News Error');
    }
  }

  Future<Either<String, NewsResponseModel>> searchNews(String query) async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=$query&apiKey=f53d2d6a50fa4bfc99d56f00a09f1757'));
    if (response.statusCode == 200) {
      return Right(NewsResponseModel.fromJson(response.body));
    } else {
      return const Left('Get News Error');
    }
  }
}
