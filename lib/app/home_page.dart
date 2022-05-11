import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/constant.dart';
import 'widgets/drop_down_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            backgroundImage(),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 16),
              height: 50,
              color: const Color(0xFFFAFAFA),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/images/logo.svg'),
                  DropDownMenu(
                    backgroundColor: const Color(0xFFD6F0F4),
                    borderRadius: BorderRadius.circular(10.0),
                    title: const [
                      'Home',
                      'About',
                      'Contact',
                      'Blog',
                      'Careers',
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
