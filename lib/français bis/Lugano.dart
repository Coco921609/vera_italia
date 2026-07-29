import 'package:flutter/material.dart';

class LuganoPage extends StatelessWidget {
  const LuganoPage({super.key});

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
                  image: AssetImage('assets/imag/1.jpg'), // Pensez à changer le nom de l'image
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
                    "LUGANO 🏔️",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "L'élégance suisse au charme purement méditerranéen 🇨🇭🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Située dans le canton italophone du Tessin en Suisse, Lugano est une perle sertie entre les montagnes et les eaux glaciaires de son lac. Avec ses palmiers, ses places aux arcades colorées et ses panoramas spectaculaires, la ville offre un mélange parfait entre la précision suisse et la dolce vita italienne. De l'ascension du Monte San Salvatore aux promenades paisibles dans le Parco Ciani, Lugano is une invitation à la contemplation.",
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
                        _buildImageItem('assets/imag/1.jpg'),
                        _buildImageItem('assets/imag/2.jpg'),
                        _buildImageItem('assets/imag/3.jpg'),
                        _buildImageItem('assets/imag/4.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("INCONTOURNABLES & BALADES 📜"),
                  _buildContentBlock(
                      "Le Monte San Salvatore",
                      "Accessible en funiculaire depuis Paradiso, il offre une vue imprenable à 360° sur le lac de Lugano, les Alpes et même le nord de l'Italie. Une randonnée classique permet de redescendre vers le pittoresque village de Morcote."
                  ),
                  _buildContentBlock(
                      "Le Parco Ciani & Le Lac",
                      "Le cœur vert de la ville. Avec ses vieux arbres, ses statues et sa célèbre porte en fer forgé ouvrant directement sur les eaux du lac, c'est l'endroit idéal pour une promenade au coucher du soleil."
                  ),
                  _buildContentBlock(
                      "Le Sentiero di Gandria",
                      "Un magnifique chemin piétonnier (environ 3 km) qui longe le lac de Castagnola jusqu'à Gandria, un ancien village de pêcheurs aux ruelles étroites et escarpées, resté figé dans le temps."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("CONSEILS PRATIQUES 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("FRÉQUENTATION & ACCÈS ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Attention : La ville se visite toute l'année, mais les funiculaires (San Salvatore, Brè) ont des fermetures hivernales partielles.",
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
      Icon(Icons.account_balance_wallet, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Ville/Lac : Gratuit | Funiculaires & Musées : Payant (Francs Suisses CHF)",
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
    _buildCalendarRow("✅ Top", "Printemps & Été (fleurs du Parco Ciani, baignade, dolce vita)"),
    _buildCalendarRow("🍂 Ok", "Automne (couleurs sublimes mais journées plus courtes)"),
    _buildCalendarRow("❌ Éviter", "Hiver (beaucoup d'attractions fermées, brume sur le lac)"),
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
      1: FlexColumnWidth(1.3),
      2: FlexColumnWidth(2.0),
    },
    border: TableBorder.all(color: Colors.white24),
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Saisons", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Funiculaires", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Conseils", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Printemps", "9h00 - 18h00", "Idéal pour randonner"),
      _buildTableRowData("Été", "9h00 - 23h00", "Venir tôt, très prisé"),
      _buildTableRowData("Automne", "9h00 - 17h00", "Belles lumières au sommet"),
      _buildTableRowData("Hiver", "Souvent fermé", "Privilégier la ville basse"),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Foule", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Forte en été", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 11), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Réserver les bateaux", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 11), softWrap: true)),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h, String da) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(da, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}