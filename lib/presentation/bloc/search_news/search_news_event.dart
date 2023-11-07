part of 'search_news_bloc.dart';

sealed class SearchNewsEvent {}

class GetSearchNewsEvent extends SearchNewsEvent {
  final String query;

  GetSearchNewsEvent({required this.query});
}
