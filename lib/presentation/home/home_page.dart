import 'package:flutter/material.dart';
import 'package:news_app/presentation/home/widgets/list_category.dart';
import 'package:news_app/presentation/home/widgets/list_news.dart';
import 'package:news_app/presentation/home/widgets/logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Logo(),
              SizedBox(height: 30),
              ListCategory(),
              SizedBox(height: 27),
              ListNews(),
            ],
          ),
        ),
      ),
    );
  }
}
