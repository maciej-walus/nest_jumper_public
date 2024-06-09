import 'package:flutter/material.dart';
import 'package:nest_jumper/ui/map_page.dart';

///Strona startowa aplikacji

class HomePage extends StatefulWidget {
  const HomePage({required this.title, super.key});
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    const String appTitle = 'Nest Jumper';
    return Scaffold(
        appBar: AppBar(
          title: Text(appTitle, style: textTheme.bodyMedium),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Text(
                    'Witaj w Nest Jumper',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Text(
                    'Odkryj sekrety Szlaku Orlich Gniazd',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MapPage(title: "Map Page")),
                    );
                  },
                  child: const Text('Zaczynajmy!'),
                ),
              ],
            ),
          ),
        ),
    );
  }
}