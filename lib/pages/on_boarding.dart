import 'package:finance_app/app_images.dart';
import 'package:finance_app/pages/home.dart';
import 'package:finance_app/styles/colors.dart';
import 'package:finance_app/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;
  bool isLastPage = false;
  List<PageItem> item = [
    const PageItem(
      title: 'Title 1',
      image: Assets.imagesFinance1,
      subtitle: 'Subtitle 1',
    ),
    const PageItem(
      title: 'Title 2',
      image: Assets.imagesFinance2,
      subtitle: 'Subtitle 2',
    ),
    const PageItem(
      title: 'Title 3',
      image: Assets.imagesFinance3,
      subtitle: 'Subtitle 3',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                  (route) => false);
            },
            child: const Text('Skip'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                  if (value + 1 == item.length) {
                    setState(() {
                      isLastPage = true;
                    });
                  } else {
                    setState(() {
                      isLastPage = false;
                    });
                  }
                },
                itemCount: item.length,
                itemBuilder: (context, index) {
                  return item[index];
                },
                controller: pageController,
              ),
            ),
            Row(
              children: [
                Text('${currentIndex + 1}/${item.length}'),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isLastPage ? kPrimaryGreen : kPrimaryBlue,
                    foregroundColor: kWhiteColor,
                  ),
                  onPressed: () {
                    isLastPage
                        ? Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                            (route) => false)
                        : pageController.nextPage(
                            duration: Duration(seconds: 1),
                            curve: Curves.ease,
                          );
                  },
                  child: Text(isLastPage ? 'Get started' : 'Next'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
