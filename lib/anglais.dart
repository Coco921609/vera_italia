import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'anglais/Lac de Resia.dart';
import 'anglais/Parc de Bomarzo.dart';
import 'anglais/Chutes de San Fele.dart';
import 'anglais/Marais salants de Margherita di Savoia.dart';
import 'anglais bis/Lugano.dart';
import 'anglais bis/Grottes de Frasassi.dart';
import 'anglais bis/Grotte Mangiapane.dart';
import 'anglais bis/Furore.dart';
import 'anglais bis/Les îles Tremiti.dart';
import 'anglais bis/Le val d’Orcia.dart';
import 'anglais bis/Civita di Bagnoregio.dart';
import 'anglais bis/Le jardin de Ninfa.dart';
import 'anglais bis/La Scala dei Turchi.dart';
import 'anglais bis/Rocca Calascio.dart';
import 'anglais bis/Il Giardino dei Tarocchi.dart';
import 'anglais bis/La Sicile volcanique.dart';
import 'anglais bis/Ischia.dart';
import 'anglais bis/Grottes de Castellana.dart';
import 'anglais bis/Alberobello.dart';
import 'anglais bis/Les Dolomites.dart';

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
    // NORTHERN ITALY
    // ==========================================
    {
      'nom': 'Lake Resia',
      'region': 'Northern Italy',
      'description': 'A mysterious bell tower emerging from majestic alpine waters, a fascinating witness to a submerged village.',
      'image': 'assets/images/2.jpg',
      'couleur': const Color(0xFF40E0D0),
      'page': const LacDeResiaPage(),
    },
    {
      'nom': 'The Dolomites',
      'region': 'Northern Italy',
      'description': 'Sharp peaks with rosy hues, a paradise for lovers of mountains and wide-open spaces.',
      'image': 'assets/ima/28.jpeg',
      'couleur': const Color(0xFFAED6F1),
      'page': const DolomitesPage(),
    },

    // ==========================================
    // CENTRAL ITALY
    // ==========================================
    {
      'nom': 'Park of the Monsters (Bomarzo)',
      'region': 'Central Italy',
      'description': 'A mystical garden populated by gigantic monster sculptures and mythological creatures.',
      'image': 'assets/images/9.jpg',
      'couleur': const Color(0xFFD4AC0D),
      'page': const ParcBomarzoPage(),
    },
    {
      'nom': 'Frasassi Caves',
      'region': 'Central Italy',
      'description': 'A spectacular underground realm made of monumental stalactites and stalagmites.',
      'image': 'assets/imag/10.jpg',
      'couleur': const Color(0xFF7F8C8D),
      'page': const GrottesDeFrasassiPage(),
    },
    {
      'nom': 'Val d’Orcia',
      'region': 'Central Italy',
      'description': 'A landscape of rolling hills, cypress trees, and medieval villages, a true icon of Tuscany.',
      'image': 'assets/imag/30.webp',
      'couleur': const Color(0xFFE67E22),
      'page': const ValDOrciaPage(),
    },
    {
      'nom': 'Civita di Bagnoregio',
      'region': 'Central Italy',
      'description': 'The dying city, a village suspended on a volcanic plateau, accessible only by a footbridge.',
      'image': 'assets/ima/4.webp',
      'couleur': const Color(0xFFA04000),
      'page': const CivitaDiBagnoregioPage(),
    },
    {
      'nom': 'Garden of Ninfa',
      'region': 'Central Italy',
      'description': 'An enchanting botanical garden built amidst the ruins of a forgotten medieval city.',
      'image': 'assets/ima/11.webp',
      'couleur': const Color(0xFF2ECC71),
      'page': const JardinDeNinfaPage(),
    },
    {
      'nom': 'Rocca Calascio',
      'region': 'Central Italy',
      'description': 'The highest fortress in the Apennines, offering breathtaking views of wild and timeless landscapes.',
      'image': 'assets/ima/18.webp',
      'couleur': const Color(0xFF99A3A4),
      'page': const RoccaCalascioPage(),
    },
    {
      'nom': 'Tarot Garden',
      'region': 'Central Italy',
      'description': 'A surrealist art park inspired by the Major Arcana of the Tarot, filled with vibrant shapes and colors.',
      'image': 'assets/ima/22.webp',
      'couleur': const Color(0xFFCB4335),
      'page': const GiardinoDeiTarocchiPage(),
    },

    // ==========================================
    // SOUTHERN ITALY
    // ==========================================
    {
      'nom': 'Waterfalls of San Fele',
      'region': 'Southern Italy',
      'description': 'A natural spectacle of rushing water hidden in the heart of a wild, lush, and preserved forest.',
      'image': 'assets/images/14.jpeg',
      'couleur': const Color(0xFF27AE60),
      'page': const ChutesDeSanFelePage(),
    },
    {
      'nom': 'Lugano',
      'region': 'Lombardy', // Note: Geographically in Lombardy/Switzerland but classified here to follow original structure
      'description': 'A pearl on the lakefront, blending Mediterranean elegance with striking alpine panoramas.',
      'image': 'assets/imag/2.jpg',
      'couleur': const Color(0xFF5DADE2),
      'page': const LuganoPage(),
    },
    {
      'nom': 'Furore Fjord',
      'region': 'Southern Italy',
      'description': 'A spectacular fjord hidden on the Amalfi Coast, tucked between steep cliffs and turquoise waters.',
      'image': 'assets/imag/16.webp',
      'couleur': const Color(0xFF3498DB),
      'page': const FurorePage(),
    },
    {
      'nom': 'Tremiti Islands',
      'region': 'Southern Italy',
      'description': 'A preserved archipelago, a jewel of the Adriatic Sea with crystal-clear waters and rich marine life.',
      'image': 'assets/imag/21.webp',
      'couleur': const Color(0xFF2E86C1),
      'page': const IlesTremitiPage(),
    },
    {
      'nom': 'Alberobello',
      'region': 'Southern Italy',
      'description': 'An architectural fairytale world famous for its trulli, traditional stone houses with conical roofs.',
      'image': 'assets/ima/33.jpg',
      'couleur': const Color(0xFFF7DC6F),
      'page': const AlberobelloPage(),
    },
    {
      'nom': 'Castellana Caves',
      'region': 'Southern Italy',
      'description': 'A fascinating journey into the depths of the earth, amidst limestone formations with astonishing shapes.',
      'image': 'assets/ima/38.jpg',
      'couleur': const Color(0xFF85929E),
      'page': const GrottesCastellanaPage(),
    },
    {
      'nom': 'Ischia',
      'region': 'Southern Italy',
      'description': 'The Green Island, famous for its luxurious thermal gardens and volcanic landscapes overlooking the sea.',
      'image': 'assets/ima/39.webp',
      'couleur': const Color(0xFF58D68D),
      'page': const IschiaPage(),
    },

    // ==========================================
    // SICILY
    // ==========================================
    {
      'nom': 'Salt Pans of Margherita di Savoia',
      'region': 'Sicily',
      'description': 'The largest salt pan in Europe, a magical and protected sanctuary for pink flamingos.',
      'image': 'assets/images/24.jpg',
      'couleur': const Color(0xFFF1C40F),
      'page': const MaraisSalantsPage(),
    },
    {
      'nom': 'Mangiapane Cave',
      'region': 'Sicily',
      'description': 'A cave-dwelling village frozen in time, nestled inside a massive limestone cliff.',
      'image': 'assets/imag/11.webp',
      'couleur': const Color(0xFFD35400),
      'page': const GrotteMangiapanePage(),
    },
    {
      'nom': 'Stair of the Turks (Scala dei Turchi)',
      'region': 'Sicily',
      'description': 'A dazzling white limestone cliff plunging into an azure sea, forming a unique natural staircase.',
      'image': 'assets/ima/15.webp',
      'couleur': const Color(0xFFFDFEFE),
      'page': const ScalaDeiTurchiPage(),
    },
    {
      'nom': 'Volcanic Sicily',
      'region': 'Sicily',
      'description': 'Lunar landscapes and majestic eruptions shaped by the raw power of underground fire.',
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
    if (_selectedIndex == 1) _filtreActif.add('Favorites');
    else _filtreActif.remove('Favorites');

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
                      const Text('Real Italy', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
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
                      if (_filtreActif.contains('Favorites')) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.favorite, size: 90, color: Colors.redAccent.withOpacity(0.8)),
                              const SizedBox(height: 20),
                              Text("You don't have any favorites yet", style: GoogleFonts.cinzel(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                              const SizedBox(height: 12),
                              Text("Explore destinations and tap the heart\nto build your travel journal here.", style: GoogleFonts.montserrat(color: Colors.white54, fontSize: 13, height: 1.5), textAlign: TextAlign.center),
                            ],
                          ),
                        );
                      } else {
                        return const SizedBox(height: 200, child: Center(child: Text("No places found", style: TextStyle(color: Colors.white54))));
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
                    const SizedBox(width: 15), // Espace de sécurité pour éviter le collage avec l'icône Maps
                    GestureDetector(onTap: () => _ouvrirMaps(destination['nom']), child: const Icon(Icons.map_rounded, color: Colors.white, size: 22)),
                    const SizedBox(width: 15),
                    GestureDetector(onTap: () => _toggleFavori(destination['nom']), child: Icon(estFavori ? Icons.favorite : Icons.favorite_border, color: estFavori ? Colors.redAccent : Colors.white, size: 22)),
                  ],
                ),
                const SizedBox(height: 12),
                Text(destination['description'], style: const TextStyle(color: Color(0xFFB3B3B3), fontSize: 13, height: 1.5), maxLines: 4, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 16),
                Container(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), decoration: BoxDecoration(color: themeColor.withOpacity(0.15), borderRadius: BorderRadius.circular(24)), child: Text('Click to discover', style: TextStyle(color: themeColor, fontSize: 12, fontWeight: FontWeight.bold))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}