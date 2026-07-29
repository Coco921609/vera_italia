import 'package:flutter/material.dart';

class GrotteMangiapanePage extends StatelessWidget {
  const GrotteMangiapanePage({super.key});

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
                  image: AssetImage('assets/imag/11.webp'),
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
                      "GROTTE MANGIAPANE 🛖",
                      style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2)
                  ),
                  const SizedBox(height: 10),
                  const Text(
                      "Un air de Cappadoce en Turquie, version troglodyte sicilienne 🇹🇷🇮🇹",
                      style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Située près de Custonaci en Sicile, la Grotte Mangiapane is la plus grande des grottes de Scurati. Ce lieu hors du temps abrite un minuscule village rural datant du XIXe siècle, construit directement à l'intérieur d'une majestueuse cavité haute de 70 mètres. Abandonné dans les années 1950 puis soigneusement restauré, il témoigne de la vie paysanne sicilienne d'autrefois. Aujourd'hui transformé en musée, ses maisonnettes de pierre, ses étables et ses fours à bois vous plongent dans une atmosphère authentique, entre mer et montagne.",
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
                        _buildImageItem('assets/imag/12.jpg'),
                        _buildImageItem('assets/imag/14.jpg'),
                        _buildImageItem('assets/imag/15.webp'),
                        _buildImageItem('assets/imag/11.webp'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("INCONTOURNABLES & ÉVÉNEMENTS 🏺"),
                  _buildContentBlock(
                      "Le Village Musée (Toute l'année)",
                      "Une promenade libre à travers les anciennes habitations aménagées. Vous y découvrirez les outils agricoles d'époque, le moulin, la chapelle et les ateliers authentiques du cordonnier ou du forgeron."
                  ),
                  _buildContentBlock(
                      "Le Musée Vivant (Période Estivale)",
                      "Durant l'été, le village reprend vie grâce à des artisans locaux qui viennent exercer les métiers d'antan (poterie, tissage, fabrication de fromage) directement dans les échoppes de la grotte."
                  ),
                  _buildContentBlock(
                      "La Crèche Vivante (Période de Noël)",
                      "Le célèbre 'Presepe Vivente' ! À l'approche de Noël, la grotte se transforme en une spectaculaire crèche vivante avec plus de 160 figurants, illuminée à la torche dans une ambiance magique."
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
                      "⚠️ Attention : Étant géré par une association locale, les horaires peuvent être irréguliers hors saison. Il est fortement recommandé de vérifier localement ou sur les pages officielles avant de vous déplacer.",
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
      Icon(Icons.euro_symbol, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Plein : ~8€ | Réduit : ~5€ | Crèche Vivante : Tarifs spécifiques",
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
    _buildCalendarRow("✅ Top", "Noël (pour la Crèche Vivante) et l'Été pour voir les artisans au travail dans le Musée Vivant."),
    _buildCalendarRow("🎒 Info", "Le sol est en pierre et en terre battue, prévoyez des chaussures plates et confortables."),
    _buildCalendarRow("❌ Éviter", "Le hors-saison (Novembre, Février, Mars) sans appeler à l'avance, car le site peut être fermé."),
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
      0: FlexColumnWidth(1.3),
      1: FlexColumnWidth(2.7),
    },
    border: TableBorder.all(color: Colors.white24),
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Période", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Plages horaires (Générales)", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ]),
      _buildTableRowData("Haute Saison\n(Juin - Sept)", "Tous les jours : 10:00 - 18:00 (Souvent prolongé jusqu'à 19:00 en août)"),
      _buildTableRowData("Basse Saison\n(Printemps/Automne)", "Variable. Généralement ouvert le week-end : 10:00 - 18:00"),
      _buildTableRowData("Noël\n(Déc - Janv)", "Crèche Vivante : Ouvert en fin d'après-midi / soirée (environ 16:00 - 21:00)"),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Visite", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Visite libre (environ 45 min à 1h). Des panneaux explicatifs sont présents sur place.", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 12), softWrap: true)),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70))),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}