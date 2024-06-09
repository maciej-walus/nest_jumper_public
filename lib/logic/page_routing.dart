import 'package:flutter/material.dart';

import '../ui/home_page.dart';
import '../ui/objects/bakowiec.dart';
import '../ui/objects/bobolice.dart';
import '../ui/objects/bydlin.dart';
import '../ui/objects/gora_birow.dart';
import '../ui/objects/mirow.dart';
import '../ui/objects/ogrodzieniec.dart';
import '../ui/objects/ojcow.dart';
import '../ui/objects/olsztyn.dart';
import '../ui/objects/ostreznik.dart';
import '../ui/objects/pieskowa_skala.dart';
import '../ui/objects/pilcza.dart';
import '../ui/objects/pilica.dart';
import '../ui/objects/rabsztyn.dart';

///Klasa odpowiedzialna za przekierowywanie kliknięć przycisków i widgetów na odpowiednie strony aplikacji


class PageRouting with ChangeNotifier {

  final pageRoutes = {
    0: () => MaterialPageRoute(builder: (context) => OgrodzieniecPage(title: 'Ogrodzieniec',)),
    1: () => MaterialPageRoute(builder: (context) => PilczaPage(title: 'Pilcza',)),
    2: () => MaterialPageRoute(builder: (context) => PieskowaSkalaPage(title: 'Pieskowa Skała',)),
    3: () => MaterialPageRoute(builder: (context) => OlsztynPage(title: 'Olsztyn',)),
    4: () => MaterialPageRoute(builder: (context) => OjcowPage(title: 'Ojców',)),
    5: () => MaterialPageRoute(builder: (context) => RabsztynPage(title: 'Rabsztyn',)),
    6: () => MaterialPageRoute(builder: (context) => BydlinPage(title: 'Bydlin',)),
    7: () => MaterialPageRoute(builder: (context) => PilicaPage(title: 'Pilica',)),
    8: () => MaterialPageRoute(builder: (context) => GoraBirowPage(title: 'Góra Birów',)),
    9: () => MaterialPageRoute(builder: (context) => BakowiecPage(title: 'Bąkowiec',)),
    10: () => MaterialPageRoute(builder: (context) => BobolicePage(title: 'Bobolice',)),
    11: () => MaterialPageRoute(builder: (context) => MirowPage(title: 'Mirow',)),
    12: () => MaterialPageRoute(builder: (context) => OstreznikPage(title: 'Ostrężnik',)),
  };

  List<Map<String, dynamic>> ObjectButtonsFromJson(jsonData, context) {

    final buttons = <Map<String, dynamic>>[];

    for (var entry in jsonData) {
      final pageConstructor = pageRoutes[entry['id']];
      buttons.add({
        'image': Image(image: AssetImage(
            'assets/images/${entry['tag']}/${entry['tag']}_1.png')),
        'child': Text(entry['name']),
        'onPress': pageConstructor != null ? () =>
            Navigator.of(context).push(pageConstructor()) : null,
      });
    }
    return buttons;
  }

  MaterialPageRoute RouteToPage(int id){
    if(pageRoutes.containsKey(id)){
      return pageRoutes[id]!();
    } else {
      // Return a default route or throw an exception if the ID is not found
      return MaterialPageRoute(builder: (context) => HomePage(title: 'Home',));
    }
  }
}

