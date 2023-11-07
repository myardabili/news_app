import 'package:flutter/material.dart';
import 'package:news_app/common/constants/colors.dart';
import 'package:news_app/common/constants/fonts.dart';
import 'package:news_app/data/models/list_images_model.dart';
import 'package:news_app/data/models/news_category_model.dart';
import 'package:news_app/presentation/pages/news_category_page.dart';

var selectedCategory = 0;

class ListCategory extends StatefulWidget {
  const ListCategory({
    super.key,
  });

  @override
  State<ListCategory> createState() => _ListCategoryState();
}

class _ListCategoryState extends State<ListCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = index;
              });
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NewsCategoryPage(
                  category: NewsCategoryModel.newsCategory()[index],
                );
              }));
            },
            child: Column(
              children: [
                Container(
                  height: 68,
                  width: 68,
                  decoration: BoxDecoration(
                    color: ColorsName.black,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Image.asset(
                    ListImagesModel.listImages()[index],
                    scale: 14,
                    color: ColorsName.white,
                  ),
                ),
                Text(
                  NewsCategoryModel.newsCategory()[index],
                  style: const TextStyle(
                    fontFamily: Fonts.fontSF,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ColorsName.black,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 24),
        itemCount: 6,
      ),
    );
  }
}
