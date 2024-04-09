import 'package:flutter/material.dart';
import 'package:meals_app/components/into_nav_button.dart';
import 'package:meals_app/constants.dart';
import 'package:meals_app/pages/auth_pages/login_page.dart';
import 'package:meals_app/pages/intro_pages/page1.dart';
import 'package:meals_app/pages/intro_pages/page2.dart';
import 'package:meals_app/pages/intro_pages/page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage0 extends StatefulWidget {
  const IntroPage0({super.key});

  @override
  State<IntroPage0> createState() => _IntroPage0State();
}

class _IntroPage0State extends State<IntroPage0> {
  PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            
            PageView(
              onPageChanged: (value) {
                if (value == 2) {
                  setState(() {
                    onLastPage = true;
                  });
                }
              },
              controller: _controller,
              children: const [
                IntroPage1(),
                IntroPage2(),
                IntroPage3(),
              ],
            ),
            Container(
              alignment: const Alignment(0, 0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IntroNavigationButton(
                    text: 'Skip',
                    color: kmainColor,
                    onpressed: () {
                      _controller.jumpToPage(2);
                    },
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: const WormEffect(
                      dotColor: kmainColor,
                      activeDotColor: Colors.black87,
                    ),
                  ),
                  onLastPage
                      ? IntroNavigationButton(
                          color: kmainColor,
                          text: 'Done',
                          onpressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const LoginPage();
                                },
                              ),
                            );
                          },
                        )
                      : IntroNavigationButton(
                          text: 'Next',
                          color: kmainColor,
                          onpressed: () {
                            _controller.nextPage(
                              duration: const Duration(microseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
