import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'controller/home_page_controller.dart';
import 'widgets/constant.dart';
import 'widgets/drop_down_menu.dart';
import 'widgets/footer.dart';
import 'widgets/gradient_button.dart';
import 'widgets/latest_article_card.dart';
import 'widgets/why_easy_bank.dart';

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
            ScrollDirection.forward;
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
                      child: Text(
                        'Request Invite',
                        style: buttonTextStyle1,
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
                          WhyEasyBank(
                            imageURL: whyEasybankList[0].imageURL,
                            title: whyEasybankList[0].title,
                            subtitle: whyEasybankList[0].description,
                          ),
                          const SizedBox(height: 50),
                          WhyEasyBank(
                            imageURL: whyEasybankList[1].imageURL,
                            title: whyEasybankList[1].title,
                            subtitle: whyEasybankList[1].description,
                          ),
                          const SizedBox(height: 50),
                          WhyEasyBank(
                            imageURL: whyEasybankList[2].imageURL,
                            title: whyEasybankList[2].title,
                            subtitle: whyEasybankList[2].description,
                          ),
                          const SizedBox(height: 50),
                          WhyEasyBank(
                            imageURL: whyEasybankList[3].imageURL,
                            title: whyEasybankList[3].title,
                            subtitle: whyEasybankList[3].description,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    Text(
                      'Latest Article',
                      style: titleTextStyle1,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      color: Colors.white,
                      child: Column(
                        children: [
                          LatestArticleCard(
                            imageURL: latestArticleList[0].imageURL,
                            author: latestArticleList[0].author,
                            title: latestArticleList[0].title,
                            bodyText: latestArticleList[0].description,
                          ),
                          const SizedBox(height: 30),
                          LatestArticleCard(
                            imageURL: latestArticleList[1].imageURL,
                            author: latestArticleList[1].author,
                            title: latestArticleList[1].title,
                            bodyText: latestArticleList[1].description,
                          ),
                          const SizedBox(height: 30),
                          LatestArticleCard(
                            imageURL: latestArticleList[2].imageURL,
                            author: latestArticleList[2].author,
                            title: latestArticleList[2].title,
                            bodyText: latestArticleList[2].description,
                          ),
                          const SizedBox(height: 30),
                          LatestArticleCard(
                            imageURL: latestArticleList[3].imageURL,
                            author: latestArticleList[3].author,
                            title: latestArticleList[3].title,
                            bodyText: latestArticleList[3].description,
                          ),
                        ],
                      ),
                    ),
                    const AppFooter()
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
                title: const ['Home', 'About', 'Contact', 'Blog', 'Careers'],
              )
            ],
          ),
        ),
      );
}
