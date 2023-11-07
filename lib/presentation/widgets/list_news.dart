import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_app/common/constants/colors.dart';
import 'package:news_app/common/constants/fonts.dart';
import 'package:news_app/data/models/news_response_model.dart';
import 'package:news_app/presentation/bloc/news/news_bloc.dart';
import 'package:news_app/presentation/pages/detail_news.dart';

class ListNews extends StatefulWidget {
  const ListNews({
    super.key,
  });

  @override
  State<ListNews> createState() => _ListNewsState();
}

class _ListNewsState extends State<ListNews> {
  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(GetNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoaded) {
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
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
