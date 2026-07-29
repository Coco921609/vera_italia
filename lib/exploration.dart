import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'français/Lac de Resia.dart';
import 'français/Parc de Bomarzo.dart';
import 'français/Chutes de San Fele.dart';
import 'français/Marais salants de Margherita di Savoia.dart';
import 'français bis/Lugano.dart';
import 'français bis/Grottes de Frasassi.dart';
import 'français bis/Grotte Mangiapane.dart';
import 'français bis/Furore.dart';
import 'français bis/Les îles Tremiti.dart';
import 'français bis/Le val d’Orcia.dart';
import 'français bis/Civita di Bagnoregio.dart';
import 'français bis/Le jardin de Ninfa.dart';
import 'français bis/La Scala dei Turchi.dart';
import 'français bis/Rocca Calascio.dart';
import 'français bis/Il Giardino dei Tarocchi.dart';
import 'français bis/La Sicile volcanique.dart';
import 'français bis/Ischia.dart';
import 'français bis/Grottes de Castellana.dart';
import 'français bis/Alberobello.dart';
import 'français bis/Les Dolomites.dart';

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
    // ITALIE DU NORD
    // ==========================================
    {
      'nom': 'Lac de Resia',
      'region': 'Italie du Nord',
      'description': 'Un clocher mystérieux émergeant des eaux alpines grandioses, témoin fascinant d\'un village englouti.',
      'image': 'assets/images/2.jpg',
      'couleur': const Color(0xFF40E0D0),
      'page': const LacDeResiaPage(),
    },
    {
      'nom': 'Les Dolomites',
      'region': 'Italie du Nord',
      'description': 'Des sommets acérés aux reflets rosés, un paradis pour les amoureux de la montagne et des grands espaces.',
      'image': 'assets/ima/28.jpeg',
      'couleur': const Color(0xFFAED6F1),
      'page': const DolomitesPage(),
    },

    // ==========================================
    // ITALIE CENTRALE
    // ==========================================
    {
      'nom': 'Parc de Bomarzo',
      'region': 'Italie centrale',
      'description': 'Un jardin mystique peuplé de sculptures de monstres gigantesques et de créatures mythologiques.',
      'image': 'assets/images/9.jpg',
      'couleur': const Color(0xFFD4AC0D),
      'page': const ParcBomarzoPage(),
    },
    {
      'nom': 'Grottes de Frasassi',
      'region': 'Italie centrale',
      'description': 'Un royaume souterrain spectaculaire fait de stalactites et de stalagmites monumentales.',
      'image': 'assets/imag/10.jpg',
      'couleur': const Color(0xFF7F8C8D),
      'page': const GrottesDeFrasassiPage(),
    },
    {
      'nom': 'Le val d’Orcia',
      'region': 'Italie centrale',
      'description': 'Un paysage de collines ondulantes, de cyprès et de villages médiévaux, véritable icône de la Toscane.',
      'image': 'assets/imag/30.webp',
      'couleur': const Color(0xFFE67E22),
      'page': const ValDOrciaPage(),
    },
    {
      'nom': 'Civita di Bagnoregio',
      'region': 'Italie centrale',
      'description': 'La ville qui meurt, un village suspendu sur un plateau volcanique, accessible seulement par une passerelle.',
      'image': 'assets/ima/4.webp',
      'couleur': const Color(0xFFA04000),
      'page': const CivitaDiBagnoregioPage(),
    },
    {
      'nom': 'Le jardin de Ninfa',
      'region': 'Italie centrale',
      'description': 'Un jardin botanique enchanteur construit au milieu des ruines d\'une cité médiévale oubliée.',
      'image': 'assets/ima/11.webp',
      'couleur': const Color(0xFF2ECC71),
      'page': const JardinDeNinfaPage(),
    },
    {
      'nom': 'Rocca Calascio',
      'region': 'Italie centrale',
      'description': 'La forteresse la plus haute des Apennins, offrant une vue imprenable sur des paysages sauvages et intemporels.',
      'image': 'assets/ima/18.webp',
      'couleur': const Color(0xFF99A3A4),
      'page': const RoccaCalascioPage(),
    },
    {
      'nom': 'Il Giardino dei Tarocchi',
      'region': 'Italie centrale',
      'description': 'Un parc artistique surréaliste inspiré par les arcanes majeurs du Tarot, aux formes et couleurs vibrantes.',
      'image': 'assets/ima/22.webp',
      'couleur': const Color(0xFFCB4335),
      'page': const GiardinoDeiTarocchiPage(),
    },

    // ==========================================
    // ITALIE DU SUD
    // ==========================================
    {
      'nom': 'Chutes de San Fele',
      'region': 'Italie du Sud',
      'description': 'Un spectacle naturel d\'eau vive caché au cœur d\'une forêt sauvage, luxuriante et préservée.',
      'image': 'assets/images/14.jpeg',
      'couleur': const Color(0xFF27AE60),
      'page': const ChutesDeSanFelePage(),
    },
    {
      'nom': 'Lugano',
      'region': 'Lombardie', // Note : Géographiquement en Lombardie/Suisse mais classé ici pour suivre ton découpage initial
      'description': 'Une perle au bord du lac, mêlant élégance méditerranéenne et panoramas alpins saisissants.',
      'image': 'assets/imag/2.jpg',
      'couleur': const Color(0xFF5DADE2),
      'page': const LuganoPage(),
    },
    {
      'nom': 'Furore',
      'region': 'Italie du Sud',
      'description': 'Un fjord spectaculaire caché sur la côte amalfitaine, entre falaises abruptes et eaux turquoise.',
      'image': 'assets/imag/16.webp',
      'couleur': const Color(0xFF3498DB),
      'page': const FurorePage(),
    },
    {
      'nom': 'Les îles Tremiti',
      'region': 'Italie du Sud',
      'description': 'Un archipel préservé, joyau de la mer Adriatique aux eaux cristallines et fonds marins riches.',
      'image': 'assets/imag/21.webp',
      'couleur': const Color(0xFF2E86C1),
      'page': const IlesTremitiPage(),
    },
    {
      'nom': 'Alberobello',
      'region': 'Italie du Sud',
      'description': 'Un conte de fées architectural célèbre pour ses trulli, maisons en pierre aux toits coniques typiques.',
      'image': 'assets/ima/33.jpg',
      'couleur': const Color(0xFFF7DC6F),
      'page': const AlberobelloPage(),
    },
    {
      'nom': 'Grottes de Castellana',
      'region': 'Italie du Sud',
      'description': 'Un voyage fascinant dans les profondeur de la terre, parmi des concrétions calcaires aux formes étonnantes.',
      'image': 'assets/ima/38.jpg',
      'couleur': const Color(0xFF85929E),
      'page': const GrottesCastellanaPage(),
    },
    {
      'nom': 'Ischia',
      'region': 'Italie du Sud',
      'description': 'L\'île verte, célèbre pour ses jardins thermaux luxueux et ses paysages volcaniques surplombant la mer.',
      'image': 'assets/ima/39.webp',
      'couleur': const Color(0xFF58D68D),
      'page': const IschiaPage(),
    },

    // ==========================================
    // SICILE
    // ==========================================
    {
      'nom': 'Marais salants de Margherita di Savoia',
      'region': 'Sicile',
      'description': 'Le plus grand marais salant d\'Europe, sanctuaire magique et protégé des flamants roses.',
      'image': 'assets/images/24.jpg',
      'couleur': const Color(0xFFF1C40F),
      'page': const MaraisSalantsPage(),
    },
    {
      'nom': 'Grotte Mangiapane',
      'region': 'Sicile',
      'description': 'Un village troglodyte figé dans le temps, niché au creux d\'une immense falaise calcaire.',
      'image': 'assets/imag/11.webp',
      'couleur': const Color(0xFFD35400),
      'page': const GrotteMangiapanePage(),
    },
    {
      'nom': 'La Scala dei Turchi',
      'region': 'Sicile',
      'description': 'Une falaise de calcaire blanc éclatant plongeant dans une mer azur, formant un escalier naturel unique.',
      'image': 'assets/ima/15.webp',
      'couleur': const Color(0xFFFDFEFE),
      'page': const ScalaDeiTurchiPage(),
    },
    {
      'nom': 'La Sicile volcanique',
      'region': 'Sicile',
      'description': 'Des paysages lunaires et des éruptions majestueuses façonnés par la puissance du feu souterrain.',
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
    if (_selectedIndex == 1) _filtreActif.add('Favoris');
    else _filtreActif.remove('Favoris');

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
                      const Text('Vraie Italie', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
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
                      if (_filtreActif.contains('Favoris')) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.favorite, size: 90, color: Colors.redAccent.withOpacity(0.8)),
                              const SizedBox(height: 20),
                              Text("Vous n'avez pas encore de favoris", style: GoogleFonts.cinzel(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                              const SizedBox(height: 12),
                              Text("Explorez les destinations et appuyez sur le cœur\npour construire votre carnet de voyage ici.", style: GoogleFonts.montserrat(color: Colors.white54, fontSize: 13, height: 1.5), textAlign: TextAlign.center),
                            ],
                          ),
                        );
                      } else {
                        return const SizedBox(height: 200, child: Center(child: Text("Aucun lieu trouvé", style: TextStyle(color: Colors.white54))));
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
                Container(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), decoration: BoxDecoration(color: themeColor.withOpacity(0.15), borderRadius: BorderRadius.circular(24)), child: Text('Cliquez pour découvrir', style: TextStyle(color: themeColor, fontSize: 12, fontWeight: FontWeight.bold))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}