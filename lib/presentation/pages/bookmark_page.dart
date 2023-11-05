import 'package:flutter/material.dart';
import 'package:news_app/common/constants/fonts.dart';
import 'package:news_app/presentation/widgets/list_category_bookmark.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 22),
              Text(
                "Bookmark",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: Fonts.fontSF,
                ),
              ),
              SizedBox(height: 32),
              LisCategoryBookmark(),
            ],
          ),
        ),
      ),
    );
  }
}
