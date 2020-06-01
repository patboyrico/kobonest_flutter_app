import 'package:flutter/material.dart';
import 'package:flutter_repo/screens/accounts/accounts.dart';
// import 'package:flutter_repo/providers/color_provider.dart';
import 'package:flutter_repo/screens/onboarding/components/onboard_page.dart';
import 'package:flutter_repo/screens/onboarding/data/onboard_page_data.dart';
import 'package:flutter_repo/utils/size_config.dart';

class Onboarding extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // ColorProvider colorProvider = Provider.of<ColorProvider>(context);
    // ColorProvider colorProvider = Provider.of(context)

    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(
        builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          return Scaffold(
            body: Stack(
              children: <Widget>[
               
                PageView.builder(
                  controller: pageController,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return OnboardPage(
                      pageController: pageController,
                      pageModel: onboardData[index],
                    );
                  },
                ),
                Container(
                  width: double.infinity,
                  height: 70,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 32.0),
                          child: Text(
                            'kobonest',
                            style: Theme.of(context).textTheme.title.copyWith(
                                  color: Color(0XFF7A2048),
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 32.0),
                          child: GestureDetector(
                            onTap: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AccountScreen())),
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
