import 'package:flutter/material.dart';
import 'menu.dart';

class TrailPage extends StatefulWidget {
  const TrailPage({super.key, required String title});

  @override
  State<TrailPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<TrailPage> {

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text("Historia Szlaku", style: textTheme.bodyMedium),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: const Menu(),
      body: Center(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Image.asset('assets/images/trail_1.png'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  child: Text(
                    "Historia Szlaku Orlich Gniazd sięga roku 1930, kiedy to po raz pierwszy wytyczono trasę jego przebiegu. \n \nObecnie ma on długość 163,9 km i jest on oznaczony kolorem czerwonym, jest również jednym z najbardziej rozpoznawalnych szlaków turystycznych w Polsce. \n \nPrzebieg jego trasy zmieniał się na przestrzeni lat, aż do roku 1950, kiedy nadano mu ostateczny kształt. Trasa prowadzi przez malownicze tereny Jury Krakowsko-Częstochowskiej, regionu znanego z niezwykłych formacji skalnych, wapiennych wzgórz i gęstych lasów.",
                    style: textTheme.bodySmall,
                    textAlign: TextAlign.left, // Add this line
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  child: Text(
                    "Szlak Orlich Gniazd jest w głównej mierze atrakcją historyczną, jednakże fani fauny i flory również odnajdą w nim coś dla siebie, chociażby liczne intrygujące formacje skalne.",
                    style: textTheme.bodySmall,
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Image.asset('assets/images/trail_2.png'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  child: Text(
                    "Nazwa szlaku pochodzi od licznych zamków i strażnic, które znajdują się na jego trasie. Te średniowieczne budowle, wzniesione na wysokich, trudno dostępnych wzgórzach, przypominają orle gniazda – stąd nazwa szlaku. Budowle te, wzniesione głównie za czasów Kazimierza Wielkiego w XIV wieku, miały za zadanie strzec granic Królestwa Polskiego przed najazdami.",
                    style: textTheme.bodySmall,
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  child: Text(
                    "Do najważniejszych zamków na trasie należą przykładowo: Zamek w Ogrodzieńcu, będący największą warownią na szlaku, Zamek w Bobolicach, Zamek w Olsztynie koło Częstochowy oraz Zamek w Pieskowej Skale. Każdy z tych zamków jest pięknym pomnikiem fascynującej historii ziem polskich, przyciągając rzesze turystów i miłośników historii.",
                    style: textTheme.bodySmall,
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Image.asset('assets/images/ogrodzieniec/ogrodzieniec_2.png'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  child: Text(
                    "Szlak Orlich Gniazd to także doskonałe miejsce dla miłośników turystyki kwalifikowanej. Dzięki różnorodności krajobrazu i ukształtowaniu terenu, trasa ta jest popularna wśród wspinaczy, rowerzystów oraz pieszych wędrowców. \n \nWarto również wspomnieć o dobrze rozbudowanej bazie noclegowej, która obejmuje zarówno luksusowe hotele, jak i przytulne agroturystyki, schroniska młodzieżowe oraz pola namiotowe. To wszystko sprawia, że szlak jest dostępny dla turystów o różnych wymaganiach i możliwościach finansowych.",
                    style: textTheme.bodySmall,
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}