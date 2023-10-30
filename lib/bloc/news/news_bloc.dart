// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/data/datasources/news_remote_datasource.dart';
import 'package:news_app/data/models/news_response_model.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRemoteDatasource datasource;
  NewsBloc(
    this.datasource,
  ) : super(NewsInitial()) {
    on<GetNewsEvent>((event, emit) async {
      emit(NewsLoading());
      final result = await datasource.getNews();
      result.fold(
        (error) => emit(NewsError(message: error)),
        (data) => emit(NewsLoaded(model: data)),
      );
    });
  }
}
