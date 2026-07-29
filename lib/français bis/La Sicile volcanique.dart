import 'package:flutter/material.dart';

class SicileVolcaniquePage extends StatelessWidget {
  const SicileVolcaniquePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/ima/27.jpeg'), // Remplace par ton image principale
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "SICILE VOLCANIQUE 🌋",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Un air de paysages islandais ou hawaiens, version théâtralité méditerranéenne 🇮🇸🇺🇸🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Terre forgée par le feu et la mythologie, la Sicile est l'un des épicentres volcaniques les plus actifs et fascinants de la planète. Dominée par le géant Etna, le plus haut volcan d'Europe, et bordée au nord par l'archipel volcanique des îles Éoliennes (dont l'explosif Stromboli et le sulfureux Vulcano), la région offre un spectacle géologique brut. Des coulées de lave noire contrastant avec la neige d'altitude aux explosions nocturnes régulières projetées sur fond de mer, la Sicile volcanique est une aventure viscérale au cœur des forces de la Terre.",
                    style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
                    softWrap: true,
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("APERÇU 📸"),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        _buildImageItem('assets/ima/25.jpeg'),
                        _buildImageItem('assets/ima/26.jpg'),
                        _buildImageItem('assets/ima/27.jpeg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("LES GÉANTS DE FEU 📜"),
                  _buildContentBlock(
                      "L'Etna : Le Phare de la Méditerranée",
                      "Culminant à plus de 3 300 mètres, l'Etna (Mongibello) redessine constamment la topographie de la Sicile orientale. Ses flancs fertiles abritent des vignobles d'exception et des vergers d'agrumes florissants, tandis que ses cratères sommitaux offrent un paysage lunaire de déserts de cendres noires et de fumerolles actives."
                  ),
                  _buildContentBlock(
                      "Le Stromboli : Le Phare des Éoliennes",
                      "Ce volcan insulaire est en éruption continue depuis près de 2 000 ans. Ses explosions régulières de lambeaux de lave incandescente, visibles de nuit depuis la mer le long de la célèbre 'Sciara del Fuoco' (Allée du feu), constituent un spectacle hypnotique unique au monde."
                  ),
                  _buildContentBlock(
                      "Vulcano : L'Origine du Mythe",
                      "C'est sur cette île que les Romains situaient les forges de Vulcain, dieu du feu. Caractérisée par ses odeurs de soufre intenses, ses bains de boue thérapeutiques et ses plages de sable d'un noir d'encre, Vulcano offre une immersion géothermique totale à ciel ouvert."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("CONSEILS PRATIQUES & SÉCURITÉ 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("DYNAMIQUE DES VOLCANS ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Attention : Les conditions d'accès aux sommets dépendent strictement des bulletins d'activité émis par l'INGV (Institut National de Géophysique). Les règlementations peuvent changer d'une heure à l'autre.",
                      style: TextStyle(color: Colors.white30, fontSize: 12),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) => Text(
    title,
    style: const TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, fontSize: 18),
    softWrap: true,
  );

  Widget _buildContentBlock(String title, String body) => Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16), softWrap: true),
      const SizedBox(height: 5),
      Text(body, style: const TextStyle(color: Colors.white60, height: 1.5), softWrap: true),
    ]),
  );

  Widget _buildPriceSection() => Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(12)),
    child: const Row(children: [
      Icon(Icons.warning_amber_rounded, color: Colors.orangeAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Accès réglementé | Guide volcanologique obligatoire au-delà des altitudes autorisées (~50€ à ~90€ selon excursion).",
          style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          softWrap: true,
        ),
      )
    ]),
  );

  Widget _buildImageItem(String path) => Padding(
    padding: const EdgeInsets.only(right: 15),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        path,
        height: 120,
        fit: BoxFit.contain,
      ),
    ),
  );

  Widget _buildCalendarSection() => Column(children: [
    const SizedBox(height: 5),
    _buildCalendarRow("✅ Top", "Le printemps et l'automne pour l'Etna (évite la chaleur étouffante ou le gel hivernal). Pour le Stromboli, les excursions nocturnes en mer d'été sont magiques."),
    _buildCalendarRow("🎒 Info", "Un équipement de randonnée complet est requis : chaussures de marche montantes, vêtements chauds multicouches et lunettes pour se protéger des poussières de cendre."),
    _buildCalendarRow("❌ Éviter", "D'entreprendre l'ascension des cratères sommitaux seul ou sans s'être informé au préalable de l'état d'alerte volcanique en vigueur."),
  ]);

  Widget _buildCalendarRow(String status, String info) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 70, child: Text(status, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Expanded(child: Text(info, style: const TextStyle(color: Colors.white70, height: 1.3), softWrap: true))
      ],
    ),
  );

  Widget _buildHoursTable() => Table(
    columnWidths: const {
      0: FlexColumnWidth(1.2),
      1: FlexColumnWidth(2.8),
    },
    border: TableBorder.all(color: Colors.white24),
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Volcan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Type d'Activité & Accessibilité", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("L'Etna", "Activité effusive et explosive intermittente. Téléphérique et 4x4 ouverts en journée selon météo."),
      _buildTableRowData("Stromboli", "Activité strombolienne persistante (explosions toutes les 15-20 min). Randonnées d'observation calées sur le coucher du soleil."),
      _buildTableRowData("Vulcano", "Activité fumerollienne intense. Accès au grand cratère soumis aux variations d'émanations de gaz toxiques."),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}