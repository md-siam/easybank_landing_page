import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constant.dart';

class WhyEasyBank extends StatelessWidget {
   final String imageURL;
 final  String title;
  final String subtitle;
  const WhyEasyBank({
    Key? key,
    required this.imageURL,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          imageURL,
          width: 100,
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: titleTextStyle2,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            subtitle,
            style: subtitleTextStyle2,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
