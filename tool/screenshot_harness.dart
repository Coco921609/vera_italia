import 'package:flutter/material.dart';
import '../lib/connexion.dart';
import '../lib/exploration.dart';
import '../lib/français/Lac de Resia.dart';
import '../lib/français/Parc de Bomarzo.dart';
import '../lib/français/Chutes de San Fele.dart';
import '../lib/français/Marais salants de Margherita di Savoia.dart';
import '../lib/français bis/Lugano.dart';
import '../lib/français bis/Grottes de Frasassi.dart';
import '../lib/français bis/Grotte Mangiapane.dart';
import '../lib/français bis/Furore.dart';
import '../lib/français bis/Les îles Tremiti.dart';
import '../lib/français bis/Le val d’Orcia.dart';
import '../lib/français bis/Civita di Bagnoregio.dart';
import '../lib/français bis/Le jardin de Ninfa.dart';
import '../lib/français bis/La Scala dei Turchi.dart';
import '../lib/français bis/Rocca Calascio.dart';
import '../lib/français bis/Il Giardino dei Tarocchi.dart';
import '../lib/français bis/La Sicile volcanique.dart';
import '../lib/français bis/Ischia.dart';
import '../lib/français bis/Grottes de Castellana.dart';
import '../lib/français bis/Alberobello.dart';
import '../lib/français bis/Les Dolomites.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final screen = Uri.base.queryParameters['screen'] ?? 'welcome';

  final Widget page = switch (screen) {
    'welcome' => const ConnexionPage(),
    'explore' => const TravelHomeScreen(),
    'resia' => const LacDeResiaPage(),
    'dolomites' => const DolomitesPage(),
    'bomarzo' => const ParcBomarzoPage(),
    'frasassi' => const GrottesDeFrasassiPage(),
    'val-dorcia' => const ValDOrciaPage(),
    'civita' => const CivitaDiBagnoregioPage(),
    'ninfa' => const JardinDeNinfaPage(),
    'rocca-calascio' => const RoccaCalascioPage(),
    'tarocchi' => const GiardinoDeiTarocchiPage(),
    'san-fele' => const ChutesDeSanFelePage(),
    'lugano' => const LuganoPage(),
    'furore' => const FurorePage(),
    'tremiti' => const IlesTremitiPage(),
    'alberobello' => const AlberobelloPage(),
    'castellana' => const GrottesCastellanaPage(),
    'ischia' => const IschiaPage(),
    'margherita' => const MaraisSalantsPage(),
    'mangiapane' => const GrotteMangiapanePage(),
    'scala' => const ScalaDeiTurchiPage(),
    'sicily' => const SicileVolcaniquePage(),
    _ => const ConnexionPage(),
  };

  runApp(MaterialApp(
    title: 'Vera Italia — aperçu',
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: page,
  ));
}
