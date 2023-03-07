import 'package:flutter/material.dart';
import 'package:meme_generator/app/data/services/01_splash_services/spalsh_service.dart';
import 'package:meme_generator/app/ui/theme/color_const.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    super.initState();
    SplashServices().spalshFunction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorConst.splashScreenSecondColor,
              ColorConst.splashScreenFirstColor,
            ],
          ),
        ),
      ),
    );
  }
}
