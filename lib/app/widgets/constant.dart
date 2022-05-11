import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget backgroundImage(BuildContext context) =>
    SvgPicture.asset(
      'assets/images/bg-intro-mobile.svg',
      width: MediaQuery.of(context).size.width,
    );
