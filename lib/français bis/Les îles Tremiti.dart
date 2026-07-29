import 'package:flutter/material.dart';

class IlesTremitiPage extends StatelessWidget {
  const IlesTremitiPage({super.key});

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
                  image: AssetImage('assets/imag/21.webp'), // Remplace par ton image principale
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
                    "ISOLE TREMITI 🏝️",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Un air des Caraïbes, version archipel sauvage des Pouilles 🇩🇴🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Situé au large de la péninsule du Gargano dans la mer Adriatique, l'archipel des Îles Tremiti est un paradis de biodiversité et de beauté naturelle. Composé principalement des îles de San Domino et San Nicola, ce joyau préservé éblouit par ses eaux turquoise d'une clarté absolue, ses criques de calcaire blanc et ses pinèdes odorantes. C'est une destination hors du temps qui marie plages sauvages paradisiaques et vestiges historiques médiévaux.",
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
                        _buildImageItem('assets/imag/21.webp'),
                        _buildImageItem('assets/imag/22.jpg'),
                        _buildImageItem('assets/imag/23.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("LES ÎLES & EXPLORATIONS ⚓"),
                  _buildContentBlock(
                      "San Domino (Nature & Farniente)",
                      "L'île la plus grande et la plus verdoyante, recouverte de pins d'Alep. C'est ici que se trouve la Cala delle Arene, la seule plage de sable fin de l'archipel, idéale pour la baignade dans des eaux translucides."
                  ),
                  _buildContentBlock(
                      "San Nicola (Histoire & Culture)",
                      "Le cœur historique des Tremiti. Dominée par l'imposante abbaye-forteresse fortifiée de Santa Maria a Mare, cette île rocheuse offre un voyage captivant dans le passé et des panoramas vertigineux."
                  ),
                  _buildContentBlock(
                      "Réserve Marine & Grottes en Bateau",
                      "Le meilleur moyen d'explorer l'archipel est de louer un petit bateau (gozzo) ou de faire une excursion guidée. Ne manquez pas la Grotta delle Rondinelle et la célèbre statue immergée de Padre Pio."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("TARIFS & CONSEILS PRATIQUES 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("LIAISONS MARITIMES ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Attention : Les voitures des non-résidents sont strictly interdites sur les îles. L'exploration se fait entièrement à pied, en vélo ou en bateau-taxi entre San Domino et San Nicola.",
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
          "Ferry A/R : ~35€ à 50€ (selon saison) | Taxe d'atterrissage : ~5€ | Accès îles : Gratuit",
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
    _buildCalendarRow("✅ Top", "Juin et Septembre pour une eau chaude, une météo parfaite et une affluence très respirable."),
    _buildCalendarRow("🎒 Info", "Pensez à réserver vos billets de ferry à l'avance en ligne (départs de Termoli, Vieste, Peschici ou Rodi Garganico)."),
    _buildCalendarRow("❌ Éviter", "Le mois d'août si vous n'aimez pas la foule compacte, ainsi que les jours de mer agitée (risques d'annulations)."),
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
      0: FlexColumnWidth(1.3),
      1: FlexColumnWidth(2.7),
    },
    border: TableBorder.all(color: Colors.white24),
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Saison", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Fréquence des Ferries / Hydroglisseurs", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Haute Saison\n(Juin - Sept)", "Nombreux départs quotidiens le matin (dès 8h00-9h00) du continent. Retours en fin d'après-midi (17h30-18h30)."),
      _buildTableRowData("Basse Saison\n(Oct - Mai)", "Liaisons très réduites, principalement depuis le port de Termoli. Horaires soumis aux conditions météo."),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Inter-Îles", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Des navettes maritimes circulent continuellement entre San Domino et San Nicola (trajet de quelques minutes, ~5€).", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 12), softWrap: true)),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}