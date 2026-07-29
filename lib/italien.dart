import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'italien//Lac de Resia.dart';
import 'italien/Parc de Bomarzo.dart';
import 'italien/Chutes de San Fele.dart';
import 'italien/Marais salants de Margherita di Savoia.dart';
import 'italien bis/Lugano.dart';
import 'italien bis/Grottes de Frasassi.dart';
import 'italien bis/Grotte Mangiapane.dart';
import 'italien bis/Furore.dart';
import 'italien bis/Les îles Tremiti.dart';
import 'italien bis/Le val d’Orcia.dart';
import 'italien bis/Civita di Bagnoregio.dart';
import 'italien bis/Le jardin de Ninfa.dart';
import 'italien bis/La Scala dei Turchi.dart';
import 'italien bis/Rocca Calascio.dart';
import 'italien bis/Il Giardino dei Tarocchi.dart';
import 'italien bis/La Sicile volcanique.dart';
import 'italien bis/Ischia.dart';
import 'italien bis/Grottes de Castellana.dart';
import 'italien bis/Alberobello.dart';
import 'italien bis/Les Dolomites.dart';

class TravelHomeScreen extends StatefulWidget {
  const TravelHomeScreen({super.key});

  @override
  State<TravelHomeScreen> createState() => _TravelHomeScreenState();
}

class _TravelHomeScreenState extends State<TravelHomeScreen> {
  Set<String> _favoris = {};
  final String _cleStockage = 'favoris_destinations';
  int _selectedIndex = 0;
  final Set<String> _filtreActif = {};
  final Color primaryColor = const Color(0xFFFF5A5F);

  final List<Map<String, dynamic>> destinations = [
// ==========================================
    // ITALIA SETTENTRIONALE
    // ==========================================
    {
      'nom': 'Lago di Resia',
      'region': 'Italia Settentrionale',
      'description': 'Un campanile misterioso che emerge dalle grandiose acque alpine, testimone affascinante di un paese sommerso.',
      'image': 'assets/images/2.jpg',
      'couleur': const Color(0xFF40E0D0),
      'page': const LacDeResiaPage(),
    },
    {
      'nom': 'Le Dolomiti',
      'region': 'Italia Settentrionale',
      'description': 'Cime affilate dai riflessi rosati, un paradiso per gli amanti della montagna e dei grandi spazi.',
      'image': 'assets/ima/28.jpeg',
      'couleur': const Color(0xFFAED6F1),
      'page': const DolomitesPage(),
    },

    // ==========================================
    // ITALIA CENTRALE
    // ==========================================
    {
      'nom': 'Parco dei Mostri di Bomarzo',
      'region': 'Italia Centrale',
      'description': 'Un giardino mistico popolato da sculture di mostri giganteschi e creature mitologiche.',
      'image': 'assets/images/9.jpg',
      'couleur': const Color(0xFFD4AC0D),
      'page': const ParcBomarzoPage(),
    },
    {
      'nom': 'Grotte di Frasassi',
      'region': 'Italia Centrale',
      'description': 'Un regno sotterraneo spettacolare fatto di stalattiti e stalagmiti monumentali.',
      'image': 'assets/imag/10.jpg',
      'couleur': const Color(0xFF7F8C8D),
      'page': const GrottesDeFrasassiPage(),
    },
    {
      'nom': 'Val d’Orcia',
      'region': 'Italia Centrale',
      'description': 'Un paesaggio di colline ondulate, cipressi e borghi medievali, vera icona della Toscana.',
      'image': 'assets/imag/30.webp',
      'couleur': const Color(0xFFE67E22),
      'page': const ValDOrciaPage(),
    },
    {
      'nom': 'Civita di Bagnoregio',
      'region': 'Italia Centrale',
      'description': 'La città che muore, un borgo sospeso su un altopiano vulcanico, accessibile solo attraverso una passerella.',
      'image': 'assets/ima/4.webp',
      'couleur': const Color(0xFFA04000),
      'page': const CivitaDiBagnoregioPage(),
    },
    {
      'nom': 'Giardino di Ninfa',
      'region': 'Italia Centrale',
      'description': 'Un incantevole giardino botanico creato tra le rovine di una città medievale dimenticata.',
      'image': 'assets/ima/11.webp',
      'couleur': const Color(0xFF2ECC71),
      'page': const JardinDeNinfaPage(),
    },
    {
      'nom': 'Rocca Calascio',
      'region': 'Italia Centrale',
      'description': 'La fortezza più alta degli Appennini, che offre una vista mozzafiato su paesaggi selvaggi e senza tempo.',
      'image': 'assets/ima/18.webp',
      'couleur': const Color(0xFF99A3A4),
      'page': const RoccaCalascioPage(),
    },
    {
      'nom': 'Il Giardino dei Tarocchi',
      'region': 'Italia Centrale',
      'description': 'Un parco artistico surrealista ispirato agli arcani maggiori dei Tarocchi, dalle forme e dai colori vibranti.',
      'image': 'assets/ima/22.webp',
      'couleur': const Color(0xFFCB4335),
      'page': const GiardinoDeiTarocchiPage(),
    },

    // ==========================================
    // ITALIA MERIDIONALE
    // ==========================================
    {
      'nom': 'Cascate di San Fele',
      'region': 'Italia Meridionale',
      'description': 'Uno spettacolo naturale di acque vive nascosto nel cuore di un bosco selvaggio, lussureggiante e incontaminato.',
      'image': 'assets/images/14.jpeg',
      'couleur': const Color(0xFF27AE60),
      'page': const ChutesDeSanFelePage(),
    },
    {
      'nom': 'Lugano',
      'region': 'Lombardia',
      'description': 'Una perla sulle sponde del lago, che unisce eleganza mediterranea e spettacolari panorami alpini.',
      'image': 'assets/imag/2.jpg',
      'couleur': const Color(0xFF5DADE2),
      'page': const LuganoPage(),
    },
    {
      'nom': 'Fiordo di Furore',
      'region': 'Italia Meridionale',
      'description': 'Un fiordo spettacolare nascosto sulla Costiera Amalfitana, tra scogliere scoscese e acque turchesi.',
      'image': 'assets/imag/16.webp',
      'couleur': const Color(0xFF3498DB),
      'page': const FurorePage(),
    },
    {
      'nom': 'Isole Tremiti',
      'region': 'Italia Meridionale',
      'description': 'Un arcipelago incontaminato, gioiello del mare Adriatico con acque cristalline e ricchi fondali marini.',
      'image': 'assets/imag/21.webp',
      'couleur': const Color(0xFF2E86C1),
      'page': const IlesTremitiPage(),
    },
    {
      'nom': 'Alberobello',
      'region': 'Italia Meridionale',
      'description': 'Fiaba architettonica celebre per i suoi trulli, tipiche case in pietra dai tetti conici.',
      'image': 'assets/ima/33.jpg',
      'couleur': const Color(0xFFF7DC6F),
      'page': const AlberobelloPage(),
    },
    {
      'nom': 'Grotte di Castellana',
      'region': 'Italia Meridionale',
      'description': 'Un viaggio affascinante nelle profondità della terra, tra concrezioni calcaree dalle forme straordinarie.',
      'image': 'assets/ima/38.jpg',
      'couleur': const Color(0xFF85929E),
      'page': const GrottesCastellanaPage(),
    },
    {
      'nom': 'Ischia',
      'region': 'Italia Meridionale',
      'description': 'L\'isola verde, celebre per i suoi rigogliosi parchi termali e i paesaggi vulcanici a picco sul mare.',
      'image': 'assets/ima/39.webp',
      'couleur': const Color(0xFF58D68D),
      'page': const IschiaPage(),
    },

    // ==========================================
    // SICILIA
    // ==========================================
    {
      'nom': 'Saline di Margherita di Savoia',
      'region': 'Sicilia',
      'description': 'La salina più grande d\'Europa, un santuario magico e protetto per i fenicotteri rosa.',
      'image': 'assets/images/24.jpg',
      'couleur': const Color(0xFFF1C40F),
      'page': const MaraisSalantsPage(),
    },
    {
      'nom': 'Grotta Mangiapane',
      'region': 'Sicilia',
      'description': 'Un borgo trogloditico pietrificato nel tempo, incastonato nella nicchia di un\'immensa parete calcarea.',
      'image': 'assets/imag/11.webp',
      'couleur': const Color(0xFFD35400),
      'page': const GrotteMangiapanePage(),
    },
    {
      'nom': 'Scala dei Turchi',
      'region': 'Sicilia',
      'description': 'Una falesia di bianco calcare brillante che si tuffa in un mare azzurro, creando una scalinata naturale unica.',
      'image': 'assets/ima/15.webp',
      'couleur': const Color(0xFFFDFEFE),
      'page': const ScalaDeiTurchiPage(),
    },
    {
      'nom': 'Sicilia Vulcanica',
      'region': 'Sicilia',
      'description': 'Paesaggi lunari ed eruzioni maestose modellati dalla forza del fuoco sotterraneo.',
      'image': 'assets/ima/27.jpeg',
      'couleur': const Color(0xFFC0392B),
      'page': const SicileVolcaniquePage(),
    },
  ];

  @override
  void initState() {
    super.initState();
    _chargerFavoris();
  }

  Future<void> _chargerFavoris() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _favoris = prefs.getStringList(_cleStockage)?.toSet() ?? {};
    });
  }

  Future<void> _toggleFavori(String nom) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      if (_favoris.contains(nom)) {
        _favoris.remove(nom);
      } else {
        _favoris.add(nom);
      }
    });
    await prefs.setStringList(_cleStockage, _favoris.toList());
  }

  Future<void> _ouvrirMaps(String nom) async {
    final Uri geoUri = Uri.parse('geo:0,0?q=${Uri.encodeComponent(nom)}');
    if (await canLaunchUrl(geoUri)) {
      await launchUrl(geoUri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedIndex == 1) _filtreActif.add('Favoriti');
    else _filtreActif.remove('Favoriti');

    final themesFiltres = _selectedIndex == 0
        ? destinations
        : destinations.where((d) => _favoris.contains(d['nom'])).toList();

    return PopScope(
      canPop: _selectedIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _selectedIndex != 0) {
          setState(() => _selectedIndex = 0);
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 22),
                          onPressed: () {
                            if (_selectedIndex != 0) {
                              setState(() => _selectedIndex = 0);
                            } else {
                              Navigator.pop(context);
                            }
                          }
                      ),
                      const Text('Vera Italia', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                      const Spacer(),
                      GestureDetector(onTap: () => setState(() => _selectedIndex = 0), child: Icon(Icons.home_filled, color: _selectedIndex == 0 ? primaryColor : Colors.grey[600], size: 28)),
                      const SizedBox(width: 15),
                      GestureDetector(onTap: () => setState(() => _selectedIndex = 1), child: Icon(_selectedIndex == 1 ? Icons.favorite : Icons.favorite_border, color: _selectedIndex == 1 ? primaryColor : Colors.grey[600], size: 28)),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    if (themesFiltres.isEmpty) {
                      if (_filtreActif.contains('Favoriti')) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.favorite, size: 90, color: Colors.redAccent.withOpacity(0.8)),
                              const SizedBox(height: 20),
                              Text("Non hai ancora preferiti", style: GoogleFonts.cinzel(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                              const SizedBox(height: 12),
                              Text("Esplora le destinazioni e premi il cuore\nper costruire qui il tuo diario di viaggio.", style: GoogleFonts.montserrat(color: Colors.white54, fontSize: 13, height: 1.5), textAlign: TextAlign.center),
                            ],
                          ),
                        );
                      } else {
                        return const SizedBox(height: 200, child: Center(child: Text("Nessun luogo trovato", style: TextStyle(color: Colors.white54))));
                      }
                    }
                    final dest = themesFiltres[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: _buildDestinationCard(dest, 200),
                    );
                  },
                  childCount: themesFiltres.isEmpty ? 1 : themesFiltres.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDestinationCard(Map<String, dynamic> destination, double imageHeight) {
    final bool estFavori = _favoris.contains(destination['nom']);
    final Color themeColor = destination['couleur'] as Color;

    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => destination['page'])),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: themeColor.withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 10))],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Image.asset(destination['image'], height: imageHeight, width: double.infinity, fit: BoxFit.cover),
                  Positioned(bottom: 10, left: 10, child: Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: Colors.black.withOpacity(0.6), borderRadius: BorderRadius.circular(6)), child: Text(destination['region'].toUpperCase(), style: TextStyle(color: themeColor, fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 1)))),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Text(destination['nom'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 18))),
                    GestureDetector(onTap: () => _ouvrirMaps(destination['nom']), child: const Icon(Icons.map_rounded, color: Colors.white, size: 22)),
                    const SizedBox(width: 15),
                    GestureDetector(onTap: () => _toggleFavori(destination['nom']), child: Icon(estFavori ? Icons.favorite : Icons.favorite_border, color: estFavori ? Colors.redAccent : Colors.white, size: 22)),
                  ],
                ),
                const SizedBox(height: 12),
                Text(destination['description'], style: const TextStyle(color: Color(0xFFB3B3B3), fontSize: 13, height: 1.5), maxLines: 4, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 16),
                Container(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), decoration: BoxDecoration(color: themeColor.withOpacity(0.15), borderRadius: BorderRadius.circular(24)), child: Text('Clicca per scoprire', style: TextStyle(color: themeColor, fontSize: 12, fontWeight: FontWeight.bold))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}