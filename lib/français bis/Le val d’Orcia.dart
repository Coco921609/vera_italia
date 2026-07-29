import 'package:flutter/material.dart';

class ValDOrciaPage extends StatelessWidget {
  const ValDOrciaPage({super.key});

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
                  image: AssetImage('assets/imag/29.webp'), // Remplace par ton image principale
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
                    "VAL D'ORCIA 🍂",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Un air de Napa Valley en Californie, version chef-d'œuvre automnal toscan 🇺🇸🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Inscrit au patrimoine mondial de l'UNESCO, le Val d'Orcia incarne la quintessence du paysage toscan. Si la vallée est superbe toute l'année, c'est à l'automne qu'elle devient véritablement féerique. Les collines ondoyantes abandonnent leur vert printanier pour se draper d'une palette irréelle de tons ocre, or et pourpre. Entre les cyprès alignés au cordeau, les vignobles chargés de grappes et les brumes mystiques qui s'élèvent des vallons au petit matin, chaque panorama semble avoir été peint par un maître de la Renaissance.",
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
                        _buildImageItem('assets/imag/24.webp'),
                        _buildImageItem('assets/imag/25.jpg'),
                        _buildImageItem('assets/imag/26.webp'),
                        _buildImageItem('assets/imag/27.jpg'),
                        _buildImageItem('assets/imag/28.webp'),
                        _buildImageItem('assets/imag/29.webp'),
                        _buildImageItem('assets/imag/30.webp'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("INCONTOURNABLES D'AUTOMNE 🍇"),
                  _buildContentBlock(
                      "La Route des Cyprès & Brumes Matinales",
                      "Le spot le plus iconique se trouve près de San Quirico d'Orcia. À l'automne, le grand secret est de s'y rendre à l'aube : une brume dense et poétique enveloppe le pied des collines, laissant émerger la cime des cyprès sous les premiers rayons rasants du soleil. Un paradis pour les photographes."
                  ),
                  _buildContentBlock(
                      "La Route des Vins (Brunello & Montepulciano)",
                      "L'automne est la saison des vendanges et du renouveau des caves. C'est le moment idéal pour parcourir les vignobles dorés entourant les cités perchées de Montalcino et Montepulciano, et déguster des crus mondialement réputés au coin du feu dans une ancienne bâtisse en pierre."
                  ),
                  _buildContentBlock(
                      "Pienza & La Chapelle de Vitaleta",
                      "Flânez dans les ruelles pavées de Pienza, la 'ville idéale' de la Renaissance, réputée pour son fromage Pecorino (qui s'enrichit de nouvelles saveurs à cette saison). En chemin, faites un détour pour admirer la minuscule et solitaire chapelle de Vitaleta, isolée au milieu des champs couleur de bronze."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("TARIFS & CONSEILS PRATIQUES 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("ATMOSPHÈRE & LUMIÈRE ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Attention : Le Val d'Orcia ne se visite pas en transports en commun. Louer une voiture ou un scooter est impératif pour s'aventurer sur les routes blanches (strade bianche) non goudronnées qui mènent aux plus beaux points de vue.",
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
      Icon(Icons.landscape, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Accès Vallée : Gratuit | Dégustations de vin : ~20€ à 45€ | Parking Pienza : ~2€/h",
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
    _buildCalendarRow("✅ Top", "Fin octobre à mi-novembre. C'est l'apogée des couleurs chaudes ('foliage'), de la récolte des olives et des brumes matinales mystiques."),
    _buildCalendarRow("🎒 Info", "Apportez une veste chaude et un coupe-vent. Si les journées d'automne restent douces et ensoleillées, les matinées et les soirées en altitude sont fraîches."),
    _buildCalendarRow("❌ Éviter", "Le plein été (juillet/août) si tu rêves de paysages texturés. À cette période, la terre est récoltée, nue, aride et souvent brûlée par le soleil."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Lumière & Dynamique des Paysages", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Automne\n(Idéal Photo)", "Lumière douce toute la journée. Brumes spectaculaires dans les fonds de vallées entre 06:45 et 08:30. Nuances dorées et terre de Sienne."),
      _buildTableRowData("Printemps\n(Alternative)", "Vallée verdoyante et explosive de fleurs sauvages. Parfait pour un rendu dynamique, frais et contrasté sous un ciel changeant."),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Vignobles", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Les domaines viticoles restent ouverts pour les visites en automne, généralement de 10h00 à 18h00. Réservation très conseillée.", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 12), softWrap: true)),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}