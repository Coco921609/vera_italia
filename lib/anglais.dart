import 'dart:math' as math;
import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class _TravelHomeScreenState extends State<TravelHomeScreen>
    with TickerProviderStateMixin {
  Set<String> _favoris = {};
  final String _cleStockage = 'favoris_destinations';
  int _selectedIndex = 0;
  String _region = 'All';
  final Color primaryColor = const Color(0xFFFF5A5F);

  // Animations : intro de l'en-tête (une fois) + respiration en boucle
  late final AnimationController _entree;
  late final AnimationController _boucle;

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
    _entree = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1300),
    )..forward();
    _boucle = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 9),
    )..repeat();
    _chargerFavoris();
  }

  @override
  void dispose() {
    _entree.dispose();
    _boucle.dispose();
    super.dispose();
  }

  Future<void> _chargerFavoris() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      _favoris = prefs.getStringList(_cleStockage)?.toSet() ?? {};
    });
  }

  Future<void> _toggleFavori(String nom) async {
    final prefs = await SharedPreferences.getInstance();
    HapticFeedback.lightImpact();
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

  // Onde douce 0..1 qui dépend de la boucle (phase = décalage entre éléments)
  double _onde(double phase) =>
      0.5 + 0.5 * math.sin(2 * math.pi * (_boucle.value + phase));

  // Apparition échelonnée des éléments de l'en-tête
  Widget _apparaitre(
      double debut,
      Widget child, {
        Offset decalage = const Offset(0, -16),
        bool pop = false,
      }) {
    return AnimatedBuilder(
      animation: _entree,
      child: child,
      builder: (context, c) {
        final v = Interval(
          debut,
          math.min(1.0, debut + 0.5),
          curve: pop ? Curves.easeOutBack : Curves.easeOutCubic,
        ).transform(_entree.value);
        final op = v.clamp(0.0, 1.0).toDouble();
        if (pop) {
          return Opacity(opacity: op, child: Transform.scale(scale: v, child: c));
        }
        return Opacity(
          opacity: op,
          child: Transform.translate(
            offset: Offset(decalage.dx * (1 - v), decalage.dy * (1 - v)),
            child: c,
          ),
        );
      },
    );
  }

  // Icône qui change en douceur (forme + couleur)
  Widget _icone(IconData icone, Color couleur, double taille) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 380),
      transitionBuilder: (child, anim) => ScaleTransition(
        scale: CurvedAnimation(
          parent: anim,
          curve: Curves.easeOutBack,
          reverseCurve: Curves.easeIn,
        ),
        child: FadeTransition(opacity: anim, child: child),
      ),
      child: TweenAnimationBuilder<Color?>(
        key: ValueKey(icone),
        tween: ColorTween(end: couleur),
        duration: const Duration(milliseconds: 300),
        builder: (context, c, _) => Icon(icone, color: c, size: taille),
      ),
    );
  }

  // -------------------------------------------------------------------------
  //  BRIQUES DE DESIGN
  // -------------------------------------------------------------------------

  static const Color _fond = Color(0xFF0A0A0F);

  List<String> get _regions => [
    'All',
    ...destinations.map((d) => d['region'] as String).toSet(),
  ];

  /// Effet « verre dépoli »
  Widget _verre({
    required Widget child,
    double radius = 30,
    EdgeInsets padding = EdgeInsets.zero,
    double opacite = 0.12,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(opacite),
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: Colors.white.withOpacity(0.18)),
          ),
          child: child,
        ),
      ),
    );
  }

  Widget _boutonVerre({required Widget icone, required VoidCallback onTap, double taille = 44}) {
    return _Pressable(
      scale: 0.85,
      onTap: onTap,
      child: _verre(
        radius: taille / 2,
        child: SizedBox(width: taille, height: taille, child: Center(child: icone)),
      ),
    );
  }

  Widget _halo(Color c, double taille, double opacite) => Container(
    width: taille,
    height: taille,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: RadialGradient(colors: [c.withOpacity(opacite), c.withOpacity(0)]),
    ),
  );

  /// Lueurs d'ambiance qui flottent lentement derrière le contenu
  Widget _ambiance() {
    return Positioned.fill(
      child: IgnorePointer(
        child: AnimatedBuilder(
          animation: _boucle,
          builder: (context, _) {
            final t = _onde(0);
            return Stack(
              children: [
                Positioned(top: -150 + 24 * t, right: -130, child: _halo(primaryColor, 400, 0.22)),
                Positioned(top: 360 - 30 * t, left: -170, child: _halo(const Color(0xFF3A6BFF), 380, 0.10)),
                Positioned(top: 900 + 20 * t, right: -160, child: _halo(const Color(0xFFFFB347), 360, 0.08)),
              ],
            );
          },
        ),
      ),
    );
  }

  /// Sélecteur Découvrir / Favoris avec pastille qui glisse
  Widget _onglets() {
    Widget onglet(int i, IconData icone, String label) {
      final actif = _selectedIndex == i;
      return Expanded(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            HapticFeedback.selectionClick();
            setState(() => _selectedIndex = i);
          },
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icone, size: 18, color: actif ? Colors.white : Colors.white54),
                const SizedBox(width: 8),
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 250),
                  style: GoogleFonts.montserrat(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w600,
                    color: actif ? Colors.white : Colors.white54,
                  ),
                  child: Text(label),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Container(
      height: 54,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 420),
            curve: Curves.easeOutCubic,
            alignment: _selectedIndex == 0 ? Alignment.centerLeft : Alignment.centerRight,
            child: FractionallySizedBox(
              widthFactor: 0.5,
              heightFactor: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  gradient: LinearGradient(colors: [primaryColor, const Color(0xFFFF8A5F)]),
                  boxShadow: [
                    BoxShadow(color: primaryColor.withOpacity(0.4), blurRadius: 16, offset: const Offset(0, 6)),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              onglet(0, Icons.explore_rounded, 'Discover'),
              onglet(1, Icons.favorite_rounded, 'Favorites · ${_favoris.length}'),
            ],
          ),
        ],
      ),
    );
  }

  /// Puces de filtre par région
  Widget _puces() {
    final regions = _regions;
    return SizedBox(
      height: 42,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemCount: regions.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, i) {
          final r = regions[i];
          final actif = r == _region;
          return _Pressable(
            scale: 0.93,
            onTap: () {
              HapticFeedback.selectionClick();
              setState(() => _region = r);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: actif ? Colors.white : Colors.white.withOpacity(0.06),
                borderRadius: BorderRadius.circular(21),
                border: Border.all(color: Colors.white.withOpacity(actif ? 0 : 0.10)),
              ),
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: GoogleFonts.montserrat(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: actif ? Colors.black : Colors.white70,
                ),
                child: Text(r),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _etatVide() {
    final bool favoris = _selectedIndex == 1 && _favoris.isEmpty;
    return _Apparition(
      key: ValueKey('vide-$_selectedIndex-$_region'),
      index: 0,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _boucle,
              child: Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor.withOpacity(0.12),
                  border: Border.all(color: primaryColor.withOpacity(0.3)),
                ),
                child: Icon(
                  favoris ? Icons.favorite_rounded : Icons.travel_explore_rounded,
                  size: 48,
                  color: primaryColor,
                ),
              ),
              builder: (context, c) => Transform.scale(scale: 1.0 + 0.07 * _onde(0), child: c),
            ),
            const SizedBox(height: 28),
            Text(
              favoris ? 'Your journal is empty' : 'Nothing to see here',
              style: GoogleFonts.playfairDisplay(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              favoris
                  ? 'Tap the heart on a destination\nto build your travel journal.'
                  : 'No destinations in this region.\nTry another filter.',
              style: GoogleFonts.montserrat(color: Colors.white54, fontSize: 13, height: 1.6),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // -------------------------------------------------------------------------
  //  ÉCRAN
  // -------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final bool surFavoris = _selectedIndex == 1;
    final liste = destinations.where((d) {
      if (surFavoris && !_favoris.contains(d['nom'])) return false;
      if (_region != 'All' && d['region'] != _region) return false;
      return true;
    }).toList();

    return PopScope(
      canPop: _selectedIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _selectedIndex != 0) {
          setState(() => _selectedIndex = 0);
        }
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          backgroundColor: _fond,
          body: Stack(
            children: [
              _ambiance(),
              CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  // ---------- En-tête ----------
                  SliverToBoxAdapter(
                    child: SafeArea(
                      bottom: false,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                _apparaitre(
                                  0.0,
                                  _boutonVerre(
                                    icone: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 18),
                                    onTap: () {
                                      if (_selectedIndex != 0) {
                                        setState(() => _selectedIndex = 0);
                                      } else {
                                        Navigator.pop(context);
                                      }
                                    },
                                  ),
                                  decalage: const Offset(-14, 0),
                                ),
                                const Spacer(),
                                _apparaitre(
                                  0.15,
                                  _verre(
                                    radius: 22,
                                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.favorite_rounded, size: 15, color: primaryColor),
                                        const SizedBox(width: 6),
                                        Text(
                                          '${_favoris.length}',
                                          style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ),
                                  pop: true,
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            _apparaitre(
                              0.1,
                              Text(
                                'THE JOURNEY STARTS HERE',
                                style: GoogleFonts.montserrat(
                                  color: primaryColor,
                                  fontSize: 11,
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              decalage: const Offset(-18, 0),
                            ),
                            const SizedBox(height: 8),
                            _apparaitre(
                              0.2,
                              Text(
                                'Real Italy',
                                style: GoogleFonts.playfairDisplay(
                                  color: Colors.white,
                                  fontSize: 46,
                                  fontWeight: FontWeight.w700,
                                  height: 1.05,
                                ),
                              ),
                              decalage: const Offset(-22, 0),
                            ),
                            const SizedBox(height: 10),
                            _apparaitre(
                              0.3,
                              Text(
                                '${destinations.length} hidden places, far from the beaten path.',
                                style: GoogleFonts.montserrat(color: Colors.white54, fontSize: 14, height: 1.5),
                              ),
                              decalage: const Offset(-18, 0),
                            ),
                            const SizedBox(height: 26),
                            _apparaitre(0.4, _onglets(), decalage: const Offset(0, 18)),
                            const SizedBox(height: 18),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // ---------- Filtres ----------
                  SliverToBoxAdapter(
                    child: _apparaitre(0.55, _puces(), decalage: const Offset(24, 0)),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 26)),

                  // ---------- Cartes ----------
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (context, index) {
                          if (liste.isEmpty) return _etatVide();
                          final dest = liste[index];
                          return _Apparition(
                            key: ValueKey('$_selectedIndex-$_region-${dest['nom']}'),
                            index: index,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 28),
                              child: _buildDestinationCard(dest, index: index),
                            ),
                          );
                        },
                        childCount: liste.isEmpty ? 1 : liste.length,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: MediaQuery.of(context).padding.bottom + 24)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDestinationCard(Map<String, dynamic> destination, {int index = 0}) {
    final bool estFavori = _favoris.contains(destination['nom']);
    final Color themeColor = destination['couleur'] as Color;
    final double phase = (index % 7) / 7;
    final Color surTheme = themeColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;

    return _Pressable(
      scale: 0.975,
      onTap: () => Navigator.push(
        context,
        _RouteItalie(builder: (context) => destination['page'] as Widget),
      ),
      child: Container(
        height: 410,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(34),
          boxShadow: [
            BoxShadow(
              color: themeColor.withOpacity(0.30),
              blurRadius: 40,
              spreadRadius: -8,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(34),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Photo avec zoom très lent (Ken Burns)
              AnimatedBuilder(
                animation: _boucle,
                child: Image.asset(
                  destination['image'],
                  fit: BoxFit.cover,
                  frameBuilder: (context, child, frame, sync) {
                    if (sync) return child;
                    return AnimatedOpacity(
                      opacity: frame == null ? 0 : 1,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeOut,
                      child: child,
                    );
                  },
                  errorBuilder: (context, error, stack) => Container(
                    color: themeColor.withOpacity(0.25),
                    alignment: Alignment.center,
                    child: Icon(Icons.landscape_rounded, color: themeColor, size: 56),
                  ),
                ),
                builder: (context, image) => Transform.scale(
                  scale: 1.05 + 0.06 * _onde(phase),
                  child: image,
                ),
              ),

              // Dégradé sombre (lisibilité du texte)
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.0, 0.28, 0.55, 1.0],
                      colors: [
                        Colors.black.withOpacity(0.45),
                        Colors.transparent,
                        Colors.black.withOpacity(0.35),
                        Colors.black.withOpacity(0.92),
                      ],
                    ),
                  ),
                ),
              ),

              // Teinte colorée de la destination en bas
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.center,
                      colors: [themeColor.withOpacity(0.28), Colors.transparent],
                    ),
                  ),
                ),
              ),

              // Liseré lumineux
              Positioned.fill(
                child: IgnorePointer(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(34),
                      border: Border.all(color: Colors.white.withOpacity(0.10)),
                    ),
                  ),
                ),
              ),

              // Haut : région + favori
              Positioned(
                top: 16,
                left: 16,
                right: 16,
                child: Row(
                  children: [
                    _verre(
                      radius: 18,
                      opacite: 0.14,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 7,
                            height: 7,
                            decoration: BoxDecoration(
                              color: themeColor,
                              shape: BoxShape.circle,
                              boxShadow: [BoxShadow(color: themeColor, blurRadius: 6)],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            (destination['region'] as String).toUpperCase(),
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    _boutonVerre(
                      taille: 44,
                      onTap: () => _toggleFavori(destination['nom']),
                      icone: _icone(
                        estFavori ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                        estFavori ? const Color(0xFFFF5A7A) : Colors.white,
                        22,
                      ),
                    ),
                  ],
                ),
              ),

              // Bas : titre, description, actions
              Positioned(
                left: 22,
                right: 22,
                bottom: 22,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 38,
                      height: 3,
                      decoration: BoxDecoration(
                        color: themeColor,
                        borderRadius: BorderRadius.circular(2),
                        boxShadow: [BoxShadow(color: themeColor.withOpacity(0.8), blurRadius: 8)],
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      destination['nom'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      destination['description'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                        color: Colors.white.withOpacity(0.72),
                        fontSize: 12.5,
                        height: 1.55,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        AnimatedBuilder(
                          animation: _boucle,
                          builder: (context, _) {
                            final o = _onde(phase + 0.25);
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
                              decoration: BoxDecoration(
                                color: themeColor,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: themeColor.withOpacity(0.30 + 0.25 * o),
                                    blurRadius: 12 + 10 * o,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Discover',
                                    style: GoogleFonts.montserrat(
                                      color: surTheme,
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Transform.translate(
                                    offset: Offset(2 * o, 0),
                                    child: Icon(Icons.arrow_forward_rounded, size: 16, color: surTheme),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        const Spacer(),
                        _boutonVerre(
                          taille: 44,
                          onTap: () => _ouvrirMaps(destination['nom']),
                          icone: const Icon(Icons.near_me_rounded, color: Colors.white, size: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// ---------------------------------------------------------------------------
//  ANIMATIONS
// ---------------------------------------------------------------------------

/// Apparition d'une carte : fondu + glissement vers le haut + léger zoom.
/// Les premières cartes arrivent l'une après l'autre ; les suivantes
/// apparaissent quand on fait défiler.
class _Apparition extends StatefulWidget {
  const _Apparition({super.key, required this.index, required this.child});

  final int index;
  final Widget child;

  @override
  State<_Apparition> createState() => _ApparitionState();
}

class _ApparitionState extends State<_Apparition>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final AnimationController _c;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );
    Future.delayed(Duration(milliseconds: 90 * math.min(widget.index, 5)), () {
      if (mounted) _c.forward();
    });
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AnimatedBuilder(
      animation: _c,
      child: widget.child,
      builder: (context, child) {
        final v = Curves.easeOutCubic.transform(_c.value);
        return Opacity(
          opacity: v,
          child: Transform.translate(
            offset: Offset(0, 46 * (1 - v)),
            child: Transform.scale(scale: 0.94 + 0.06 * v, child: child),
          ),
        );
      },
    );
  }
}

/// Réaction au toucher : l'élément s'enfonce légèrement puis revient.
class _Pressable extends StatefulWidget {
  const _Pressable({required this.onTap, required this.child, this.scale = 0.97});

  final VoidCallback onTap;
  final Widget child;
  final double scale;

  @override
  State<_Pressable> createState() => _PressableState();
}

class _PressableState extends State<_Pressable> {
  bool _appuye = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _appuye = true),
      onTapUp: (_) => setState(() => _appuye = false),
      onTapCancel: () => setState(() => _appuye = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _appuye ? widget.scale : 1.0,
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}

/// Même transition que la plateforme (donc le geste « retour » est conservé),
/// avec un fondu en plus et une durée un peu plus douce.
class _RouteItalie<T> extends MaterialPageRoute<T> {
  _RouteItalie({required super.builder});

  @override
  Duration get transitionDuration => const Duration(milliseconds: 520);

  @override
  Duration get reverseTransitionDuration => const Duration(milliseconds: 380);

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return FadeTransition(
      opacity: CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
      child: super.buildTransitions(context, animation, secondaryAnimation, child),
    );
  }
}