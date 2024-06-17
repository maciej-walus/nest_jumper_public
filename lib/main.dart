import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'logic/map_objects.dart';
import 'logic/page_routing.dart';
import 'ui/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MapObjects()),
        ChangeNotifierProvider(create: (context) => PageRouting()),
      ],
      child: const NestJumper(),
    ),
  );
}

class NestJumper extends StatelessWidget {
  const NestJumper({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: "Nest Jumper",
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.brown,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.brown.shade400,
        ),

        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),

          titleLarge: GoogleFonts.lora(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: GoogleFonts.lora(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodySmall: GoogleFonts.lora(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      home: const HomePage(title: 'Home'),
    );
  }
}
