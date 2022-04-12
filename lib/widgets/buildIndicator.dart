// widget
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget buildIndicator(int activeIndex) => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: 2,
      effect: const JumpingDotEffect(
          dotHeight: 8.0,
          dotWidth: 8.0,
          activeDotColor: Colors.white,
          dotColor: Colors.grey),
    );
