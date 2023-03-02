import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../src/showcase_timeline_tile.dart';
import 'apps/activity_timeline.dart';
import 'apps/delivery_timeline.dart';
import 'apps/football_timeline.dart';
import 'apps/horizontal_timelines.dart';
import 'apps/showcase_timeline.dart';
import 'apps/success_timeline.dart';
import 'apps/weather_timeline.dart';
import 'indicator/effects/expanding_dots_effect.dart';
import 'indicator/smooth_page_indicator.dart';

class Examples extends StatefulWidget {
  @override
  _ExamplesState createState() => _ExamplesState();
}

class _ExamplesState extends State<Examples> {
  late PageController _pageController;
  late List<Widget> _apps;

    final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey _three = GlobalKey();
  final GlobalKey _four = GlobalKey();
  final GlobalKey _five = GlobalKey();


  final scrollController = ScrollController();

  // @override
  // void initState() {
  //   super.initState();
  //   //Start showcase view after current widget frames are drawn.
  //   //NOTE: remove ambiguate function if you are using
  //   //flutter version greater than 3.x and direct use WidgetsBinding.instance

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _apps = [
      // ShowcaseTimeline(),
      ShowcaseTimelineTile(),
      ShowcaseFootballTimeline(),
      ShowcaseHorizontalTimeline(),
      ShowcaseWeatherTimeline(),
      ShowcaseActivityTimeline(),
      ShowcaseDeliveryTimeline(),
      ShowcaseSuccessTimeline(),
    ];
    // (WidgetsBinding.instance).addPostFrameCallback(
    //       (_) => ShowCaseWidget.of(context)
    //       .startShowCase([_one, _two, _three, _four, _five]),
    // );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: _apps.length,
            itemBuilder: (BuildContext context, int index) {
              return _apps[index];
            },
          ),
          PageIndicator(
            pageController: _pageController,
            count: _apps.length,
          ),
        ],
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    Key? key,
    required this.pageController,
    required this.count,
  }) : super(key: key);

  final PageController pageController;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SmoothPageIndicator(
          controller: pageController,
          count: count,
          effect: const ExpandingDotsEffect(
            radius: 14,
            dotHeight: 10,
            dotWidth: 10,
            dotColor: Colors.black12,
            activeDotColor: Colors.black54,
          ), textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}
