import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget backgroundImage(BuildContext context) => SvgPicture.asset(
      'assets/images/bg-intro-mobile.svg',
      width: MediaQuery.of(context).size.width,
    );

TextStyle titleTextStyle1 = const TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.bold,
);
TextStyle titleTextStyle2 = const TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
);
TextStyle subtitleTextStyle1 = const TextStyle(
  fontSize: 18,
  color: Colors.grey,
  fontWeight: FontWeight.bold,
);
TextStyle subtitleTextStyle2 = const TextStyle(
  fontSize: 16,
  color: Colors.grey,
  fontWeight: FontWeight.bold,
);

TextStyle buttonTextStyle = const TextStyle(
  color: Colors.white,
  fontSize: 25,
  fontWeight: FontWeight.bold,
);
