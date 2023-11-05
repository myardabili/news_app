import 'package:flutter/material.dart';
import 'package:news_app/common/constants/colors.dart';
import 'package:news_app/common/constants/fonts.dart';
import 'package:news_app/data/models/list_category_bookmark_model.dart';

var selectedCategory = 0;

class LisCategoryBookmark extends StatefulWidget {
  const LisCategoryBookmark({
    super.key,
  });

  @override
  State<LisCategoryBookmark> createState() => _LisCategoryBookmarkState();
}

class _LisCategoryBookmarkState extends State<LisCategoryBookmark> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: selectedCategory == index
                    ? ColorsName.black
                    : ColorsName.lightGrey,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: Text(
                  ListCategoryBookmarkModel.listCategoryBookmark()[index],
                  style: TextStyle(
                    fontFamily: Fonts.fontSF,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: selectedCategory == index
                        ? ColorsName.white
                        : ColorsName.grey,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: ListCategoryBookmarkModel.listCategoryBookmark().length,
      ),
    );
  }
}
