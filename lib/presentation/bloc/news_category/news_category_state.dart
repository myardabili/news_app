part of 'news_category_bloc.dart';

sealed class NewsCategoryState {}

final class NewsCategoryInitial extends NewsCategoryState {}

final class NewsCategoryLoading extends NewsCategoryState {}

final class NewsCategoryLoaded extends NewsCategoryState {
  final NewsResponseModel model;

  NewsCategoryLoaded({required this.model});
}

final class NewsCategoryError extends NewsCategoryState {
  final String message;

  NewsCategoryError({required this.message});
}
