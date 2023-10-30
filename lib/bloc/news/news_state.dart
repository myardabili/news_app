part of 'news_bloc.dart';

sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsLoaded extends NewsState {
  final NewsResponseModel model;

  NewsLoaded({required this.model});
}

final class NewsError extends NewsState {
  final String message;

  NewsError({required this.message});
}
