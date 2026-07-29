import 'package:flutter/material.dart';

class GrottesCastellanaPage extends StatelessWidget {
  const GrottesCastellanaPage({super.key});

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
                  image: AssetImage('assets/ima/38.jpg'), // Remplace par ton image principale
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
                      "GROTTES DE CASTELLANA 🕳️",
                      style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2)
                  ),
                  const SizedBox(height: 10),
                  const Text(
                      "Un air de gouffre de Padirac ou d'antre de Moria, version cathédrale souterraine des Pouilles 🇫🇷🇳🇿🇮🇹",
                      style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Situées à la lisière de la vallée d'Itria, les grottes de Castellana forment l'un des complexes spéléologiques les plus vastes et spectaculaires d'Italie. À plus de 60 mètres sous terre, ce réseau de galeries dévoile un labyrinthe de stalactites cristallines, de stalagmites monumentales, de canyons et de gouffres profonds façonnés par l'eau sur des millions d'années. Le point d'orgue de l'exploration est la Grotta Bianca (la Grotte Blanche), célébrée mondialement par les spéléologues comme la cavité souterraine la plus lumineuse et pure de la planète.",
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
                        _buildImageItem('assets/ima/36.webp'),
                        _buildImageItem('assets/ima/35.jpg'),
                        _buildImageItem('assets/ima/37.webp'),
                        _buildImageItem('assets/ima/38.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("LES PARCOURS D'EXPLORATION 📜"),
                  _buildContentBlock(
                      "Itinéraire Complet : L'Immersion Totale",
                      "Un parcours exceptionnel de 3 kilomètres (aller-retour) d'une durée d'environ 100 minutes. Il vous conduit à travers les plus belles salles du complexe jusqu'à la légendaire Grotte Blanche, un joyau d'albâtre scintillant d'une pureté inégalée."
                  ),
                  _buildContentBlock(
                      "Itinéraire Partiel : La Découverte Express",
                      "D'une longueur d'environ 1 kilomètre pour une durée de 50 minutes, ce tracé plus court permet d'admirer la majestueuse Grave, la première et immense caverne naturelle du réseau, idéale pour les personnes disposant de peu de temps."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("SERVICES & INFOS SUR SITE ✨"),
                  const SizedBox(height: 15),
                  _buildServicesGrid(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("TARIFS DES BILLETS (AU GUICHET) 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("ORGANISATION DES CIRCUITS ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Attention : La température à l'intérieur des grottes est constante toute l'année à environ 16,5°C avec un taux d'humidité élevé. Prévoyez un pull ou une veste ainsi que des chaussures fermées antidérapantes. Les prix peuvent changer au cours de l'année.",
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

  Widget _buildSectionTitle(String title) => Text(title, style: const TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, fontSize: 18));

  Widget _buildContentBlock(String title, String body) => Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
      const SizedBox(height: 5),
      Text(body, style: const TextStyle(color: Colors.white60, height: 1.5), softWrap: true),
    ]),
  );

  Widget _buildPriceSection() => Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(12)),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("• Plein tarif (Dès 15 ans) :", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold), softWrap: true),
        Text("  - Visite Complète : 25 € | Visite Partielle : 22 €", style: TextStyle(color: Colors.white70, fontSize: 13), softWrap: true),
        SizedBox(height: 5),
        Text("• Tarif réduit (6 à 14 ans) :", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold), softWrap: true),
        Text("  - Visite Complète : 22 € | Visite Partielle : 19 €", style: TextStyle(color: Colors.white70, fontSize: 13), softWrap: true),
        SizedBox(height: 5),
        Text("• Gratuit : Enfants jusqu'à 5 ans inclus.", style: TextStyle(color: Colors.white70, fontSize: 13), softWrap: true),
        SizedBox(height: 8),
        Text("💎 Exclusivité En Ligne : Billet Famille à 61 €", style: TextStyle(color: Color(0xFFFFD700), fontSize: 14, fontWeight: FontWeight.bold), softWrap: true),
        Text("Valable pour 2 adultes + 2 enfants (6-14 ans). Frais de réservation inclus. Non disponible aux guichets.", style: TextStyle(color: Colors.white60, fontSize: 12), softWrap: true),
      ],
    ),
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

  Widget _buildServicesGrid() => Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(12)),
    child: const Column(
      children: [
        Row(children: [Icon(Icons.child_friendly, color: Colors.greenAccent), SizedBox(width: 10), Expanded(child: Text("Location de porte-bébés gratuite (poussettes interdites)", style: TextStyle(color: Colors.white70), softWrap: true))]),
        SizedBox(height: 8),
        Row(children: [Icon(Icons.local_parking, color: Colors.lightBlueAccent), SizedBox(width: 10), Expanded(child: Text("Parking payant P1 situé à proximité immédiate de la zone", style: TextStyle(color: Colors.white70), softWrap: true))]),
        SizedBox(height: 8),
        Row(children: [Icon(Icons.wc, color: Colors.amberAccent), SizedBox(width: 10), Expanded(child: Text("Toilettes payantes près de la billetterie (nettoyage continu)", style: TextStyle(color: Colors.white70), softWrap: true))]),
      ],
    ),
  );

  Widget _buildCalendarSection() => Column(children: [
    const SizedBox(height: 5),
    _buildCalendarRow("✅ Réservation", "Il est vivement conseillé d’acheter vos billets en ligne au plus tard la veille de la visite pour sécuriser votre créneau d'accès et éviter les files d'attente."),
    _buildCalendarRow("🎒 Accès", "Le billet numérique reçu par mail vous permet de vous rendre directement aux tourniquets. Arrivez au moins 15 minutes avant le début de la visite."),
    _buildCalendarRow("❌ Guichet", "Les billets vendus sur place le jour même dépendent strictement des places restantes. Il est impossible d'acheter au guichet pour les jours suivants."),
  ]);

  Widget _buildCalendarRow(String status, String info) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 85, child: Text(status, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        Expanded(child: Text(info, style: const TextStyle(color: Colors.white70, height: 1.3), softWrap: true))
      ],
    ),
  );

  Widget _buildHoursTable() => Table(
    columnWidths: const {
      0: FlexColumnWidth(1.4),
      1: FlexColumnWidth(2.6),
    },
    border: TableBorder.all(color: Colors.white24),
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Type d'itinéraire", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Distance, Durée et Spécificités", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ]),
      _buildTableRowData("Complet 🚶", "3 kilomètres | ~100 minutes\nExplore l'intégralité du réseau souterrain jusqu'à la magnifique Grotte Blanche."),
      _buildTableRowData("Partiel 🧭", "1 kilomètre | ~50 minutes\nSe concentre sur les premières galeries et l'immense gouffre initial (La Grave)."),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70))),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}