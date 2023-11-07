// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:news_app/common/constants/colors.dart';
import 'package:news_app/common/constants/fonts.dart';
import 'package:news_app/common/constants/images.dart';
import 'package:news_app/data/models/news_response_model.dart';
import 'package:news_app/presentation/bloc/search_news/search_news_bloc.dart';
import 'package:news_app/presentation/pages/detail_news.dart';

class SearchPage extends StatefulWidget {
  final String query;
  const SearchPage({
    Key? key,
    required this.query,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    searchController.text = widget.query;
    context.read<SearchNewsBloc>().add(GetSearchNewsEvent(query: widget.query));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 22),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: ColorsName.lightGrey,
                    borderRadius: BorderRadius.circular(40)),
                child: Row(children: [
                  Image.asset(
                    Images.iconSearch,
                    height: 17,
                    width: 17,
                    color: ColorsName.grey,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: searchController,
                      onFieldSubmitted: (_) {
                        context.read<SearchNewsBloc>().add(
                            GetSearchNewsEvent(query: searchController.text));
                      },
                      style: const TextStyle(
                        fontFamily: Fonts.fontSF,
                        fontSize: 15,
                        color: ColorsName.black,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          fontFamily: Fonts.fontSF,
                          fontSize: 15,
                          color: ColorsName.grey,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    Images.iconCancel,
                    height: 17,
                    width: 17,
                    color: ColorsName.grey,
                  ),
                ]),
              ),
              const SizedBox(height: 24),
              searchNews(),
            ],
          ),
        ),
      ),
    );
  }

  BlocBuilder<SearchNewsBloc, SearchNewsState> searchNews() {
    return BlocBuilder<SearchNewsBloc, SearchNewsState>(
      builder: (context, state) {
        if (state is SearchNewsLoaded) {
          return Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailNews(
                          article:
                              Article(url: state.model.articles?[index].url));
                    }));
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        state.model.articles?[index].urlToImage ??
                            'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png',
                        height: 120,
                        width: 130,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              state.model.articles?[index].title ?? '',
                              maxLines: 4,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: Fonts.fontSF,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 200,
                            child: Text(
                              state.model.articles?[index].author ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                fontFamily: Fonts.fontSF,
                                color: ColorsName.grey,
                              ),
                            ),
                          ),
                          const SizedBox(height: 3),
                          SizedBox(
                            width: 211,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    state.model.articles?[index].source!.name ??
                                        '',
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: Fonts.fontSF,
                                        color: ColorsName.blue),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  height: 6,
                                  width: 6,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: ColorsName.grey),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  state.model.articles?[index].publishedAt !=
                                          null
                                      ? DateFormat('y').format(state
                                          .model.articles![index].publishedAt!)
                                      : '',
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: Fonts.fontSF,
                                      color: ColorsName.grey),
                                ),
                                const Spacer(),
                                const Icon(Icons.more_horiz)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                thickness: 1,
                height: 24,
                color: ColorsName.lightGrey,
              ),
              itemCount: state.model.articles!.length,
            ),
          );
        }
        return const Center(
          child: Text('Data not found'),
        );
      },
    );
  }
}
