import 'dart:math' as math;

import 'package:flutter/material.dart';
// Utilisation de "as" pour donner un nom unique à chaque import
import 'exploration.dart' as fr;
import 'anglais.dart' as en;
import 'italien.dart' as it;

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage>
    with TickerProviderStateMixin {
  String _langue = 'fr';

  // Animation en boucle (trains, avion, eau, nuages...) : 120 s par cycle
  late final AnimationController _boucle;
  // Ouverture : fondu depuis le noir, joué une seule fois au lancement
  // (le cycle jour/nuit, lui, est piloté par _boucle)
  late final AnimationController _aube;

  @override
  void initState() {
    super.initState();
    _boucle = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 120),
    )..repeat();
    _aube = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 9),
    )..forward();
  }

  @override
  void dispose() {
    _boucle.dispose();
    _aube.dispose();
    super.dispose();
  }

  final Map<String, String> _nomsLangues = {
    'fr': 'Français',
    'en': 'English',
    'it': 'Italiano',
  };

  final Map<String, Map<String, String>> _textes = {
    'fr': {
      'titre': 'Vera Italia',
      'desc': 'Tout le monde connaît l\'Italie pour Venise, Rome ou Milan, mais personne ne connaît les endroits cachés, pourtant magnifiques.',
      'btn': 'Explorer le pays'
    },
    'en': {
      'titre': 'Vera Italia',
      'desc': 'Everyone knows Italy for Venice, Rome, or Milan, but no one knows the hidden, yet magnificent, places.',
      'btn': 'Explore the country'
    },
    'it': {
      'titre': 'Vera Italia',
      'desc': 'Tutti conoscono l\'Italia per Venezia, Roma o Milano, ma nessuno conosce i luoghi nascosti, eppure magnifici.',
      'btn': 'Esplora il paese'
    },
  };

  @override
  Widget build(BuildContext context) {
    final t = _textes[_langue]!;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final fond = Theme.of(context).scaffoldBackgroundColor;

    // La scène de Rome (390 px de large) couvre toute la page. La rue est
    // placée à 'ancre' x hauteur d'écran ; le texte commence sous l'aéroport
    // (qui se termine 146 px de scène sous la rue).
    final echelle = screenWidth / 390;
    final ancre = ((screenHeight - 320 - 146 * echelle) / screenHeight)
        .clamp(0.30, 0.46)
        .toDouble();
    final hautTexte = ancre * screenHeight + 146 * echelle;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: RepaintBoundary(
              child: CustomPaint(
                size: Size.infinite,
                painter: _ScenePainter(temps: _boucle, aube: _aube, ancre: ancre),
              ),
            ),
          ),
          Positioned(
            top: hautTexte,
            left: 0,
            right: 0,
            bottom: 0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    fond.withOpacity(0.0),
                    fond.withOpacity(0.93),
                    fond.withOpacity(0.97),
                  ],
                  stops: const [0.0, 0.12, 1.0],
                ),
              ),
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 22),
                        Text(
                          t['titre']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          t['desc']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: ['fr', 'en', 'it'].map((codeLangue) {
                            final isSelected = _langue == codeLangue;
                            return GestureDetector(
                              onTap: () => setState(() => _langue = codeLangue),
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 6),
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: isSelected ? const Color(0xFF2E65F3) : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: isSelected
                                        ? const Color(0xFF2E65F3)
                                        : Colors.grey.withOpacity(0.3),
                                  ),
                                ),
                                child: Text(
                                  _nomsLangues[codeLangue]!,
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white70
                                        : Colors.black87),
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2E65F3),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {
                              // REDIRECTION UTILISANT LES ALIAS
                              Widget pageSuivante;
                              if (_langue == 'en') {
                                pageSuivante = const en.TravelHomeScreen();
                              } else if (_langue == 'it') {
                                pageSuivante = const it.TravelHomeScreen();
                              } else {
                                pageSuivante = const fr.TravelHomeScreen();
                              }

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => pageSuivante),
                              );
                            },
                            child: Text(
                              t['btn']!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
//  SCÈNE D'OUVERTURE : Rome, du lever au coucher du soleil
//  Vatican (arrière-plan) · Colisée · Fontaine de Trevi · avion dans le ciel
//  · tunnel avec deux voies et deux trains qui circulent en sens inverse
//  · aéroport de Rome-Fiumicino sous le tunnel (terminal, tour, piste avec
//  décollage et atterrissage). La scène occupe toute la page.
//  Cycle de 120 s : lever (0-12 s) · jour · coucher (~68-80 s) · nuit + lune.
//  Tout est dessiné en code : aucune image, aucun asset.
//  Toile virtuelle de 390 x 440, mise à l'échelle automatiquement.
// ---------------------------------------------------------------------------

class _Etoile {
  const _Etoile(this.fx, this.fy, this.rayon, this.phase);
  final double fx;
  final double fy;
  final double rayon;
  final double phase;
}

class _ScenePainter extends CustomPainter {
  _ScenePainter({required this.temps, required this.aube, required this.ancre})
      : super(repaint: Listenable.merge([temps, aube]));

  final Animation<double> temps; // 0..1 sur 120 s (boucle)
  final Animation<double> aube; // 0..1 sur 9 s (une seule fois)
  final double ancre; // position de la rue en fraction de la hauteur d'écran

  static const double _vw = 390;
  static const double _horizon = 272; // ligne des collines lointaines / Vatican
  static const double _rue = 318; // niveau de la rue (Colisée, Trevi)

  // Bords visibles de la toile virtuelle (calculés à chaque dessin)
  double _g = 0; // x visible à gauche
  double _d = _vw; // x visible à droite
  double _h = 0; // y visible en haut
  double _bas = 600; // y visible en bas (toute la page)

  // Cycle du soleil (recalculés à chaque dessin)
  double _u = 0; // avancement du soleil sur son arc : 0 = lever, 1 = coucher
  double _alt = 0; // hauteur du soleil : 0 = horizon, 1 = zénith
  double _jour = 0; // 0..1 : ciel bleu de plein jour
  double _soir = 0; // 0..1 : palette de coucher (rouge/magenta) plutôt que d'aube

  static final List<_Etoile> _etoiles = _creerEtoiles();

  static List<_Etoile> _creerEtoiles() {
    final r = math.Random(7);
    return List<_Etoile>.generate(
      42,
          (i) => _Etoile(
        r.nextDouble(),
        r.nextDouble(),
        0.6 + r.nextDouble() * 0.9,
        r.nextDouble() * math.pi * 2,
      ),
    );
  }

  Color _mix(Color a, Color b, double t) => Color.lerp(a, b, t)!;

  double _lisse(double a, double b, double x) {
    final k = ((x - a) / (b - a)).clamp(0.0, 1.0).toDouble();
    return k * k * (3 - 2 * k);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    // La scène couvre toute la page : largeur 390 -> écran, et la rue est
    // placée à 'ancre' x hauteur de l'écran (le ciel monte au-dessus).
    final s = w / _vw;
    final decalX = (w - _vw * s) / 2;
    final decalY = ancre * h - _rue * s;
    final t = temps.value * 120.0;
    // Cycle : t = 0 lever, t = 80 coucher, puis nuit jusqu'à 120 (retour au lever)
    _u = ((t % 120.0) / 80.0).clamp(0.0, 1.0).toDouble();
    _alt = _u >= 1.0 ? 0.0 : math.sin(math.pi * _u);
    // p = intensité de la lumière chaude (0 = nuit, 1 = soleil levé)
    final p = Curves.easeInOutCubic
        .transform((_alt / 0.45).clamp(0.0, 1.0).toDouble());
    _jour = _lisse(0.5, 0.9, _alt);
    _soir = _lisse(0.5, 0.64, _u);

    canvas.clipRect(Offset.zero & size);
    canvas.save();
    canvas.translate(decalX, decalY);
    canvas.scale(s);

    _g = -decalX / s;
    _d = _vw + decalX / s;
    _h = -decalY / s;
    _bas = (h - decalY) / s;

    _ciel(canvas, p);
    _etoilesCiel(canvas, p, t);
    _soleil(canvas, p, t);
    _lune(canvas, p, t);
    _nuages(canvas, p, t);
    _oiseaux(canvas, p, t);
    _avion(canvas, p, t);
    _collinesLointaines(canvas, p);
    _vatican(canvas, p);
    _brumeHorizon(canvas, p);
    _terrasse(canvas, p);
    _pins(canvas, p);
    _colisee(canvas, p, t);
    _trevi(canvas, p, t);
    _rueEtCoupe(canvas, p);
    _tunnel(canvas, t);
    _aeroport(canvas, p, t);
    _lumiereChaude(canvas, p);

    canvas.restore();

    // Ouverture en fondu depuis le noir
    final noir = (1.0 - (aube.value * 7.0)).clamp(0.0, 1.0).toDouble();
    if (noir > 0) {
      canvas.drawRect(
        Offset.zero & size,
        Paint()..color = Color.fromRGBO(5, 7, 20, noir),
      );
    }
  }

  // ------------------------------------------------------------------ CIEL
  void _ciel(Canvas canvas, double p) {
    final couleurs = _couleursCiel(p);
    final zone = Rect.fromLTRB(_g, _h, _d, _horizon + 30);
    canvas.drawRect(
      Rect.fromLTRB(_g - 2, _h - 2, _d + 2, _bas + 2),
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: couleurs,
          stops: const [0.0, 0.34, 0.62, 0.84, 1.0],
        ).createShader(zone),
    );
  }

  // Palette du ciel : nuit -> (aube | coucher) -> plein jour
  List<Color> _couleursCiel(double p) {
    const nuit = [
      Color(0xFF060A22), Color(0xFF141A48), Color(0xFF332662),
      Color(0xFF6E3A78), Color(0xFFA9527A),
    ];
    const lever = [
      Color(0xFF26337F), Color(0xFF6D5AA6), Color(0xFFE5707E),
      Color(0xFFFF9D5C), Color(0xFFFFD58A),
    ];
    const coucher = [
      Color(0xFF2B2468), Color(0xFF7A3A86), Color(0xFFE0476A),
      Color(0xFFFF7A3C), Color(0xFFFFB347),
    ];
    const plein = [
      Color(0xFF2C6BCB), Color(0xFF5B95E0), Color(0xFF8DB9EE),
      Color(0xFFBBD7F2), Color(0xFFFFE6BE),
    ];
    return List<Color>.generate(5, (i) {
      final chaud = _mix(lever[i], coucher[i], _soir);
      final doree = _mix(chaud, plein[i], _jour * 0.9);
      return _mix(nuit[i], doree, p);
    });
  }

  void _etoilesCiel(Canvas canvas, double p, double t) {
    final visible = (1.0 - p * 1.6).clamp(0.0, 1.0).toDouble();
    if (visible <= 0) return;
    final paint = Paint();
    final largeur = _d - _g;
    final hauteur = 170 - _h;
    for (final e in _etoiles) {
      final scint = 0.55 + 0.45 * math.sin(2 * math.pi * t / 6 + e.phase);
      paint.color = Color.fromRGBO(255, 248, 225, visible * scint);
      canvas.drawCircle(
        Offset(_g + e.fx * largeur, _h + e.fy * hauteur),
        e.rayon,
        paint,
      );
    }
  }

  // ---------------------------------------------------------------- SOLEIL
  // Le soleil suit un arc : il se lève à droite (derrière Trevi), traverse le
  // ciel puis se couche à gauche (derrière le Colisée).
  Offset _centreSoleil(double p) => Offset(330 - 260 * _u, 330 - 242 * _alt);

  void _soleil(Canvas canvas, double p, double t) {
    if (_alt <= 0.002) return;
    final c = _centreSoleil(p);
    // Soleil rasant (près de l'horizon) : plus gros et plus rouge
    final rasant = 1.0 - (_alt / 0.6).clamp(0.0, 1.0).toDouble();
    final rayon = 24.0 + 4.0 * rasant;

    // Grand halo
    const rh = 170.0;
    final haloCouleur = _mix(
      const Color.fromRGBO(255, 214, 140, 1),
      const Color.fromRGBO(255, 150, 105, 1),
      rasant * _soir,
    );
    final haloAlpha =
        0.20 * (_alt * 8).clamp(0.0, 1.0).toDouble() + 0.55 * p;
    canvas.drawCircle(
      c,
      rh,
      Paint()
        ..shader = RadialGradient(
          colors: [
            haloCouleur.withOpacity(haloAlpha.clamp(0.0, 1.0).toDouble()),
            haloCouleur.withOpacity(0.0),
          ],
        ).createShader(Rect.fromCircle(center: c, radius: rh)),
    );

    // Rayons de lumière qui respirent doucement
    final rayonPaint = Paint()..color = Color.fromRGBO(255, 241, 193, 0.11 * p);
    for (int i = 0; i < 9; i++) {
      final a = -math.pi / 2 +
          (i - 4) * 0.24 +
          0.05 * math.sin(2 * math.pi * t / 40 + i);
      const l = 520.0;
      final path = Path()
        ..moveTo(c.dx, c.dy)
        ..lineTo(c.dx + l * math.cos(a - 0.045), c.dy + l * math.sin(a - 0.045))
        ..lineTo(c.dx + l * math.cos(a + 0.045), c.dy + l * math.sin(a + 0.045))
        ..close();
      canvas.drawPath(path, rayonPaint);
    }

    // Disque solaire
    canvas.drawCircle(
      c,
      rayon,
      Paint()
        ..shader = RadialGradient(
          colors: [
            _mix(const Color(0xFFFFF8DC), const Color(0xFFFFD0A0), rasant),
            _mix(const Color(0xFFFFDC7A), const Color(0xFFFF8A3C), rasant),
            _mix(const Color(0xFFFFA64D), const Color(0xFFFF5A2E), rasant),
          ],
          stops: const [0.0, 0.62, 1.0],
        ).createShader(Rect.fromCircle(center: c, radius: rayon)),
    );
  }

  // ------------------------------------------------------------------ LUNE
  // Elle se lève à droite peu avant le coucher du soleil et se couche à
  // gauche au petit matin (visible de t = 76 s à t = 128 s, soit 8 s du cycle suivant).
  void _lune(Canvas canvas, double p, double t) {
    final v = ((t - 76.0) % 120.0) / 52.0;
    if (v < 0 || v > 1) return;
    final alpha = (1.0 - p * 1.3).clamp(0.0, 1.0).toDouble();
    if (alpha <= 0) return;
    final c = Offset(320 - 250 * v, 330 - 240 * math.sin(math.pi * v));
    const r = 11.0;

    canvas.drawCircle(
      c,
      46,
      Paint()
        ..shader = RadialGradient(
          colors: [
            Color.fromRGBO(210, 222, 255, 0.28 * alpha),
            const Color.fromRGBO(210, 222, 255, 0.0),
          ],
        ).createShader(Rect.fromCircle(center: c, radius: 46)),
    );
    // Disque à peine visible (lumière cendrée) + croissant lumineux
    canvas.drawCircle(c, r, Paint()..color = Color.fromRGBO(190, 200, 235, 0.16 * alpha));
    final croissant = Path.combine(
      PathOperation.difference,
      Path()..addOval(Rect.fromCircle(center: c, radius: r)),
      Path()..addOval(Rect.fromCircle(center: c.translate(r * 0.5, -r * 0.2), radius: r * 0.88)),
    );
    canvas.drawPath(croissant, Paint()..color = Color.fromRGBO(247, 241, 218, alpha));
  }

  // --------------------------------------------------------------- NUAGES
  void _nuage(Canvas canvas, Offset c, double largeur, Color color) {
    final paint = Paint()
      ..color = color
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3.5);
    final hh = largeur * 0.17;
    canvas.drawOval(Rect.fromCenter(center: c, width: largeur, height: hh), paint);
    canvas.drawOval(
      Rect.fromCenter(
        center: c.translate(-largeur * 0.2, hh * 0.3),
        width: largeur * 0.6,
        height: hh * 0.8,
      ),
      paint,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: c.translate(largeur * 0.24, hh * 0.25),
        width: largeur * 0.5,
        height: hh * 0.7,
      ),
      paint,
    );
  }

  void _nuages(Canvas canvas, double p, double t) {
    final teinte = _mix(
        _mix(const Color(0x33B79CD8), const Color(0x99FFB59A), p),
        const Color(0xB3FFFFFF),
        _jour * 0.85);
    final teinte2 = _mix(
        _mix(const Color(0x2AA58CC8), const Color(0x88FFC9A8), p),
        const Color(0x99FFFFFF),
        _jour * 0.85);
    final large = (_d - _g) + 260;
    double dx(double base, double vitesse) =>
        _g - 130 + ((base + t * vitesse) % 1.0) * large;
    _nuage(canvas, Offset(dx(0.10, 1 / 120), 86), 120, teinte);
    _nuage(canvas, Offset(dx(0.45, 1 / 120), 132), 150, teinte2);
    _nuage(canvas, Offset(dx(0.75, 1 / 120), 58), 100, teinte2);
    _nuage(canvas, Offset(dx(0.28, 1 / 120), 196), 130, teinte);
  }

  // -------------------------------------------------------------- OISEAUX
  void _oiseau(Canvas canvas, Offset c, double s, double battement, double a) {
    final paint = Paint()
      ..color = Color.fromRGBO(58, 44, 79, a)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;
    final aile = -s * 0.55 * battement;
    final path = Path()
      ..moveTo(c.dx - s, c.dy + aile * 0.4)
      ..quadraticBezierTo(c.dx - s * 0.5, c.dy + aile, c.dx, c.dy)
      ..quadraticBezierTo(c.dx + s * 0.5, c.dy + aile, c.dx + s, c.dy + aile * 0.4);
    canvas.drawPath(path, paint);
  }

  void _oiseaux(Canvas canvas, double p, double t) {
    final a = ((p - 0.45) * 2.2).clamp(0.0, 0.85).toDouble();
    if (a <= 0) return;
    for (int i = 0; i < 5; i++) {
      final derive = 14 * math.sin(2 * math.pi * t / 24 + i * 1.3);
      final monte = 5 * math.sin(2 * math.pi * t / 15 + i);
      final bat = math.sin(2 * math.pi * t / 1.5 + i * 0.9);
      _oiseau(
        canvas,
        Offset(150 + i * 17.0 + derive, 120 + (i % 3) * 9.0 + monte),
        4.5 + (i % 2) * 1.2,
        bat,
        a,
      );
    }
  }

  // ---------------------------------------------------------------- AVION
  void _avion(Canvas canvas, double p, double t) {
    final u = ((t + 5) % 24) / 24;
    final x = (_g - 70) + u * ((_d - _g) + 140);
    final y = 74 - 16 * u;
    const pente = -0.07;

    // Traînée de condensation
    canvas.save();
    canvas.translate(x, y);
    canvas.rotate(pente);
    const longueurTrainee = 150.0;
    canvas.drawRect(
      Rect.fromLTWH(-longueurTrainee - 24, -1.0, longueurTrainee, 2.0),
      Paint()
        ..shader = LinearGradient(
          colors: [
            const Color.fromRGBO(255, 235, 225, 0.0),
            Color.fromRGBO(255, 235, 225, 0.55 * (0.4 + 0.6 * p)),
          ],
        ).createShader(
          Rect.fromLTWH(-longueurTrainee - 24, -1.0, longueurTrainee, 2.0),
        ),
    );

    _corpsAvion(canvas, p, t, train: false);
    canvas.restore();
  }

  // Fuselage, ailes, dérive : dessiné à l'origine, nez vers la droite.
  void _corpsAvion(Canvas canvas, double p, double t, {required bool train}) {
    // Corps (blanc réchauffé par l'aube)
    final blanc = _mix(const Color(0xFFDDE3F2), const Color(0xFFFFF3E6), p);
    final fuselage = Path()
      ..moveTo(-24, -2.2)
      ..lineTo(12, -3.4)
      ..quadraticBezierTo(23, -3.0, 26, 0.0)
      ..quadraticBezierTo(22, 3.2, 10, 3.4)
      ..lineTo(-20, 2.2)
      ..quadraticBezierTo(-25, 0.6, -24, -2.2)
      ..close();

    // Dérive (queue) bleu profond
    final derive = Path()
      ..moveTo(-14, -2.5)
      ..lineTo(-27, -13)
      ..lineTo(-21, -13)
      ..lineTo(-6, -3)
      ..close();
    canvas.drawPath(derive, Paint()..color = const Color(0xFF14427A));

    // Aile lointaine
    final aileLoin = Path()
      ..moveTo(-1, -2)
      ..lineTo(-12, -8)
      ..lineTo(-8, -8)
      ..lineTo(7, -2.5)
      ..close();
    canvas.drawPath(aileLoin, Paint()..color = const Color(0xFFB7C0D6));

    // Train d'atterrissage (au sol uniquement)
    if (train) {
      final jambe = Paint()
        ..color = const Color(0xFF59607A)
        ..strokeWidth = 1.1
        ..strokeCap = StrokeCap.round;
      final roue = Paint()..color = const Color(0xFF14121A);
      canvas.drawLine(const Offset(-2, 3), const Offset(-2, 11.4), jambe);
      canvas.drawLine(const Offset(15, 3), const Offset(15, 11.4), jambe);
      canvas.drawCircle(const Offset(-2, 11.8), 1.4, roue);
      canvas.drawCircle(const Offset(15, 11.8), 1.4, roue);
    }

    canvas.drawPath(fuselage, Paint()..color = blanc);

    // Bande de livrée
    canvas.drawLine(
      const Offset(-21, 1.3),
      const Offset(20, 1.5),
      Paint()
        ..color = const Color(0xFF14427A)
        ..strokeWidth = 1.1
        ..strokeCap = StrokeCap.round,
    );

    // Hublots + cockpit
    final hublot = Paint()..color = const Color(0xFF3B4A66);
    for (int i = 0; i < 9; i++) {
      canvas.drawCircle(Offset(-15 + i * 3.2, -0.8), 0.55, hublot);
    }
    canvas.drawPath(
      Path()
        ..moveTo(17, -2.3)
        ..lineTo(22, -1.8)
        ..lineTo(23, -0.6)
        ..lineTo(17, -0.8)
        ..close(),
      hublot,
    );

    // Aile proche + réacteur
    final aileProche = Path()
      ..moveTo(-2, 2)
      ..lineTo(-15, 10.5)
      ..lineTo(-10, 10.5)
      ..lineTo(9, 2.6)
      ..close();
    canvas.drawPath(aileProche, Paint()..color = const Color(0xFFD3DBEA));
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(-1, 5.8, 8, 3.4),
        const Radius.circular(1.7),
      ),
      Paint()..color = const Color(0xFF8E98B0),
    );

    // Feu de navigation clignotant
    final clignote = (math.sin(2 * math.pi * t / 1.0) > 0.4) ? 1.0 : 0.15;
    canvas.drawCircle(
      const Offset(-12.5, 10.5),
      1.3,
      Paint()..color = Color.fromRGBO(255, 60, 60, clignote),
    );
  }

  // ------------------------------------------------- COLLINES LOINTAINES
  void _collinesLointaines(Canvas canvas, double p) {
    final haut = _mix(const Color(0xFF2A2255), const Color(0xFFC07C98), p);
    final bas = _mix(const Color(0xFF1B1840), const Color(0xFF9A6288), p);
    final path = Path()..moveTo(_g - 2, _bas + 2);
    for (double x = _g - 2; x <= _d + 2; x += 4) {
      final y = _horizon - 8 + 6 * math.sin(x / 55) + 3 * math.sin(x / 21 + 1.0);
      path.lineTo(x, y);
    }
    path.lineTo(_d + 2, _bas + 2);
    path.close();
    canvas.drawPath(
      path,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [haut, bas],
        ).createShader(Rect.fromLTRB(_g, _horizon - 20, _d, _horizon + 40)),
    );
  }

  // ------------------------------------------------------------ VATICAN
  // Basilique Saint-Pierre : façade, grand dôme, lanterne, petits dômes
  // et colonnades, en contre-jour avec un liseré de lumière doré.
  void _vatican(Canvas canvas, double p) {
    final sombre = _mix(const Color(0xFF191740), const Color(0xFF5E4A82), p);
    final moyen = _mix(const Color(0xFF24205A), const Color(0xFF8A6B9C), p);
    final clair = _mix(const Color(0xFF2E2A6C), const Color(0xFFD9A39E), p);
    final trait = Paint()
      ..color = Color.fromRGBO(30, 20, 60, 0.28)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;
    final liseret = Paint()
      ..color = Color.fromRGBO(255, 208, 138, 0.9 * p)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round;

    Paint degrade(Rect r) => Paint()
      ..shader = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [sombre, moyen, clair],
        stops: const [0.0, 0.55, 1.0],
      ).createShader(r);

    // Colonnades basses de chaque côté de la place
    for (final cote in [-1.0, 1.0]) {
      final x0 = cote < 0 ? 52.0 : 278.0;
      final r = Rect.fromLTWH(x0, 262, 60, 14);
      canvas.drawRect(r, degrade(r));
      for (double x = x0 + 3; x < x0 + 60; x += 4.2) {
        canvas.drawLine(Offset(x, 264), Offset(x, 276), trait);
      }
      canvas.drawRect(Rect.fromLTWH(x0, 260, 60, 3), Paint()..color = clair);
    }

    // Façade
    final facade = Rect.fromLTRB(112, 242, 278, 277);
    canvas.drawRect(facade, degrade(facade));
    canvas.drawRect(Rect.fromLTRB(110, 236, 280, 244), Paint()..color = moyen);
    // Balustrade et statues du couronnement
    for (double x = 114; x < 278; x += 6.2) {
      canvas.drawRect(Rect.fromLTWH(x, 231, 1.6, 6), Paint()..color = sombre);
      canvas.drawCircle(Offset(x + 0.8, 230), 1.1, Paint()..color = sombre);
    }
    // Pilastres + fenêtres
    for (double x = 118; x < 276; x += 11) {
      canvas.drawLine(Offset(x, 246), Offset(x, 274), trait);
      canvas.drawRect(
        Rect.fromLTWH(x + 3, 250, 4, 7),
        Paint()..color = Color.fromRGBO(30, 20, 60, 0.45),
      );
    }
    // Fronton central
    canvas.drawPath(
      Path()
        ..moveTo(172, 236)
        ..lineTo(195, 226)
        ..lineTo(218, 236)
        ..close(),
      Paint()..color = clair,
    );

    // Petits dômes latéraux
    for (final cx in [141.0, 249.0]) {
      final tambour = Rect.fromLTRB(cx - 7, 226, cx + 7, 238);
      canvas.drawRect(tambour, degrade(tambour));
      final petitDome = Path()
        ..addArc(Rect.fromLTRB(cx - 8, 211, cx + 8, 241), math.pi, math.pi)
        ..close();
      canvas.drawPath(petitDome, degrade(Rect.fromLTRB(cx - 8, 211, cx + 8, 241)));
      canvas.drawLine(Offset(cx, 211), Offset(cx, 205), trait..strokeWidth = 1.0);
      trait.strokeWidth = 0.8;
    }

    // Tambour du grand dôme
    final tambourGrand = Rect.fromLTRB(165, 203, 225, 240);
    canvas.drawRect(tambourGrand, degrade(tambourGrand));
    for (double x = 169; x < 225; x += 7.5) {
      canvas.drawLine(Offset(x, 205), Offset(x, 238), trait);
      canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(x + 1.6, 214, 3.2, 11),
          topLeft: const Radius.circular(1.6),
          topRight: const Radius.circular(1.6),
        ),
        Paint()..color = Color.fromRGBO(25, 15, 55, 0.55),
      );
    }
    canvas.drawRect(Rect.fromLTRB(161, 198, 229, 205), Paint()..color = moyen);

    // Grand dôme
    final dome = Path()
      ..moveTo(166, 199)
      ..cubicTo(166, 172, 182, 160, 195, 160)
      ..cubicTo(208, 160, 224, 172, 224, 199)
      ..close();
    final rDome = Rect.fromLTRB(164, 158, 226, 200);
    canvas.drawPath(dome, degrade(rDome));
    for (int k = -3; k <= 3; k++) {
      canvas.drawPath(
        Path()
          ..moveTo(195 + k * 8.2, 199)
          ..quadraticBezierTo(195 + k * 9.0, 175, 195, 161),
        trait,
      );
    }

    // Lanterne + croix
    final lanterne = Rect.fromLTRB(190, 149, 200, 161);
    canvas.drawRect(lanterne, degrade(lanterne));
    canvas.drawPath(
      Path()
        ..moveTo(189, 150)
        ..quadraticBezierTo(195, 140, 201, 150)
        ..close(),
      Paint()..color = moyen,
    );
    final croix = Paint()
      ..color = clair
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;
    canvas.drawLine(const Offset(195, 142), const Offset(195, 131), croix);
    canvas.drawLine(const Offset(191.5, 135), const Offset(198.5, 135), croix);

    // Liseré de lumière côté soleil (à droite)
    canvas.drawPath(
      Path()
        ..moveTo(195, 160)
        ..cubicTo(208, 160, 224, 172, 224, 199),
      liseret,
    );
    canvas.drawLine(const Offset(200, 150), const Offset(200, 160), liseret);
    canvas.drawLine(const Offset(278, 236), const Offset(278, 276), liseret);
    canvas.drawLine(const Offset(225, 203), const Offset(225, 238), liseret);
  }

  // -------------------------------------------------- BRUME À L'HORIZON
  void _brumeHorizon(Canvas canvas, double p) {
    final zone = Rect.fromLTRB(_g, 215, _d, 300);
    canvas.drawRect(
      zone,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color.fromRGBO(255, 205, 150, 0.0),
            Color.fromRGBO(255, 205, 150, 0.38 * p),
            const Color.fromRGBO(255, 205, 150, 0.0),
          ],
        ).createShader(zone),
    );
  }

  // ----------------------------------------- TERRASSE + TOITS DE ROME
  void _terrasse(Canvas canvas, double p) {
    // Petits immeubles aux toits de tuiles, vus au loin
    final r = math.Random(3);
    final murA = _mix(const Color(0xFF2A2250), const Color(0xFFC48A7A), p);
    final murB = _mix(const Color(0xFF30285A), const Color(0xFFD9A07F), p);
    final toit = _mix(const Color(0xFF1E1946), const Color(0xFFA24E3F), p);
    double x = _g - 10;
    while (x < _d + 10) {
      final l = 9 + r.nextDouble() * 9;
      final ht = 8 + r.nextDouble() * 12;
      final base = 301.0;
      canvas.drawRect(
        Rect.fromLTWH(x, base - ht, l, ht + 4),
        Paint()..color = r.nextBool() ? murA : murB,
      );
      if (r.nextDouble() > 0.45) {
        canvas.drawPath(
          Path()
            ..moveTo(x - 0.8, base - ht)
            ..lineTo(x + l / 2, base - ht - 3.2)
            ..lineTo(x + l + 0.8, base - ht)
            ..close(),
          Paint()..color = toit,
        );
      }
      // Fenêtres allumées avant l'aube
      if (p < 0.9 && r.nextDouble() > 0.5) {
        canvas.drawRect(
          Rect.fromLTWH(x + l * 0.3, base - ht + 3, 1.8, 2.4),
          Paint()..color = Color.fromRGBO(255, 214, 140, 0.8 * (1 - p)),
        );
      }
      x += l + 1.5 + r.nextDouble() * 2;
    }

    // Terrasse / parc qui recouvre le pied des bâtiments
    final haut = _mix(const Color(0xFF1A1838), const Color(0xFF7C6A62), p);
    final bas = _mix(const Color(0xFF120F2A), const Color(0xFF4A3A44), p);
    final path = Path()..moveTo(_g - 2, _bas + 2);
    for (double xx = _g - 2; xx <= _d + 2; xx += 4) {
      path.lineTo(xx, 297 + 3 * math.sin(xx / 38) + 1.5 * math.sin(xx / 13));
    }
    path.lineTo(_d + 2, _bas + 2);
    path.close();
    canvas.drawPath(
      path,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [haut, bas],
        ).createShader(Rect.fromLTRB(_g, 292, _d, _rue + 8)),
    );
  }

  // ------------------------------------------------------ PINS PARASOLS
  void _pin(Canvas canvas, double x, double base, double hauteur, double p) {
    final vert = _mix(const Color(0xFF0C1022), const Color(0xFF2A3A2C), p);
    final tronc = Paint()
      ..color = _mix(const Color(0xFF0A0D1C), const Color(0xFF3A2A26), p)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.6
      ..strokeCap = StrokeCap.round;
    canvas.drawPath(
      Path()
        ..moveTo(x, base)
        ..quadraticBezierTo(x - 3, base - hauteur * 0.45, x + 2, base - hauteur * 0.78),
      tronc,
    );
    final cime = Offset(x + 2, base - hauteur * 0.8);
    final feuil = Paint()..color = vert;
    canvas.drawOval(
      Rect.fromCenter(center: cime, width: hauteur * 0.78, height: hauteur * 0.2),
      feuil,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: cime.translate(-hauteur * 0.16, -hauteur * 0.06),
        width: hauteur * 0.5,
        height: hauteur * 0.17,
      ),
      feuil,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: cime.translate(hauteur * 0.15, -hauteur * 0.07),
        width: hauteur * 0.46,
        height: hauteur * 0.16,
      ),
      feuil,
    );
    // Liseré doré sur le dessus
    canvas.drawArc(
      Rect.fromCenter(center: cime, width: hauteur * 0.78, height: hauteur * 0.2),
      math.pi * 1.1,
      math.pi * 0.8,
      false,
      Paint()
        ..color = Color.fromRGBO(255, 208, 138, 0.55 * p)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0,
    );
  }

  void _pins(Canvas canvas, double p) {
    _pin(canvas, 216, _rue, 92, p);
    _pin(canvas, 230, _rue, 70, p);
    _pin(canvas, 3, _rue, 74, p);
  }

  // ------------------------------------------------------------ COLISÉE
  // Mur extérieur en arcades sur trois étages + attique, côté droit éventré
  // (on voit l'anneau intérieur derrière), comme le vrai Colisée.
  static const double _colCx = 103;
  static const double _colA = 96;

  // Profil du sommet du mur extérieur : [angle en degrés, hauteur]
  static const List<List<double>> _colProfil = [
    [-78.0, 64.0], [-74.0, 74.0], [-62.0, 82.0], [-40.0, 88.0], [0.0, 90.0],
    [20.0, 90.0], [21.0, 78.0], [30.0, 78.0], [31.0, 68.0], [40.0, 68.0],
    [41.0, 60.0], [52.0, 60.0], [53.0, 50.0], [66.0, 50.0], [67.0, 42.0],
    [78.0, 40.0],
  ];

  // Profil de l'anneau intérieur (visible au-dessus de la partie éventrée)
  static const List<List<double>> _colInterieur = [
    [14.0, 80.0], [34.0, 82.0], [35.0, 76.0], [50.0, 76.0], [51.0, 70.0],
    [70.0, 66.0], [72.0, 58.0],
  ];

  double _colX(double deg) =>
      _colCx + _colA * math.sin(deg * math.pi / 180) / 0.978;

  double _colY(double deg, double hauteur) =>
      _rue - hauteur * (0.84 + 0.16 * math.cos(deg * math.pi / 180));

  double _interp(List<List<double>> profil, double deg) {
    if (deg <= profil.first[0]) return profil.first[1];
    for (int i = 0; i < profil.length - 1; i++) {
      final a = profil[i];
      final b = profil[i + 1];
      if (deg <= b[0]) {
        final u = (deg - a[0]) / (b[0] - a[0]);
        return a[1] + (b[1] - a[1]) * u;
      }
    }
    return profil.last[1];
  }

  Path _polygoneColisee(List<List<double>> profil) {
    final path = Path()..moveTo(_colX(profil.first[0]), _rue);
    for (final pt in profil) {
      path.lineTo(_colX(pt[0]), _colY(pt[0], pt[1]));
    }
    path.lineTo(_colX(profil.last[0]), _rue);
    path.close();
    return path;
  }

  void _colisee(Canvas canvas, double p, double t) {
    final pierreHaut = _mix(const Color(0xFF2A2350), const Color(0xFFE8BC86), p);
    final pierreBas = _mix(const Color(0xFF1E1A42), const Color(0xFFB67A58), p);
    final interieur = _mix(const Color(0xFF1F1A44), const Color(0xFF9C6650), p);
    final arcade = _mix(const Color(0xFF0E0B22), const Color(0xFF2B1B2E), p);
    final corniche = Paint()
      ..color = _mix(const Color(0xFF3A3470), const Color(0xFFF3CE9A), p)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.3;
    final pilastre = Paint()
      ..color = Color.fromRGBO(255, 230, 190, 0.16)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.7;

    const n = 15; // nombre d'arcades sur la façade
    const pas = 156.0 / n;
    const hBas = [0.0, 34.0, 58.0];
    const hHaut = [27.0, 52.0, 74.0];

    // ---- Anneau intérieur (derrière)
    final polyInt = _polygoneColisee(_colInterieur);
    canvas.drawPath(polyInt, Paint()..color = interieur);
    for (double deg = 16; deg < 70; deg += 7) {
      final dx = _colX(deg + 4) - _colX(deg);
      for (int k = 0; k < 2; k++) {
        final hb = 50.0 + k * 15;
        final ht = hb + 11;
        if (_interp(_colInterieur, deg + 2) < ht + 2) continue;
        final r = Rect.fromLTRB(
          _colX(deg) + dx * 0.15,
          _colY(deg + 2, ht),
          _colX(deg + 4) - dx * 0.15,
          _colY(deg + 2, hb),
        );
        canvas.drawRRect(
          RRect.fromRectAndCorners(
            r,
            topLeft: Radius.circular(r.width / 2),
            topRight: Radius.circular(r.width / 2),
          ),
          Paint()..color = arcade,
        );
      }
    }

    // ---- Mur extérieur
    final poly = _polygoneColisee(_colProfil);
    final zone = Rect.fromLTRB(_colX(-78), _rue - 92, _colX(78), _rue);
    canvas.drawPath(
      poly,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [pierreHaut, pierreBas],
        ).createShader(zone),
    );

    // Ombre à gauche, lumière chaude à droite (côté soleil)
    canvas.save();
    canvas.clipPath(poly);
    canvas.drawRect(
      zone,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            const Color.fromRGBO(30, 20, 60, 0.34),
            const Color.fromRGBO(30, 20, 60, 0.0),
            Color.fromRGBO(255, 200, 130, 0.24 * p),
          ],
          stops: const [0.0, 0.4, 1.0],
        ).createShader(zone),
    );
    canvas.restore();

    // Corniches entre les étages
    for (final hc in [31.0, 55.0, 77.0]) {
      for (int j = 0; j < n; j++) {
        final a = -78 + j * pas;
        final b = a + pas;
        if (_interp(_colProfil, a + pas / 2) < hc + 1) continue;
        canvas.drawLine(
          Offset(_colX(a), _colY(a, hc)),
          Offset(_colX(b), _colY(b, hc)),
          corniche,
        );
      }
    }

    // Piliers
    for (int j = 0; j <= n; j++) {
      final a = -78 + j * pas;
      final top = math.min(_interp(_colProfil, a), 77.0);
      canvas.drawLine(
        Offset(_colX(a), _rue),
        Offset(_colX(a), _colY(a, top)),
        pilastre,
      );
    }

    // Arcades (3 étages) + fenêtres de l'attique
    for (int j = 0; j < n; j++) {
      final a = -78 + j * pas;
      final b = a + pas;
      final m = a + pas / 2;
      final xa = _colX(a);
      final xb = _colX(b);
      final dx = xb - xa;
      if (dx < 3) continue;
      final prof = _interp(_colProfil, m);
      for (int k = 0; k < 3; k++) {
        if (prof < hHaut[k] + 3) continue;
        final r = Rect.fromLTRB(
          xa + dx * 0.2,
          _colY(m, hHaut[k]),
          xb - dx * 0.2,
          _colY(m, hBas[k]),
        );
        final rr = RRect.fromRectAndCorners(
          r,
          topLeft: Radius.circular(r.width / 2),
          topRight: Radius.circular(r.width / 2),
        );
        canvas.drawRRect(rr, Paint()..color = arcade);
        // Quelques arcades éclairées de l'intérieur
        if ((j * 3 + k * 2) % 7 == 0) {
          final f = 0.5 + 0.5 * math.sin(2 * math.pi * t / (3 + k) + j);
          canvas.drawRRect(
            rr.deflate(1.0),
            Paint()..color = Color.fromRGBO(255, 190, 110, (0.18 + 0.22 * f) * (1 - 0.5 * p)),
          );
        }
      }
      if (prof >= 85) {
        canvas.drawRect(
          Rect.fromCenter(
            center: Offset((xa + xb) / 2, _colY(m, 83.5)),
            width: 2.6,
            height: 4.2,
          ),
          Paint()..color = arcade,
        );
      }
    }

    // Liseré doré sur le sommet du mur
    final dessus = Path()..moveTo(_colX(_colProfil.first[0]), _colY(_colProfil.first[0], _colProfil.first[1]));
    for (final pt in _colProfil) {
      dessus.lineTo(_colX(pt[0]), _colY(pt[0], pt[1]));
    }
    canvas.drawPath(
      dessus,
      Paint()
        ..color = Color.fromRGBO(255, 210, 140, 0.85 * p)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2
        ..strokeJoin = StrokeJoin.round,
    );

    // Ombre au pied
    canvas.drawRect(
      Rect.fromLTRB(_colX(-78), _rue - 2, _colX(78), _rue),
      Paint()..color = const Color.fromRGBO(20, 10, 30, 0.28),
    );
  }

  // -------------------------------------------------- FONTAINE DE TREVI
  // Palais à arc triomphal, quatre colonnes, niche de Neptune, rochers,
  // cascades animées et bassin avec reflets qui scintillent.
  static const double _trCx = 313;

  void _trevi(Canvas canvas, double p, double t) {
    final pierreClair = _mix(const Color(0xFF3A3470), const Color(0xFFF0D9AE), p);
    final pierreFonce = _mix(const Color(0xFF241F52), const Color(0xFFC9A57A), p);
    final niche = _mix(const Color(0xFF120E28), const Color(0xFF3A2433), p);
    final statue = _mix(const Color(0xFF4A4488), const Color(0xFFF3E3C6), p);
    final ombre = Paint()..color = const Color.fromRGBO(30, 20, 60, 0.30);

    Paint degradeV(Rect r, Color a, Color b) => Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [a, b],
      ).createShader(r);

    // ---- Attique du palais (partie haute) + fronton
    final attique = Rect.fromLTRB(258, 206, 368, 226);
    canvas.drawRect(attique, degradeV(attique, pierreClair, pierreFonce));
    canvas.drawPath(
      Path()
        ..moveTo(292, 208)
        ..lineTo(_trCx, 195)
        ..lineTo(334, 208)
        ..close(),
      Paint()..color = pierreClair,
    );
    // Blason central
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(302, 209, 324, 223),
        const Radius.circular(2),
      ),
      Paint()..color = pierreFonce,
    );
    // Statues sur le couronnement
    for (final x in [266.0, 288.0, 338.0, 360.0]) {
      canvas.drawRect(Rect.fromLTWH(x - 1.6, 198, 3.2, 8), Paint()..color = statue);
      canvas.drawCircle(Offset(x, 196.5), 1.9, Paint()..color = statue);
    }

    // ---- Corps principal du palais
    final corps = Rect.fromLTRB(247, 224, 379, 304);
    canvas.drawRect(corps, degradeV(corps, pierreClair, pierreFonce));
    canvas.drawRect(Rect.fromLTRB(243, 222, 383, 230), Paint()..color = pierreFonce);
    canvas.drawRect(Rect.fromLTRB(245, 229, 381, 232), ombre);

    // ---- Grande niche centrale (Neptune)
    final nicheRect = Rect.fromLTRB(291, 238, 335, 304);
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        nicheRect,
        topLeft: const Radius.circular(22),
        topRight: const Radius.circular(22),
      ),
      Paint()..color = niche,
    );
    // Neptune : torse, tête, bras levé tenant le trident
    final corpsStatue = Paint()..color = statue;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(307, 252, 319, 276),
        const Radius.circular(4),
      ),
      corpsStatue,
    );
    canvas.drawCircle(const Offset(313, 247), 3.8, corpsStatue);
    final bras = Paint()
      ..color = statue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(const Offset(318, 255), const Offset(325, 247), bras);
    final trident = Paint()
      ..color = statue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    canvas.drawLine(const Offset(325, 240), const Offset(325, 270), trident);
    canvas.drawLine(const Offset(322, 240), const Offset(328, 240), trident);
    canvas.drawLine(const Offset(322, 240), const Offset(322, 244), trident);
    canvas.drawLine(const Offset(328, 240), const Offset(328, 244), trident);
    // Char-coquille
    final coquille = Path()
      ..moveTo(295, 292)
      ..quadraticBezierTo(313, 262, 331, 292)
      ..close();
    canvas.drawPath(coquille, Paint()..color = pierreClair);
    for (int i = -3; i <= 3; i++) {
      canvas.drawLine(
        Offset(313, 289),
        Offset(313 + i * 5.0, 283 + i.abs() * 1.5),
        Paint()
          ..color = const Color.fromRGBO(60, 40, 40, 0.28)
          ..strokeWidth = 0.7,
      );
    }

    // ---- Niches latérales avec statues
    for (final cx in [272.0, 354.0]) {
      final r = Rect.fromLTRB(cx - 4.5, 252, cx + 4.5, 290);
      canvas.drawRRect(
        RRect.fromRectAndCorners(
          r,
          topLeft: const Radius.circular(4.5),
          topRight: const Radius.circular(4.5),
        ),
        Paint()..color = niche,
      );
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTRB(cx - 2, 266, cx + 2, 284),
          const Radius.circular(1.6),
        ),
        corpsStatue,
      );
      canvas.drawCircle(Offset(cx, 262.5), 2.1, corpsStatue);
    }

    // ---- Quatre colonnes colossales
    for (final cx in [262.0, 281.0, 345.0, 364.0]) {
      final fut = Rect.fromLTRB(cx - 4, 236, cx + 4, 304);
      canvas.drawRect(
        fut,
        Paint()
          ..shader = LinearGradient(
            colors: [pierreClair, pierreFonce],
          ).createShader(fut),
      );
      canvas.drawRect(Rect.fromLTRB(cx - 5.4, 233, cx + 5.4, 238), Paint()..color = pierreClair);
      canvas.drawRect(Rect.fromLTRB(cx - 5.4, 301, cx + 5.4, 304), Paint()..color = pierreFonce);
      canvas.drawLine(
        Offset(cx - 1.4, 238),
        Offset(cx - 1.4, 301),
        Paint()
          ..color = const Color.fromRGBO(255, 255, 255, 0.18)
          ..strokeWidth = 0.7,
      );
    }

    // ---- Rochers (scogliera)
    final roche = Path()
      ..moveTo(248, 312)
      ..lineTo(254, 300)
      ..lineTo(262, 303)
      ..lineTo(268, 292)
      ..lineTo(278, 296)
      ..lineTo(284, 286)
      ..lineTo(296, 292)
      ..lineTo(305, 283)
      ..lineTo(321, 283)
      ..lineTo(330, 292)
      ..lineTo(342, 286)
      ..lineTo(348, 296)
      ..lineTo(358, 292)
      ..lineTo(364, 303)
      ..lineTo(372, 300)
      ..lineTo(378, 312)
      ..close();
    final zoneRoche = Rect.fromLTRB(248, 282, 378, 312);
    canvas.drawPath(
      roche,
      degradeV(
        zoneRoche,
        _mix(const Color(0xFF3A3470), const Color(0xFFD8BC94), p),
        _mix(const Color(0xFF241F52), const Color(0xFF9C7A58), p),
      ),
    );

    // ---- Cascades : filets d'eau qui descendent des rochers
    final filet = Paint()
      ..color = Color.fromRGBO(235, 250, 255, 0.35 + 0.35 * p)
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round;
    for (int i = 0; i < 12; i++) {
      final x = 266 + i * 9.3;
      for (int k = 0; k < 3; k++) {
        final yy = 290 + ((t * 17.5 + i * 5 + k * 7) % 21);
        if (yy > 312) continue;
        canvas.drawLine(Offset(x, yy), Offset(x, yy + 5), filet);
      }
    }

    // ---- Bassin
    final rebord = Rect.fromLTRB(238, 304, 388, 309);
    canvas.drawRect(rebord, Paint()..color = pierreClair);
    final eau = Rect.fromLTRB(240, 309, 386, _rue);
    canvas.drawRect(
      eau,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            _mix(const Color(0xFF22306E), const Color(0xFF8FE9F0), p),
            _mix(const Color(0xFF16256A), const Color(0xFF1C93BC), p),
          ],
        ).createShader(eau),
    );
    // Reflet du ciel qui ondule
    for (int i = 0; i < 5; i++) {
      final dx = 4 * math.sin(2 * math.pi * t / 4 + i);
      canvas.drawLine(
        Offset(256 + i * 26 + dx, 312 + (i % 2) * 3.0),
        Offset(272 + i * 26 + dx, 312 + (i % 2) * 3.0),
        Paint()
          ..color = Color.fromRGBO(255, 224, 170, 0.35 * p)
          ..strokeWidth = 1.1
          ..strokeCap = StrokeCap.round,
      );
    }
    // Ondulations
    for (int k = 0; k < 5; k++) {
      final r = 3 + ((t * 6 + k * 3.6) % 18);
      final cx = 262 + k * 28.0;
      canvas.drawOval(
        Rect.fromCenter(center: Offset(cx, 313), width: r * 2.4, height: r * 0.7),
        Paint()
          ..color = Color.fromRGBO(255, 255, 255, (1 - r / 21) * 0.5)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.8,
      );
    }
    // Scintillements
    final sc = math.Random(11);
    for (int i = 0; i < 14; i++) {
      final x = 244 + sc.nextDouble() * 138;
      final y = 310 + sc.nextDouble() * 7;
      final a = (0.5 + 0.5 * math.sin(2 * math.pi * t / 2 + i * 1.7)) * (0.3 + 0.7 * p);
      canvas.drawCircle(
        Offset(x, y),
        0.9,
        Paint()..color = Color.fromRGBO(255, 255, 255, a),
      );
    }
    // Liseré doré sur le palais (côté soleil)
    canvas.drawLine(
      const Offset(379, 224),
      const Offset(379, 304),
      Paint()
        ..color = Color.fromRGBO(255, 208, 138, 0.8 * p)
        ..strokeWidth = 1.2,
    );
  }

  // ------------------------------------------------ RUE + COUPE DU SOL
  void _rueEtCoupe(Canvas canvas, double p) {
    // Dalle de la rue
    final dalle = Rect.fromLTRB(_g - 2, _rue, _d + 2, 329);
    canvas.drawRect(
      dalle,
      Paint()..color = _mix(const Color(0xFF1E1A3A), const Color(0xFF8B7468), p),
    );
    canvas.drawLine(
      Offset(_g - 2, _rue + 0.6),
      Offset(_d + 2, _rue + 0.6),
      Paint()
        ..color = _mix(const Color(0xFF3A3470), const Color(0xFFD9C0A0), p)
        ..strokeWidth = 1.2,
    );
    final joints = Path();
    for (double x = (_g / 22).floorToDouble() * 22; x < _d; x += 22) {
      joints
        ..moveTo(x, _rue + 1)
        ..lineTo(x, 329);
    }
    canvas.drawPath(
      joints,
      Paint()
        ..color = const Color.fromRGBO(20, 10, 30, 0.22)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.7,
    );

    // Terre en coupe (sous la rue)
    final terre = Rect.fromLTRB(_g - 2, 329, _d + 2, _bas + 80);
    canvas.drawRect(
      terre,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            _mix(const Color(0xFF241B38), const Color(0xFF45303A), p),
            _mix(const Color(0xFF110C20), const Color(0xFF231721), p),
          ],
        ).createShader(Rect.fromLTRB(_g, 329, _d, _bas + 40)),
    );
  }

  // ------------------------------------------------------------ TUNNEL
  static const double _tunHaut = 329; // plafond du tunnel
  static const double _tunBas = 394; // sol du tunnel

  void _tunnel(Canvas canvas, double t) {
    final interieur = Rect.fromLTRB(_g - 2, _tunHaut, _d + 2, _tunBas);

    // Mur du fond (voûte vue de l'intérieur) en briques
    canvas.drawRect(
      interieur,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF2A1F34), Color(0xFF150F1D)],
        ).createShader(interieur),
    );
    final briques = Path();
    final x0 = (_g / 11).floorToDouble() * 11;
    for (int r = 0; r < 13; r++) {
      final y = _tunHaut + 4 + r * 5.0;
      briques
        ..moveTo(_g - 2, y)
        ..lineTo(_d + 2, y);
      for (double x = x0 + (r % 2) * 5.5; x < _d + 2; x += 11) {
        briques
          ..moveTo(x, y)
          ..lineTo(x, y + 5);
      }
    }
    canvas.drawPath(
      briques,
      Paint()
        ..color = const Color.fromRGBO(255, 220, 190, 0.07)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.6,
    );

    // Nervures + lampes du plafond (lumière chaude)
    final nerv = (_g / 52).floorToDouble() * 52;
    for (double x = nerv; x < _d + 52; x += 52) {
      canvas.drawRect(
        Rect.fromLTWH(x, _tunHaut + 4, 5, _tunBas - _tunHaut - 4),
        Paint()..color = const Color(0xFF332640),
      );
      final lampe = Offset(x + 2.5, _tunHaut + 5);
      canvas.drawCircle(
        lampe,
        44,
        Paint()
          ..shader = RadialGradient(
            colors: [
              const Color.fromRGBO(255, 196, 120, 0.50),
              const Color.fromRGBO(255, 196, 120, 0.0),
            ],
          ).createShader(Rect.fromCircle(center: lampe, radius: 44)),
      );
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x - 2, _tunHaut + 3, 9, 2.6),
          const Radius.circular(1.2),
        ),
        Paint()..color = const Color(0xFFFFE6B0),
      );
    }

    // Plafond (bandeau de maçonnerie)
    canvas.drawRect(
      Rect.fromLTRB(_g - 2, _tunHaut, _d + 2, _tunHaut + 4),
      Paint()..color = const Color(0xFF3E3046),
    );

    // ----- Voie du fond + train qui roule vers la GAUCHE
    _voie(canvas, 349.5, 355.0, 0.8);
    canvas.drawLine(
      Offset(_g - 2, 334.0),
      Offset(_d + 2, 334.0),
      Paint()
        ..color = const Color.fromRGBO(170, 160, 185, 0.55)
        ..strokeWidth = 0.7,
    );
    const echelleB = 0.76;
    const longueurB = 250.0 * echelleB;
    final uB = ((t + 9) % 15) / 15;
    final xB = (_d + 40) - uB * ((_d - _g) + longueurB + 80);
    _train(
      canvas,
      x: xB,
      yRail: 355.0,
      echelle: echelleB,
      versDroite: false,
      tricolore: true,
      t: t,
    );

    // ----- Voie du premier plan + train qui roule vers la DROITE
    _voie(canvas, 379.0, 387.0, 1.2);
    const longueurA = 250.0;
    final uA = ((t + 3) % 12) / 12;
    final xA = (_g - longueurA - 40) + uA * ((_d - _g) + longueurA + 80);
    _train(
      canvas,
      x: xA,
      yRail: 387.0,
      echelle: 1.0,
      versDroite: true,
      tricolore: false,
      t: t,
    );
    canvas.drawLine(
      Offset(_g - 2, 359.4),
      Offset(_d + 2, 359.4),
      Paint()
        ..color = const Color.fromRGBO(170, 160, 185, 0.5)
        ..strokeWidth = 0.8,
    );

    // Sol du tunnel
    canvas.drawRect(
      Rect.fromLTRB(_g - 2, 391, _d + 2, _tunBas),
      Paint()..color = const Color(0xFF100B17),
    );

    // Le tunnel continue dans l'obscurité de chaque côté
    const fondu = 70.0;
    final gauche = Rect.fromLTRB(_g - 2, _tunHaut, _g + fondu, _tunBas);
    canvas.drawRect(
      gauche,
      Paint()
        ..shader = const LinearGradient(
          colors: [Color.fromRGBO(8, 5, 14, 0.92), Color.fromRGBO(8, 5, 14, 0.0)],
        ).createShader(gauche),
    );
    final droite = Rect.fromLTRB(_d - fondu, _tunHaut, _d + 2, _tunBas);
    canvas.drawRect(
      droite,
      Paint()
        ..shader = const LinearGradient(
          colors: [Color.fromRGBO(8, 5, 14, 0.0), Color.fromRGBO(8, 5, 14, 0.92)],
        ).createShader(droite),
    );
  }

  // --------------------------------------------------- AÉROPORT DE ROME
  // Fenêtre sous le tunnel sur l'aéroport de Rome-Fiumicino : terminal vitré,
  // tour de contrôle, et une piste où un avion décolle puis un autre atterrit
  // (cycle de 40 s). Dessiné en coordonnées locales 329..394, puis décalé.
  static const double _aeroHaut = 329; // haut de la fenêtre (local)
  static const double _aeroBas = 394; // bas de la fenêtre (local)
  static const double _decalAero = 70; // décalage sous le tunnel
  static const double _piste = 391; // hauteur de contact des roues

  static final TextPainter _enseigne = TextPainter(
    text: const TextSpan(
      text: 'ROMA  FIUMICINO',
      style: TextStyle(
        color: Color(0xFFFFF4D6),
        fontSize: 4.6,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.9,
      ),
    ),
    textDirection: TextDirection.ltr,
  )..layout();

  void _aeroport(Canvas canvas, double p, double t) {
    final zone = Rect.fromLTRB(_g - 2, _aeroHaut, _d + 2, _aeroBas);
    final ciel = _couleursCiel(p);
    canvas.save();
    canvas.translate(0, _decalAero);
    canvas.clipRect(zone);

    // Ciel vu depuis le tarmac (mêmes couleurs que le grand ciel)
    canvas.drawRect(
      zone,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ciel[2], ciel[4]],
        ).createShader(Rect.fromLTRB(_g, _aeroHaut, _d, 374)),
    );

    // Collines au loin
    final collines = Path()..moveTo(_g - 2, 378);
    for (double x = _g - 2; x <= _d + 2; x += 4) {
      collines.lineTo(
        x,
        366 + 3 * math.sin(x / 40 + 1.0) + 2 * math.sin(x / 17),
      );
    }
    collines
      ..lineTo(_d + 2, 378)
      ..close();
    canvas.drawPath(
      collines,
      Paint()..color = _mix(const Color(0xFF1C1840), const Color(0xFF8A6A7C), p),
    );

    // ---- Terminal : toit ondulé, enseigne, grande façade vitrée
    final mur = _mix(const Color(0xFF2A2650), const Color(0xFFE3D5C4), p);
    final toit = _mix(const Color(0xFF1B1838), const Color(0xFF8C7A82), p);
    final facade = Path()
      ..moveTo(16, 363.5)
      ..quadraticBezierTo(146, 352, 276, 363.5)
      ..lineTo(276, 374)
      ..lineTo(16, 374)
      ..close();
    canvas.drawPath(facade, Paint()..color = mur);

    // Verre : éclairé la nuit, reflet du ciel le jour
    final verre = _mix(
      const Color(0xFFFFD58A),
      _mix(ciel[3], const Color(0xFF9CC0E0), 0.45),
      p,
    );
    canvas.drawRect(
      const Rect.fromLTRB(22, 364.5, 270, 371.5),
      Paint()..color = verre,
    );
    final meneaux = Path();
    for (double x = 22; x <= 270; x += 6) {
      meneaux
        ..moveTo(x, 364.5)
        ..lineTo(x, 371.5);
    }
    canvas.drawPath(
      meneaux,
      Paint()
        ..color = const Color.fromRGBO(30, 24, 50, 0.55)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.7,
    );

    final dalleToit = Path()
      ..moveTo(16, 361)
      ..quadraticBezierTo(146, 349, 276, 361)
      ..lineTo(276, 363.5)
      ..quadraticBezierTo(146, 352, 16, 363.5)
      ..close();
    canvas.drawPath(dalleToit, Paint()..color = toit);
    canvas.drawPath(
      Path()
        ..moveTo(16, 361)
        ..quadraticBezierTo(146, 349, 276, 361),
      Paint()
        ..color = Color.fromRGBO(255, 208, 138, 0.8 * p)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.9,
    );
    _enseigne.paint(canvas, Offset(146 - _enseigne.width / 2, 358.4));

    // ---- Tour de contrôle
    final beton = _mix(const Color(0xFF2E2A58), const Color(0xFFEADFD0), p);
    canvas.drawRect(
      Rect.fromLTRB(301.5, 346, 306.5, 374),
      Paint()..color = beton,
    );
    canvas.drawPath(
      Path()
        ..moveTo(295, 339.5)
        ..lineTo(313, 339.5)
        ..lineTo(310, 346.5)
        ..lineTo(298, 346.5)
        ..close(),
      Paint()..color = beton,
    );
    canvas.drawCircle(
      const Offset(304, 343),
      12,
      Paint()
        ..shader = RadialGradient(
          colors: [
            Color.fromRGBO(255, 214, 140, 0.35 * (1 - p)),
            const Color.fromRGBO(255, 214, 140, 0.0),
          ],
        ).createShader(Rect.fromCircle(center: const Offset(304, 343), radius: 12)),
    );
    canvas.drawRect(
      const Rect.fromLTRB(297.2, 341, 310.8, 344.6),
      Paint()..color = const Color(0xFFFFE9A8),
    );
    canvas.drawRect(
      const Rect.fromLTRB(294, 337.8, 314, 339.8),
      Paint()..color = _mix(const Color(0xFF1B1838), const Color(0xFF7C6C72), p),
    );
    canvas.drawLine(
      const Offset(304, 337.8),
      const Offset(304, 331.8),
      Paint()
        ..color = const Color(0xFF8E98B0)
        ..strokeWidth = 0.8,
    );
    final feuTour = (math.sin(2 * math.pi * t / 1.6) > 0.2) ? 1.0 : 0.2;
    canvas.drawCircle(
      const Offset(304, 331.8),
      1.3,
      Paint()..color = Color.fromRGBO(255, 60, 60, feuTour),
    );

    // Bande de tarmac entre le terminal et la piste
    canvas.drawRect(
      Rect.fromLTRB(_g - 2, 373.5, _d + 2, 378),
      Paint()..color = _mix(const Color(0xFF1A1730), const Color(0xFF8A8088), p),
    );

    // ---- Piste
    final piste = Rect.fromLTRB(_g - 2, 377.4, _d + 2, _aeroBas);
    canvas.drawRect(
      piste,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            _mix(const Color(0xFF26233E), const Color(0xFF6A6470), p),
            _mix(const Color(0xFF14111F), const Color(0xFF4C4752), p),
          ],
        ).createShader(piste),
    );
    canvas.drawLine(
      Offset(_g - 2, 380.2),
      Offset(_d + 2, 380.2),
      Paint()
        ..color = const Color(0xFFE8C24A)
        ..strokeWidth = 0.7,
    );
    final axe = Path();
    for (double x = (_g / 22).floorToDouble() * 22; x < _d + 22; x += 22) {
      axe
        ..moveTo(x, 386.4)
        ..lineTo(x + 12, 386.4);
    }
    canvas.drawPath(
      axe,
      Paint()
        ..color = const Color.fromRGBO(245, 240, 230, 0.8)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.1,
    );
    // Balisage lumineux : une vague de lumière court le long du bord
    for (double x = (_g / 16).floorToDouble() * 16 + 4; x < _d + 16; x += 16) {
      final onde = 0.5 + 0.5 * math.sin(2 * math.pi * t / 1.2 - x / 16 * 0.9);
      final a = (0.35 + 0.65 * onde) * (0.55 + 0.45 * (1 - p));
      canvas.drawCircle(
        Offset(x, 378.6),
        2.6,
        Paint()..color = Color.fromRGBO(255, 200, 100, a * 0.25),
      );
      canvas.drawCircle(
        Offset(x, 378.6),
        0.7,
        Paint()..color = Color.fromRGBO(255, 230, 160, a),
      );
    }

    // ---- Avions : décollage (0-16 s) puis atterrissage (20-36 s), toutes les 40 s
    final ph = t % 40.0;
    if (ph < 16) {
      final u = ph / 16;
      final x = (_g - 50) + ((_d - _g) + 120) * math.pow(u, 1.7).toDouble();
      final env = ((u - 0.52) / 0.48).clamp(0.0, 1.0).toDouble();
      final lift = 46 * math.pow(env, 1.6).toDouble();
      final angle = -0.22 * _lisse(0.48, 0.7, u);
      _avionPiste(canvas, p, t, x: x, lift: lift, angle: angle, miroir: false);
    } else if (ph >= 20 && ph < 36) {
      final u = (ph - 20) / 16;
      final f = 1 - math.pow(1 - u, 1.8).toDouble();
      final x = (_d + 70) - ((_d - _g) + 150) * f;
      final alt = ((0.3 - u) / 0.3).clamp(0.0, 1.0).toDouble();
      final lift = 40 * math.pow(alt, 1.3).toDouble();
      _avionPiste(canvas, p, t, x: x, lift: lift, angle: -0.10 * alt, miroir: true);
    }

    // Ombre portée sous la rue + bords qui s'assombrissent
    final ombreHaut = Rect.fromLTRB(_g - 2, _aeroHaut, _d + 2, _aeroHaut + 7);
    canvas.drawRect(
      ombreHaut,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromRGBO(10, 6, 20, 0.45), Color.fromRGBO(10, 6, 20, 0.0)],
        ).createShader(ombreHaut),
    );
    canvas.restore();
  }

  // Un avion sur la piste (échelle réduite) : roues sorties tant qu'il roule
  void _avionPiste(
      Canvas canvas,
      double p,
      double t, {
        required double x,
        required double lift,
        required double angle,
        required bool miroir,
      }) {
    const echelle = 0.8;
    final y = _piste - 13.2 * echelle - lift;

    final ombre = (1 - lift / 30).clamp(0.0, 1.0).toDouble();
    if (ombre > 0) {
      canvas.drawOval(
        Rect.fromCenter(center: Offset(x, _piste + 0.6), width: 34, height: 2.2),
        Paint()..color = Color.fromRGBO(0, 0, 0, 0.30 * ombre),
      );
    }

    canvas.save();
    canvas.translate(x, y);
    canvas.scale(miroir ? -echelle : echelle, echelle);
    canvas.rotate(angle);
    _corpsAvion(canvas, p, t, train: lift < 3);
    canvas.restore();
  }

  // Une voie ferrée : ballast, traverses et deux vrais rails en acier
  void _voie(Canvas canvas, double yLoin, double yProche, double epaisseur) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(_g - 2, yLoin - 2.2, _d + 2, yProche + 3.2),
        const Radius.circular(1),
      ),
      Paint()..color = const Color(0xFF3F3846),
    );
    // Cailloux du ballast
    final cail = math.Random(yLoin.toInt());
    final cailloux = Path();
    for (double x = _g; x < _d; x += 5) {
      final y = yLoin - 1.5 + cail.nextDouble() * (yProche - yLoin + 4.5);
      cailloux
        ..moveTo(x + cail.nextDouble() * 3, y)
        ..relativeLineTo(1.2, 0);
    }
    canvas.drawPath(
      cailloux,
      Paint()
        ..color = const Color.fromRGBO(190, 180, 200, 0.28)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.9
        ..strokeCap = StrokeCap.round,
    );
    // Traverses
    final traverses = Path();
    for (double x = (_g / 9).floorToDouble() * 9; x < _d + 9; x += 9) {
      traverses.addRect(Rect.fromLTRB(x, yLoin - 1.4, x + 3.4, yProche + 2.4));
    }
    canvas.drawPath(traverses, Paint()..color = const Color(0xFF241D2C));
    // Rail du fond
    canvas.drawLine(
      Offset(_g - 2, yLoin),
      Offset(_d + 2, yLoin),
      Paint()
        ..color = const Color(0xFF8F98AD)
        ..strokeWidth = epaisseur,
    );
    // Rail du devant (tête brillante + patin dans l'ombre)
    canvas.drawLine(
      Offset(_g - 2, yProche + epaisseur * 0.9),
      Offset(_d + 2, yProche + epaisseur * 0.9),
      Paint()
        ..color = const Color(0xFF120D18)
        ..strokeWidth = epaisseur * 0.8,
    );
    canvas.drawLine(
      Offset(_g - 2, yProche),
      Offset(_d + 2, yProche),
      Paint()
        ..color = const Color(0xFFD3DAE8)
        ..strokeWidth = epaisseur * 1.3,
    );
  }

  // ------------------------------------------------------------- TRAINS
  // Rame de 4 voitures avec nez profilé aux deux extrémités.
  // Dessinée vers la droite ; miroir automatique pour l'autre sens.
  // tricolore = livrée blanche avec bandes vert / rouge (sans aucun texte).
  void _train(
      Canvas canvas, {
        required double x,
        required double yRail,
        required double echelle,
        required bool versDroite,
        required bool tricolore,
        required double t,
      }) {
    final vibration = 0.3 * math.sin(2 * math.pi * t / 0.5);
    canvas.save();
    canvas.translate(versDroite ? x : x + 250 * echelle, yRail + vibration);
    canvas.scale(versDroite ? echelle : -echelle, echelle);
    canvas.translate(2, 0);

    final toit = tricolore ? const Color(0xFFE9E6DE) : const Color(0xFFE4E1DD);
    final bas = tricolore ? const Color(0xFFF1EFEA) : const Color(0xFFC4122F);
    const verre = Color(0xFF1A2130);
    final sombre = Paint()..color = const Color(0xFF14121A);

    // Phare avant : faisceau lumineux dans le tunnel
    final faisceau = Path()
      ..moveTo(246, -8)
      ..lineTo(340, -20)
      ..lineTo(340, 3)
      ..close();
    canvas.drawPath(
      faisceau,
      Paint()
        ..shader = const LinearGradient(
          colors: [Color.fromRGBO(255, 244, 214, 0.38), Color.fromRGBO(255, 244, 214, 0.0)],
        ).createShader(const Rect.fromLTRB(246, -20, 340, 3)),
    );

    for (int i = 0; i < 4; i++) {
      final x0 = i * 62.0;
      final x1 = x0 + 60;
      final tete = i == 3;
      final queue = i == 0;
      final debut = queue ? x0 + 24 : x0;
      final fin = tete ? x0 + 36 : x1;

      // Bogies et roues
      canvas.drawRect(Rect.fromLTWH(x0 + 6, -5.2, 10, 2), sombre);
      canvas.drawRect(Rect.fromLTWH(x0 + 44, -5.2, 10, 2), sombre);
      for (final dx in [8.0, 14.0, 46.0, 52.0]) {
        canvas.drawCircle(Offset(x0 + dx, -2.6), 2.6, sombre);
        canvas.drawCircle(
          Offset(x0 + dx, -2.6),
          0.8,
          Paint()..color = const Color(0xFF6C7080),
        );
      }

      // Soufflet entre les voitures
      if (i < 3) {
        canvas.drawRect(
          Rect.fromLTRB(x1 - 0.5, -22, x1 + 2.5, -5),
          Paint()..color = const Color(0xFF1B1822),
        );
      }

      // Caisse : bandeau de toit / vitres / bas de caisse
      canvas.drawRect(Rect.fromLTRB(debut, -24, fin, -18), Paint()..color = toit);
      canvas.drawRect(Rect.fromLTRB(debut, -18, fin, -10.5), Paint()..color = verre);
      canvas.drawRect(Rect.fromLTRB(debut, -10.5, fin, -4), Paint()..color = bas);
      if (tricolore) {
        canvas.drawRect(
          Rect.fromLTRB(debut, -9.6, fin, -8.0),
          Paint()..color = const Color(0xFF009246),
        );
        canvas.drawRect(
          Rect.fromLTRB(debut, -6.4, fin, -4.8),
          Paint()..color = const Color(0xFFCE2B37),
        );
      } else {
        canvas.drawRect(
          Rect.fromLTRB(debut, -10.9, fin, -10.2),
          Paint()..color = const Color(0xFFB9BDC8),
        );
      }

      // Fenêtres éclairées
      final premier = queue ? 3 : 0;
      final dernier = tete ? 2 : 5;
      for (int m = premier; m <= dernier; m++) {
        final wx = x0 + 6 + m * 8.6;
        final allumee = (i + m) % 5 != 3;
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(wx, -17, 6, 5),
            const Radius.circular(1.2),
          ),
          Paint()
            ..color = allumee ? const Color(0xFFFFDC96) : const Color(0xFF3A4660),
        );
        if (allumee && (i + m) % 2 == 0) {
          canvas.drawCircle(
            Offset(wx + 3, -14.6),
            1.3,
            Paint()..color = const Color.fromRGBO(70, 40, 30, 0.55),
          );
        }
      }

      // Pantographe sur la 2e voiture
      if (i == 1) {
        canvas.drawRect(
          Rect.fromLTRB(x0 + 24, -27.6, x0 + 36, -25.8),
          Paint()..color = const Color(0xFF2A2630),
        );
        canvas.drawRect(
          Rect.fromLTRB(x0 + 29, -26.2, x0 + 31, -24),
          Paint()..color = const Color(0xFF2A2630),
        );
      }

      // Nez de la motrice (avant)
      if (tete) {
        final nez = Path()
          ..moveTo(x0 + 36, -24)
          ..quadraticBezierTo(x0 + 55, -23, x0 + 62, -9)
          ..quadraticBezierTo(x0 + 63, -5.5, x0 + 60, -4)
          ..lineTo(x0 + 36, -4)
          ..close();
        canvas.drawPath(nez, Paint()..color = bas);
        canvas.drawPath(
          Path()
            ..moveTo(x0 + 36, -24)
            ..quadraticBezierTo(x0 + 55, -23, x0 + 60, -13)
            ..lineTo(x0 + 36, -13)
            ..close(),
          Paint()..color = toit,
        );
        canvas.drawPath(
          Path()
            ..moveTo(x0 + 40, -22.5)
            ..quadraticBezierTo(x0 + 54, -21.5, x0 + 59.5, -12.5)
            ..lineTo(x0 + 40, -12.5)
            ..close(),
          Paint()..color = const Color(0xFF111827),
        );
        // Phare
        canvas.drawCircle(
          Offset(x0 + 61, -7.5),
          6,
          Paint()
            ..shader = const RadialGradient(
              colors: [Color.fromRGBO(255, 244, 214, 0.85), Color.fromRGBO(255, 244, 214, 0.0)],
            ).createShader(Rect.fromCircle(center: Offset(x0 + 61, -7.5), radius: 6)),
        );
        canvas.drawCircle(
          Offset(x0 + 60.5, -7.5),
          1.5,
          Paint()..color = const Color(0xFFFFFFFF),
        );
      }

      // Nez de la motrice (arrière) + feu rouge
      if (queue) {
        final nez = Path()
          ..moveTo(x0 + 24, -24)
          ..quadraticBezierTo(x0 + 5, -23, x0 - 2, -9)
          ..quadraticBezierTo(x0 - 3, -5.5, x0, -4)
          ..lineTo(x0 + 24, -4)
          ..close();
        canvas.drawPath(nez, Paint()..color = bas);
        canvas.drawPath(
          Path()
            ..moveTo(x0 + 24, -24)
            ..quadraticBezierTo(x0 + 5, -23, x0, -13)
            ..lineTo(x0 + 24, -13)
            ..close(),
          Paint()..color = toit,
        );
        canvas.drawPath(
          Path()
            ..moveTo(x0 + 20, -22.5)
            ..quadraticBezierTo(x0 + 6, -21.5, x0 + 0.5, -12.5)
            ..lineTo(x0 + 20, -12.5)
            ..close(),
          Paint()..color = const Color(0xFF111827),
        );
        canvas.drawCircle(
          Offset(x0 - 0.5, -7.5),
          4,
          Paint()
            ..shader = const RadialGradient(
              colors: [Color.fromRGBO(255, 40, 40, 0.8), Color.fromRGBO(255, 40, 40, 0.0)],
            ).createShader(Rect.fromCircle(center: Offset(x0 - 0.5, -7.5), radius: 4)),
        );
        canvas.drawCircle(
          Offset(x0 - 0.2, -7.5),
          1.0,
          Paint()..color = const Color(0xFFFF4040),
        );
      }
    }
    canvas.restore();
  }

  // ------------------------------------------- LUMIÈRE CHAUDE GLOBALE
  void _lumiereChaude(Canvas canvas, double p) {
    final c = _centreSoleil(p);
    const r = 320.0;
    canvas.drawRect(
      Rect.fromLTRB(_g - 2, _h - 2, _d + 2, _bas + 2),
      Paint()
        ..shader = RadialGradient(
          colors: [
            Color.fromRGBO(255, 190, 110, 0.12 * p),
            const Color.fromRGBO(255, 190, 110, 0.0),
          ],
        ).createShader(Rect.fromCircle(center: c, radius: r)),
    );
    // Voile sombre en haut tant que le jour n'est pas levé
    final voile = Rect.fromLTRB(_g - 2, _h - 2, _d + 2, _h + 150);
    canvas.drawRect(
      voile,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(8, 10, 34, 0.30 * (1 - p)),
            const Color.fromRGBO(8, 10, 34, 0.0),
          ],
        ).createShader(voile),
    );
  }

  @override
  bool shouldRepaint(covariant _ScenePainter oldDelegate) =>
      oldDelegate.temps != temps ||
          oldDelegate.aube != aube ||
          oldDelegate.ancre != ancre;
}