// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/data/datasources/news_remote_datasource.dart';
import 'package:news_app/data/models/news_response_model.dart';

part 'news_category_event.dart';
part 'news_category_state.dart';

class NewsCategoryBloc extends Bloc<NewsCategoryEvent, NewsCategoryState> {
  final NewsRemoteDatasource datasource;
  NewsCategoryBloc(
    this.datasource,
  ) : super(NewsCategoryInitial()) {
    on<GetNewsCategoryEvent>((event, emit) async {
      emit(NewsCategoryLoading());
      final result = await datasource.getNewsCategory(event.category);
      result.fold(
        (error) => emit(NewsCategoryError(message: error)),
        (data) => emit(NewsCategoryLoaded(model: data)),
      );
    });
  }
}
