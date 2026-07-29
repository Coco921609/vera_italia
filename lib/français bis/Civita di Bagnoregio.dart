import 'package:flutter/material.dart';

class CivitaDiBagnoregioPage extends StatelessWidget {
  const CivitaDiBagnoregioPage({super.key});

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
                  image: AssetImage('assets/ima/1.jpg'), // Remplace par ton image principale
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
                      "CIVITA DI BAGNOREGIO 🏰",
                      style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2)
                  ),
                  const SizedBox(height: 10),
                  const Text(
                      "Un air de Grand Canyon ou de Météores, version cité médiévale suspendue du Latium 🇺🇸🇬🇷🇮🇹",
                      style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Surnommée 'la ville qui meurt' (la città che muore) en raison de l'érosion progressive de la falaise de tuf sur laquelle elle repose, Civita di Bagnoregio est un chef-d'œuvre de l'époque médiévale et étrusque. Situé dans le Latium, ce village spectaculaire n'est accessible que par un unique et vertigineux pont piétonnier suspendu au-dessus d'une immense vallée de ravines rocheuses. Lorsque la brume s'installe, l'îlot de pierre semble flotter comme par magie au-dessus des nuages.",
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
                        _buildImageItem('assets/ima/1.jpg'),
                        _buildImageItem('assets/ima/2.jpg'),
                        _buildImageItem('assets/ima/4.webp'),
                        _buildImageItem('assets/ima/3.jpg'),
                        _buildImageItem('assets/ima/5.webp'),
                        _buildImageItem('assets/ima/6.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("EXPLORATIONS HISTORIQUES 📜"),
                  _buildContentBlock(
                      "Le Pont Suspendu & Panorama",
                      "La découverte commence par la traversée à pied de la passerelle de 300 mètres de long. C'est une expérience inoubliable où l'on prend conscience de l'isolement total du village et de la fragilité géologique du site."
                  ),
                  _buildContentBlock(
                      "La Porte Santa Maria & Les Ruelles",
                      "Entrez dans le village en franchissant cette porte monumentale taillée directement dans la roche par les Étrusques. Derrière, un dédale de ruelles fleuries, de maisons en pierre datant du Moyen Âge et de cours intérieures préservées vous attend."
                  ),
                  _buildContentBlock(
                      "Le Belvédère de la Vallée des Calanques",
                      "Au bout du village, les jardins suspendus et les belvédères offrent des vues plongeantes imprenables sur le paysage lunaire et spectaculaire des calanques argileuses (i calanchi) qui encerclent la colline."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("CONSEILS PRATIQUES & BUDGET 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("FRÉQUENTATION & HORAIRES ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Attention : Le village compte moins d'une douzaine d'habitants permanents. La majorité des petits commerces et restaurants ferment ou réduisent fortement leurs horaires durant la saison hivernale.",
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
    child: const Row(children: [
      Icon(Icons.euro, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Ticket d'entrée : ~5€ (soutien à la conservation) | Parking belvédère : ~2€/h",
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
    _buildCalendarRow("✅ Top", "Printemps et automne. Les températures sont idéales pour grimper la passerelle et les brumes matinales d'octobre offrent une ambiance magique."),
    _buildCalendarRow("🎒 Info", "La montée finale sur la passerelle est assez raide. Privilégiez de bonnes chaussures de marche et voyagez léger sans bagages encombrants."),
    _buildCalendarRow("❌ Éviter", "Les week-ends de forte affluence en été, car la passerelle étroite s'engorge rapidement sous la chaleur étouffante de la mi-journée."),
  ]);

  Widget _buildCalendarRow(String status, String info) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 70, child: Text(status, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Période", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Conseils de Visite & Affluence", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ]),
      _buildTableRowData("Matinée\n(08:00 - 10:00)", "Le meilleur moment pour éviter la foule des excursions d'une journée. Lumière rutilante parfaite pour photographier la silhouette extérieure."),
      _buildTableRowData("Fin de journée\n(Après 17h00)", "Le village retrouve son calme authentique. Les couchers de soleil embrasent les falaises de tuf dans une atmosphère paisible."),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Accès", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(10.0), child: Text("La billetterie est ouverte tous les jours de 08h00 à 20h00. En dehors de ces heures, l'accès au pont reste ouvert librement.", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 12), softWrap: true)),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70))),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}