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

class _ConnexionPageState extends State<ConnexionPage> {
  String _langue = 'fr';

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

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.55,
            child: Image.asset(
              'assets/images/1.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: screenHeight * 0.50,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.elliptical(screenWidth, 80),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      Text(
                        t['titre']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        t['desc']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 30),
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
                      const SizedBox(height: 40),
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
                      const SizedBox(height: 20),
                    ],
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