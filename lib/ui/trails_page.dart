import 'package:flutter/material.dart';
import 'package:nest_jumper/ui/menu.dart';
import 'package:nest_jumper/ui/trail_map.dart';

class TrailsPage extends StatefulWidget {
  const TrailsPage({required this.title, super.key});
  final String title;
  // final String id;

  @override
  _TrailsPageState createState() => _TrailsPageState();
}

class _TrailsPageState extends State<TrailsPage> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          title: Text('Trails', style: textTheme.bodyMedium),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        drawer: Menu(),
        body: Center(
          child: ElevatedButton(
            child: Text('Show Trail'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TrailMapPage(title: 'Mapa', id: '',)),
              );
            },
          ),
        )
    );
  }
}