import 'package:flutter/material.dart';
import 'package:nest_jumper/ui/trail_page.dart';
import 'faq_page.dart';
import 'map_page.dart';
import 'castles_page.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Drawer(
        child: Material(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text('Mapa', style: textTheme.bodyMedium),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MapPage(title: 'Map Page')));
                  },
                ),
                ListTile(
                  title: Text('Zabytki', style: textTheme.bodyMedium),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CastlesPage(title: 'Castles Page')));
                  },
                ),
                ListTile(
                  title: Text('FAQ', style: textTheme.bodyMedium),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => FAQPage(title: 'FAQ Page',)));
                  },
                ),
                ListTile(
                  title: Text('Historia szlaku', style: textTheme.bodyMedium),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => TrailPage(title: 'Trail Page',)));
                  },
                ),
              ],
          ),
        ),
      )
    );
  }
}