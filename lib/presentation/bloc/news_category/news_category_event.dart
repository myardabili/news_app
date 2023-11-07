part of 'news_category_bloc.dart';

sealed class NewsCategoryEvent {}

class GetNewsCategoryEvent extends NewsCategoryEvent {
  final String category;

  GetNewsCategoryEvent({required this.category});
}
