import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app/ui/pages/01_splashpage/splash_screen.dart';

class MemeGenerator extends StatelessWidget {
  const MemeGenerator({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meme Generator',
      themeMode: ThemeMode.system,
      home: const SpalshScreen(),
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
    );
  }
}
