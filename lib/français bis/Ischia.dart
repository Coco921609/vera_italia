import 'package:flutter/material.dart';

class IschiaPage extends StatelessWidget {
  const IschiaPage({super.key});

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
                  image: AssetImage('assets/ima/39.webp'), // Remplace par ton image principale
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
                    "ISCHIA 🏝️",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Un air de riviera tropicale ou de paradis thermal, version volcanique et authentique de la Campanie 🏝️🌋🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Surnommée 'l'île verte' en raison de sa végétation luxuriante, Ischia est la plus grande île de la baie de Naples. Contrairement à sa voisine Capri, cette perle d'origine volcanique brille par son authenticité préservée et ses sources thermales naturelles réputées depuis l'Antiquité romaine. Des jardins tropicaux luxuriants aux villages de pêcheurs colorés, en passant par ses plages de sable fin et son imposant château médiéval suspendu sur un îlot de roche volcanique, Ischia est un sanctuaire de bien-être où la nature déploie une énergie brute et bienfaisante.",
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
                        _buildImageItem('assets/ima/43.webp'),
                        _buildImageItem('assets/ima/42.jpg'),
                        _buildImageItem('assets/ima/39.webp'),
                        _buildImageItem('assets/ima/45.jpg'),
                        _buildImageItem('assets/ima/40.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("LES TRÉSORS DE L'ÎLE VERTE 📜"),
                  _buildContentBlock(
                      "Le Château Aragonais (Castello Aragonese)",
                      "Véritable symbole fortifié d'Ischia, cette citadelle médiévale spectaculaire trône sur un îlot rocheux volcanique, relié à l'île principale par un pont en pierre. Ses remparts abritent des églises anciennes, des jardins suspendus et offrent une vue plongeante et vertigineuse sur toute la baie."
                  ),
                  _buildContentBlock(
                      "Les Parcs Thermaux et la Baie de Sorgeto",
                      "L'activité volcanique souterraine alimente d'incroyables parcs thermaux dotés de piscines à températures variées nichées dans des jardins tropicaux. À Sorgeto, les sources d'eau bouillante jaillissent directement dans les vagues de la mer, créant des bassins de roche chaude en accès libre à même l'océan."
                  ),
                  _buildContentBlock(
                      "Sant'Angelo : Le Refuge des Pêcheurs",
                      "Ce village de pêcheurs pittoresque et entièrement piéton est rattaché au reste de l'île par un fin cordon de sable. Avec ses maisons pastel adossées à un immense promontoire rocheux, ses ruelles calmes et ses cafés en bord de mer, il incarne la douceur de vivre méditerranéenne absolue."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("CONSEILS PRATIQUES & SENSATIONS 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("LOGISTIQUE & ACCÈS MARITIME ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Attention : La circulation des véhicules des non-résidents est strictly interdite sur l'île durant une grande partie de l'année (printemps-été). Privilégiez l'excellent réseau de bus locaux ou louez un scooter sur place.",
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
      Icon(Icons.directions_boat, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Accès en ferry/aligre : ~12€ à ~25€ le trajet depuis Naples ou Pozzuoli | Entrée Château Aragonais : ~12€",
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
    _buildCalendarRow("✅ Top", "Le printemps (avril-juin) et le début de l'automne (septembre-octobre). L'île y est verdoyante, fleurie, et les parcs thermaux se savourent pleinement loin de la foule estivale."),
    _buildCalendarRow("🎒 Info", "Pour une expérience thermale magique et gratuite, descendez les marches menant à la crique de Sorgeto de nuit : vous pourrez vous baigner dans l'eau chaude thermale sous les étoiles."),
    _buildCalendarRow("❌ Éviter", "Les mois de juillet et août si vous fuyez la cohue. Les plages et les réseaux de bus y sont saturés par les flux massifs de vacanciers italiens."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Transport", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Fréquence, Durée et Ports de Départ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Traghetto\n(Ferry)", "Plus économique et plus lent (~90 min). Permet l'embarquement des voitures autorisées. Départs de Naples (Calata Porta di Massa) ou Pozzuoli."),
      _buildTableRowData("Aliscafo\n(Hydroptère)", "Rapide (~50 min) et réservé aux piétons uniquement. Idéal pour une excursion à la journée. Départs depuis le port de Naples Molo Beverello."),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}