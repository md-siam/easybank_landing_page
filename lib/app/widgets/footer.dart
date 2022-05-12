import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constant.dart';
import 'gradient_button.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: const Color(0xFF2D314E),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.jpg'),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: SvgPicture.asset('assets/images/icon-facebook.svg'),
                onTap: () {},
              ),
              const SizedBox(width: 15),
              GestureDetector(
                child: SvgPicture.asset('assets/images/icon-youtube.svg'),
                onTap: () {},
              ),
              const SizedBox(width: 15),
              GestureDetector(
                child: SvgPicture.asset('assets/images/icon-twitter.svg'),
                onTap: () {},
              ),
              const SizedBox(width: 15),
              GestureDetector(
                child: SvgPicture.asset('assets/images/icon-pinterest.svg'),
                onTap: () {},
              ),
              const SizedBox(width: 15),
              GestureDetector(
                child: SvgPicture.asset('assets/images/icon-instagram.svg'),
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 20),
          TextButton(
            child: Text(
              'About Us',
              style: buttonTextStyle2,
            ),
            onPressed: () {},
          ),
          TextButton(
            child: Text(
              'Contact',
              style: buttonTextStyle2,
            ),
            onPressed: () {},
          ),
          TextButton(
            child: Text(
              'Blog',
              style: buttonTextStyle2,
            ),
            onPressed: () {},
          ),
          TextButton(
            child: Text(
              'Careers',
              style: buttonTextStyle2,
            ),
            onPressed: () {},
          ),
          TextButton(
            child: Text(
              'Support',
              style: buttonTextStyle2,
            ),
            onPressed: () {},
          ),
          TextButton(
            child: Text(
              'Privacy Policy',
              style: buttonTextStyle2,
            ),
            onPressed: () {},
          ),
          const SizedBox(height: 30),
          GradientButton(
            onPressed: () {},
            child: Text(
              'Request Invite',
              style: buttonTextStyle1,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            '© Easybank. All Rights Reserved',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          )
        ],
      ),
    );
  }
}
