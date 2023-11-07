import 'package:flutter/material.dart';
import 'package:news_app/common/constants/fonts.dart';
import 'package:news_app/common/constants/images.dart';

class Logo extends StatefulWidget {
  const Logo({
    super.key,
  });

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Images.logo,
          height: 24,
          width: 24,
        ),
        const SizedBox(width: 10),
        const Text(
          'Daily News',
          style: TextStyle(
            fontFamily: Fonts.fontSF,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
