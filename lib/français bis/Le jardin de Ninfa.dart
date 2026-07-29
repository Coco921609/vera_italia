import 'package:flutter/material.dart';

class JardinDeNinfaPage extends StatelessWidget {
  const JardinDeNinfaPage({super.key});

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
                  image: AssetImage('assets/ima/7.webp'), // Remplace par ton image principale
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
                    "GIARDINO DI NINFA 🌺",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Un air de domaine romantique anglais, version oasis médiévale du Latium 🇬🇧🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Classé parmi les plus beaux jardins romantiques du monde, le Jardin de Ninfa est un éden suspendu au-dessus du temps, situé dans la province de Latina. Aménagé sur les ruines d'une ancienne cité médiévale florissante, ce parc unique voit cohabiter des ruines recouvertes de lierre, des cours d'eau cristallins traversés par des ponts de pierre et une variété infinie de plantes exotiques et de roses anciennes. C'est une œuvre d'art vivante où la nature et l'histoire s'embrassent poétiquement.",
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
                        _buildImageItem('assets/ima/7.webp'),
                        _buildImageItem('assets/ima/8.webp'),
                        _buildImageItem('assets/ima/9.webp'),
                        _buildImageItem('assets/ima/10.webp'),
                        _buildImageItem('assets/ima/11.webp'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("PROMENADES & VESTIGES ✨"),
                  _buildContentBlock(
                      "Les Ruines de l'Église Santa Maria Maggiore",
                      "Parmi les vestiges les plus spectaculaires, l'ancienne nef de l'église principale est aujourd'hui tapissée de flore grimpante. Les restes des fresques médiévales murmurent encore l'histoire passée de la cité."
                  ),
                  _buildContentBlock(
                      "La Rivière Ninfa & Ses Ponts",
                      "Une eau pure, d'une transparence absolue, s'écoule directement des montagnes environnantes pour border les ruines. Les ponts de style romantique offrent des points de vue féeriques dignes d'un tableau impressionniste."
                  ),
                  _buildContentBlock(
                      "La Collection de Roses & Flore Exotique",
                      "Le microclimat unique du site permet à des magnolias, des érables japonais et des milliers de roses grimpantes de s'épanouir le long des vieux murs de pierre, submergeant le jardin de parfums subtils à la floraison."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("TARIFS & CONSEILS PRATIQUES 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("HORAIRES D'OUVERTURE ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Attention : Les prix et horaires peuvent changer au cours de l'année. Le jardin se visite principalement sur réservation obligatoire en ligne afin de préserver son écosystème fragile.",
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
      Icon(Icons.local_activity, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Billet Adulte : 20,75 € TVA incluse | Moins de 12 ans : Gratuit",
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
    _buildCalendarRow("✅ Top", "Le printemps (avril à juin) pour assister à la floraison spectaculaire des roses anciennes et des cerisiers."),
    _buildCalendarRow("🎒 Info", "Les visites sont exclusivement guidées et durent environ une heure afin de respecter la tranquillité et l'histoire du site."),
    _buildCalendarRow("❌ Éviter", "De venir sans réservation préalable. Le nombre d'entrées quotidiennes est strictly limité pour protéger la flore."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Jour", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Horaires de Visite", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Lundi - Jeudi", "Fermé"),
      _buildTableRowData("Vendredi", "17:15 - 19:00"),
      _buildTableRowData("Samedi", "17:15 - 19:00"),
      _buildTableRowData("Dimanche", "17:15 - 19:00"),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}