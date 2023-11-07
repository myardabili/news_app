// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/data/datasources/news_remote_datasource.dart';
import 'package:news_app/data/models/news_response_model.dart';

part 'search_news_event.dart';
part 'search_news_state.dart';

class SearchNewsBloc extends Bloc<SearchNewsEvent, SearchNewsState> {
  final NewsRemoteDatasource datasource;
  SearchNewsBloc(
    this.datasource,
  ) : super(SearchNewsInitial()) {
    on<GetSearchNewsEvent>((event, emit) async {
      emit(SearchNewsLoading());
      final result = await datasource.searchNews(event.query);
      result.fold(
        (error) => emit(SearchNewsError(message: error)),
        (data) => emit(SearchNewsLoaded(model: data)),
      );
    });
  }
}
