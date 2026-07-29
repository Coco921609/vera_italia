import 'package:flutter/material.dart';

class ChutesDeSanFelePage extends StatelessWidget {
  const ChutesDeSanFelePage({super.key});

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
                  image: AssetImage('assets/images/16.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("CHUTES DE SAN FELE 🌊", style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2)),
                  const SizedBox(height: 10),
                  const Text("Un air des cascades de Plitvice, Croatie, version sauvage italienne 🇭🇷🇮🇹", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  const Text(
                    "Au cœur des Apennins lucaniens en Basilicate, les cascades di San Fele offrent un spectacle digne d'un conte de fées. Formées par les sauts singuliers du ruisseau Bradano dans la vallée de Vitalba, elles se dévoilent au milieu d'une nature luxuriante et préservée. Ce sanctuaire sauvage, mêlant anciens moulins oubliés et forêts d'un calme absolu, invite à l'évasion à travers ses sentiers de randonnée historiques et ses torrents tumultueux.",
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
                        _buildImageItem('assets/images/20.jpeg'),
                        _buildImageItem('assets/images/17.jpg'),
                        _buildImageItem('assets/images/18.jpg'),
                        _buildImageItem('assets/images/19.jpg'),
                        _buildImageItem('assets/images/15.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("ITINÉRAIRES & RANDONNÉES 📜"),
                  _buildContentBlock("L'itinéraire vert - U Urtone (2 km)", "Un parcours d'environ une heure partant du village. Il mène à la cascade U Urtone, haute de 22 mètres. Le sentier longe le ruisseau Bradano à travers d'anciens ouvrages hydrauliques des années 50 et les ruines d'un moulin historique."),
                  _buildContentBlock("Le Paradis & Les Jumeaux", "Le Paradis is un sentier très court (10 min) baigné dans un silence absolu. Les Jumeaux (300 m) dévoile deux cascades nées de la rencontre magique entre le ruisseau Bradano et celui d'Acquafredda."),
                  _buildContentBlock("Le sentier du Pont (4,5 km)", "Le plus long et sauvage des itinéraires (environ 4 heures de marche). Il s'enfonce dans une nature totalement préservée et franchit un magnifique pont historique construit dans les années 20."),

                  const SizedBox(height: 30),
                  _buildSectionTitle("CONSEILS PRATIQUES 💡"),
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
                    child: Text("⚠️ Attention : les horaires d'accès sont libres mais suivez les périodes recommandées.", style: TextStyle(color: Colors.white30, fontSize: 12)),
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
    child: const Row(children: [Icon(Icons.euro_symbol, color: Colors.greenAccent), SizedBox(width: 10), Expanded(child: Text("Accès au site : Gratuit", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)))]),
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
    _buildCalendarRow("✅ Top", "Automne (magnifique couleur des arbres avec chute d'eau au lever ou coucher du soleil) & Printemps"),
    _buildCalendarRow("☀️ Ok", "Été (venez plus tôt pour éviter la chaleur)"),
    _buildCalendarRow("❌ Éviter", "Hiver"),
  ]);

  Widget _buildCalendarRow(String status, String info) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 70, child: Text(status, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        Expanded(child: Text(info, style: const TextStyle(color: Colors.white70, height: 1.3), softWrap: true)),
      ],
    ),
  );

  Widget _buildHoursTable() => Table(
    columnWidths: const {
      0: FlexColumnWidth(1.1),
      1: FlexColumnWidth(1.3),
      2: FlexColumnWidth(1.6),
    },
    border: TableBorder.all(color: Colors.white24),
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Saisons", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Horaires", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Conseils", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ]),
      _buildTableRowData("Printemps", "Tout moment", "Recommandé"),
      _buildTableRowData("Été", "Tout moment", "Venir tôt"),
      _buildTableRowData("Automne", "Tout moment", "Lever ou coucher"),
      _buildTableRowData("Hiver", "Tout moment", "À éviter"),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Foule", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Venir matin ou soir", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 12))),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Surtout en été", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 12))),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h, String da) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70))),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70))),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(da, style: const TextStyle(color: Colors.white70))),
  ]);
}