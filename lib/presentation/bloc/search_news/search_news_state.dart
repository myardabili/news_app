part of 'search_news_bloc.dart';

sealed class SearchNewsState {}

final class SearchNewsInitial extends SearchNewsState {}

final class SearchNewsLoading extends SearchNewsState {}

final class SearchNewsLoaded extends SearchNewsState {
  final NewsResponseModel model;

  SearchNewsLoaded({required this.model});
}

final class SearchNewsError extends SearchNewsState {
  final String message;

  SearchNewsError({required this.message});
}
