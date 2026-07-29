import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'connexion.dart'; // Import du second fichier

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Bloque l'application en mode portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vera Italia',
      // FORCE LE MODE SOMBRE EN PERMANENCE
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: const ConnexionPage(),
    );
  }
}