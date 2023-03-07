import 'package:flutter/material.dart';
import 'package:meme_generator/app/data/api/get_meme.dart';
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
    GetMemeApi().getMemeApi();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorConst.splashScreenSecondColor,
              ColorConst.splashScreenFirstColor,
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Image.asset('assets/png/doge.png'),
              ),
              const Text(
                'Meme Generator',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
