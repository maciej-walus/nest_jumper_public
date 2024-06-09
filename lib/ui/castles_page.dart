import 'package:flutter/material.dart';
import 'package:nest_jumper/logic/json_handling.dart';
import 'package:nest_jumper/logic/page_routing.dart';
import 'package:nest_jumper/ui/menu.dart';
import 'package:provider/provider.dart';

import 'objects/bydlin.dart';
///Importowanie wszystkich stron z zamkami
import 'objects/ogrodzieniec.dart';
import 'objects/ojcow.dart';
import 'objects/olsztyn.dart';
import 'objects/pilcza.dart';
import 'objects/pieskowa_skala.dart';
import 'objects/pilica.dart';
import 'objects/rabsztyn.dart';

class CastlesPage extends StatefulWidget {
  const CastlesPage({required this.title, super.key});
  final String title;
  @override
  _CastlesPageState createState() => _CastlesPageState();
}

class _CastlesPageState extends State<CastlesPage> {
  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;
    final PageRouting _pageRouting = Provider.of<PageRouting>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Zabytki', style: textTheme.bodyMedium),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: Menu(),
      body: Center(
        child: FutureBuilder(
          future: JsonHandler().returnJson(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final buttons = _pageRouting.ObjectButtonsFromJson(snapshot.data, context);
              return Container(
                color: Theme.of(context).primaryColor,
                child: SingleChildScrollView(
                  child: Column(
                    children: buttons.map((button) {
                      return Column(
                        children: [
                          Container(
                            width: double.infinity,
                            child: button['image'],
                          ),
                          Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child:ElevatedButton(
                                child: button['child'],
                                onPressed: button['onPress'],
                              ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              );
            }
            else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
