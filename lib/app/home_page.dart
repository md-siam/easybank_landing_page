import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/constant.dart';
import 'widgets/drop_down_menu.dart';
import 'widgets/gradient_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _scrollController;
  bool fabIsVisible = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        fabIsVisible = _scrollController.position.userScrollDirection ==
            ScrollDirection.reverse;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            backgroundImage(context),
            SizedBox(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    const SizedBox(height: 60.0),
                    Image.asset('assets/images/image-mockups.png'),
                    const SizedBox(height: 40.0),
                    Text(
                      'Next generation\ndigital banking',
                      style: titleTextStyle1,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Take your financial life online. Your Easybank account will be a one-stop-shop for spending, saving,budgeting, investing, and much more.',
                        style: subtitleTextStyle1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    GradientButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          bottom: 10.0,
                          left: 15.0,
                          right: 15.0,
                        ),
                        child: Text(
                          'Request Invite',
                          style: buttonTextStyle,
                        ),
                      ),
                    ),
                    const SizedBox(height: 70.0),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      color: Colors.grey[200],
                      child: Column(
                        children: [
                          Text(
                            'Why choose\nEasybank?',
                            style: titleTextStyle1,
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'We leverage Open Banking to turn your bank account into your financial hub. Control your finances like never before',
                              style: subtitleTextStyle1,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 50),
                          whyChooseEasyBank(
                              'assets/images/icon-online.svg',
                              'Online Banking',
                              'Our modern web and mobile applications allow you to keep track of your finances wherever you are in the world'),
                          const SizedBox(height: 50),
                          whyChooseEasyBank(
                              'assets/images/icon-budgeting.svg',
                              'Simple Budgeting',
                              'See exactly where your money goes each month. Receive notification when you\'re close to your hitting limits.'),
                          const SizedBox(height: 50),
                          whyChooseEasyBank(
                              'assets/images/icon-onboarding.svg',
                              'Fast Onboarding',
                              'We don\'t do branches. Open your account in minutes online and start taking control of your finances right away.'),
                          const SizedBox(height: 50),
                          whyChooseEasyBank(
                              'assets/images/icon-api.svg',
                              'Open API',
                              'Manage your savings, investments, pension, and much more from one account. Tracking your money never been easier.'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            topAppBar(),
          ],
        ),
      ),
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 100),
        opacity: fabIsVisible ? 1 : 0,
        child: FloatingActionButton(
          child: Container(
            width: 60,
            height: 60,
            child: const Icon(Icons.arrow_upward_outlined, size: 30),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Color(0xff00F260), Color(0xff2AB9D2)],
              ),
            ),
          ),
          onPressed: () {
            _scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
            );
          },
        ),
      ),
    );
  }

  Widget topAppBar() => Material(
        elevation: 4.0,
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 16),
          height: 50,
          color: const Color(0xFFFAFAFA),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset('assets/images/logo.svg'),
              DropDownMenu(
                backgroundColor: Colors.white,
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
      );

  Widget whyChooseEasyBank(String imageURL, String title, String subtitle) {
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
