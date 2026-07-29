import 'package:flutter/material.dart';

class RoccaCalascioPage extends StatelessWidget {
  const RoccaCalascioPage({super.key});

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
                  image: AssetImage('assets/ima/16.jpg'), // Remplace par ton image principale
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
                    "ROCCA CALASCIO 🏰",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Un air de citadelle d'Écosse ou de Minas Tirith, version sentinelle des Abruzzes 🏴󠁧󠁢󠁳󠁣󠁴󠁿🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Perchée à 1 460 mètres d’altitude au cœur du parc national du Gran Sasso, la Rocca di Calascio est l'une des forteresses les plus hautes et les plus spectaculaires d’Europe. Véritable icône de l'Italie médiévale, ce nid d'aigle en pierre calcaire domine un paysage sauvage et lunaire de montagnes à perte de vue. Parfaitement intégrée à la roche, cette sentinelle militaire semble flotter au-dessus du vide, offrant une plongée saisissante dans l'histoire des grands espaces italiens.",
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
                        _buildImageItem('assets/ima/18.webp'),
                        _buildImageItem('assets/ima/16.jpg'),
                        _buildImageItem('assets/ima/17.jpg'),
                        _buildImageItem('assets/ima/19.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("ÉPOPÉE HISTORIQUE 📜"),
                  _buildContentBlock(
                      "Des origines médiévales à Frédéric II",
                      "Mentionné dès les années 1240 sous le règne de Frédéric II, le site a d'abord servi de tour de guet stratégique pour contrôler les voies de transhumance. Les fouilles révèlent que le commerce de la laine et l'élevage ovin assuraient déjà une occupation stable et prospère à cette haute altitude."
                  ),
                  _buildContentBlock(
                      "L'âge d'or : Des Piccolomini aux Médicis",
                      "C'est entre le XVe et le XVIe siècle que la forteresse prend son allure colossale actuelle. La puissante famille siennoise des Piccolomini ajoute à la tour d'origine un mur d'enceinte flanqué de quatre imposantes tours circulaires aux angles. En 1579, les Médicis de Toscane rachètent le territoire, ouvrant une ère de grande richesse économique liée au commerce de la laine."
                  ),
                  _buildContentBlock(
                      "Du déclin à la renaissance cinématographique",
                      "Le manque d'eau chronique (les habitants dépendant exclusivement de citernes souterraines) et l'abandon du pastoralisme mènent la cité à un long déclin au XIXe siècle. Laissée en ruines, la forteresse est redécouverte dans les années 1980. Sa beauté irréelle et dramatique en a fait depuis le décor culte de nombreux films de cinéma internationaux (comme Ladyhawke ou Le Nom de la Rose)."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("CONSEILS PRATIQUES & SENSATIONS 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("RECOMMANDATIONS DE VISITE ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Attention : En raison de son altitude élevée (1 460 m), les conditions météorologiques peuvent changer de façon drastique et soudaine. Prévoyez toujours un coupe-vent, même en plein été.",
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
      Icon(Icons.terrain, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Accès aux ruines extérieures : Gratuit et libre | Navette village-citadelle en haute saison : ~2€",
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
    _buildCalendarRow("✅ Top", "Le coucher du soleil. La lumière rasante sur les montagnes environnantes et les pierres calcaires du château offre un panorama absolument féerique."),
    _buildCalendarRow("🎒 Info", "L'accès final se fait à pied via un sentier de marche depuis le village de Calascio. Privilégiez de bonnes chaussures de sport ou de randonnée."),
    _buildCalendarRow("❌ Éviter", "Les journées de tempête ou de brouillard épais en hiver, l'ascension pouvant devenir dangereuse et la visibilité sur la vallée étant nulle."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Moment", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Ambiance & Visibilité", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("En journée", "Idéal pour observer l'architecture militaire détaillée, l'église de Santa Maria della Pietà attenante et la grandeur brute du parc national."),
      _buildTableRowData("Crépuscule", "L'instant magique où le silence s'installe sur les Abruzzes et où le château prend des teintes dorées puis mystiques au crépuscule."),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}