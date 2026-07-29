import 'package:flutter/material.dart';

class DolomitesPage extends StatelessWidget {
  const DolomitesPage({super.key});

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
                  image: AssetImage('assets/ima/28.jpeg'), // Remplace par ton image principale
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
                    "LES DOLOMITES 🏔️",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Un air de parcs nationaux de l'Ouest américain, version sommets monumentaux des Alpes 🇺🇸🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Inscrites au patrimoine mondial de l'UNESCO, les Dolomites s'élèvent majestueusement dans le nord-est de l'Italie. Caractérisées par de gigantesques murailles de roche calcaire, des aiguilles acérées et des vallées verdoyantes constellées de lacs alpins aux eaux turquoise, ces montagnes offrent un paysage d'une verticalité dramatique. Au lever et au coucher du soleil, un phénomène unique appelé 'Enrosadira' embrase la roche, teintant les sommets de nuances spectaculaires allant du rose vif au rouge feu.",
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
                        _buildImageItem('assets/ima/28.jpeg'),
                        _buildImageItem('assets/ima/29.jpg'),
                        _buildImageItem('assets/ima/29.webp'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("SITES EMBLÉMATIQUES 📜"),
                  _buildContentBlock(
                      "Les Tre Cime di Lavaredo",
                      "Ces trois gigantesques obélisques rocheux alignés sont le symbole incontournable des Dolomites. Le sentier de randonnée qui en fait le tour offre des points de vue vertigineux sur ces parois de dolomie pure qui défient les lois de la gravité."
                  ),
                  _buildContentBlock(
                      "Le Lac de Braies (Lago di Braies)",
                      "Véritable perle des Alpes, ce lac d'altitude est célèbre pour le reflet parfait des parois rocheuses de la Croda del Becco dans ses eaux vert émeraude. Ses barques en bois traditionnelles en font l'un des lieux les plus poétiques de la région."
                  ),
                  _buildContentBlock(
                      "L'Alpe di Siusi (Seiser Alm)",
                      "Le plus haut alpage d'Europe offre un contraste saisissant : une immense prairie vallonnée suspendue à 1 800 mètres d'altitude, encadrée par les profils massifs et abrupts des pics du Sassolungo et du Sciliar."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("CONSEILS PRATIQUES & LOGISTIQUE 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("SAISONS & ACCÈS ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Attention : Les prix des péages de routes alpines (comme celle des Tre Cime) et les horaires des remontées mécaniques peuvent changer au cours de l'année. En intersaison (mai et novembre), la majorité des téléphériques sont fermés.",
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
      Icon(Icons.hiking, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Accès aux parcs : Gratuit | Route à péage Tre Cime : ~30€/voiture | Pass téléphériques optionnel.",
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
    _buildCalendarRow("✅ Top", "De mi-juin à septembre pour la randonnée et la floraison des alpages. De décembre à mars pour le ski au cœur du domaine Dolomiti Superski."),
    _buildCalendarRow("🎒 Info", "Certains lacs et cols très populaires (comme Braies) régulent l'accès automobile en été. Privilégiez les navettes locales ou arrivez avant 08h00."),
    _buildCalendarRow("❌ Éviter", "Le mois de mai et la fin d'automne (octobre/novembre), car la météo est très instable, la neige bloque les cols et les refuges sont fermés."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Saison", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Dynamique & Conseils de Visite", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Été\n(Juin - Sept)", "Idéal pour la haute randonnée, les vias ferratas et l'ouverture complète des refuges d'altitude (Rifugi)."),
      _buildTableRowData("Hiver\n(Déc - Mars)", "Métamorphose totale sous la neige. Paradis du ski de piste, du ski de fond et des randonnées en raquettes."),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}