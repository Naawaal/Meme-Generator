import 'dart:async';

import 'package:get/get.dart';
import 'package:meme_generator/app/ui/pages/02_homepage/homepage_screen.dart';

class SplashServices {
  void spalshFunction() {
    Timer(
      5.seconds,
      () {
        Get.off(() => const HomepageScreen());
      },
    );
  }
}
