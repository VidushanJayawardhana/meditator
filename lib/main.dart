import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meditator/provider/filter_provider.dart';
import 'package:meditator/provider/meditation_provider.dart';
import 'package:meditator/provider/mindfull_exercise_provider.dart';
import 'package:meditator/provider/sleep_content_provider.dart';
import 'package:meditator/router/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FilterProvider()),
        ChangeNotifierProvider(create: (context) => MeditationProvider()),
        ChangeNotifierProvider(create: (context) => SleepContentProvider()),
        ChangeNotifierProvider(create: (context) => MindfullExerciseProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Meditator",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GoogleFonts.lato().fontFamily),
      routerConfig: RouterClass().router,
    );
  }
}
