import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'showcase_timeline.dart';

class ShowcaseTimelineTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF004E92),
            Color(0xFF000428),
          ],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 16),
                const Text(
                  'TimelineTile Showcase',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: examples.length,
                    itemBuilder: (BuildContext context, int index) {
                      final example = examples[index];

                      return TimelineTile(
                        alignment: TimelineAlign.manual,
                        lineXY: 0.1,
                        isFirst: index == 0,
                        isLast: index == examples.length - 1,
                        indicatorStyle: IndicatorStyle(
                          width: 40,
                          height: 40,
                          indicator: _IndicatorExample(number: '${index + 1}'),
                          drawGap: true,
                        ),
                        beforeLineStyle: LineStyle(
                          color: Colors.white.withOpacity(0.2),
                        ),
                        endChild: GestureDetector(
                          child: _RowExample(example: example),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<ShowcaseTimeline>(
                                builder: (_) =>
                                    ShowcaseTimeline(example: example),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _IndicatorExample extends StatelessWidget {
  const _IndicatorExample({Key? key, required this.number}) : super(key: key);

  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.fromBorderSide(
          BorderSide(
            color: Colors.white.withOpacity(0.2),
            width: 4,
          ),
        ),
      ),
      child: Center(
        child: Text(
          number,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

class _RowExample extends StatelessWidget {
  const _RowExample({Key? key, required this.example}) : super(key: key);

  final Example example;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              example.name,
              style: GoogleFonts.jura(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          const Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 26,
          ),
        ],
      ),
    );
  }
}

//
// import 'package:example_timeline_tile/example_timeline_tile.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_showcase/flutter_showcase.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import 'apps/activity_timeline.dart';
// import 'apps/delivery_timeline.dart';
// import 'apps/football_timeline.dart';
// import 'apps/horizontal_timelines.dart';
// import 'apps/showcase_timeline.dart';
// import 'apps/success_timeline.dart';
// import 'apps/weather_timeline.dart';
// import 'indicator/effects/expanding_dots_effect.dart';
// import 'indicator/smooth_page_indicator.dart';
//
// void main() => runApp(Examples());
//
// class Examples extends StatefulWidget {
//   @override
//   _ExamplesState createState() => _ExamplesState();
// }
//
// class _ExamplesState extends State<Examples> {
//   PageController _pageController;
//   List<Widget> _apps;
//
//   @override
//   void initState() {
//     _pageController = PageController(initialPage: 0);
//     _apps = [
//       ShowcaseTimeline(),
//       ShowcaseFootballTimeline(),
//       ShowcaseHorizontalTimeline(),
//       ShowcaseWeatherTimeline(),
//       ShowcaseActivityTimeline(),
//       ShowcaseDeliveryTimeline(),
//       ShowcaseSuccessTimeline(),
//     ];
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.ltr,
//       child: Stack(
//         children: [
//           PageView.builder(
//             controller: _pageController,
//             scrollDirection: Axis.vertical,
//             itemCount: _apps.length,
//             itemBuilder: (BuildContext context, int index) {
//               return _apps[index];
//             },
//           ),
//           PageIndicator(
//             pageController: _pageController,
//             count: _apps.length,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class PageIndicator extends StatelessWidget {
//   const PageIndicator({
//     Key key,
//     @required this.pageController,
//     @required this.count,
//   }) : super(key: key);
//
//   final PageController pageController;
//   final int count;
//
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerRight,
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: SmoothPageIndicator(
//           controller: pageController,
//           count: count,
//           effect: const ExpandingDotsEffect(
//             radius: 14,
//             dotHeight: 10,
//             dotWidth: 10,
//             dotColor: Colors.black12,
//             activeDotColor: Colors.black54,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Showcase TimelineTile',
//       theme: ThemeData(
//         brightness: Brightness.dark,
//         textTheme: GoogleFonts.nanumPenScriptTextTheme(
//           Theme.of(context).textTheme,
//         ).apply(bodyColor: Colors.white),
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       builder: Frame.builder,
//       home: ShowcaseTimelineTile(),
//     );
//   }
// }
