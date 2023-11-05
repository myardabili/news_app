import 'package:flutter/material.dart';
import 'package:news_app/common/constants/colors.dart';
import 'package:news_app/common/constants/fonts.dart';
import 'package:news_app/common/constants/images.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

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
                  const Expanded(
                    child: TextField(
                      style: TextStyle(
                        fontFamily: Fonts.fontSF,
                        fontSize: 15,
                        color: ColorsName.black,
                      ),
                      decoration: InputDecoration(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
