import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showcaseview/showcaseview.dart';

class ShowcaseTimeline extends StatelessWidget {
  GlobalKey _one = GlobalKey();


  @override
  Widget build(BuildContext context) {
   return Showcase(
        key: _one,
        description: 'Tap to check mail',
        tooltipPosition: TooltipPosition.top,
        disposeOnTap: true,
        onTargetClick: () {
          // Navigator.push<void>(
          //   context,
          //   MaterialPageRoute<void>(
          //     builder: (_) => const Detail(),
          //   ),
          // ).then((_) {
          //   setState(() {
          //     ShowCaseWidget.of(context).startShowCase([_four, _five]);
          //   });
          // });
        },
        child: Container(child: Text('time line tile'),),);

    return Showcase(
      key: _one,
      title: 'Showcase Timeline',
      // child: Container(child: Text('time line tile'),),
      child: Builder(
        builder: (_) => _ShowcaseTimelineApp(),
      ),
      description:
          'A set of examples of timelines built with flutter to showcase the '
          'timeline_tile package.\nScroll down to see some real world timelines,'
          ' and access the package at pub.dev.',
);
  }
}

class _ShowcaseTimelineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Showcase TimelineTile',
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: GoogleFonts.nanumPenScriptTextTheme(
          Theme.of(context).textTheme,
        ).apply(bodyColor: Colors.white),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Container(child: Text('time line tile'),),
    );
  }
}
