import 'package:flutter/material.dart';

class GiardinoDeiTarocchiPage extends StatelessWidget {
  const GiardinoDeiTarocchiPage({super.key});

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
                  image: AssetImage('assets/ima/22.webp'), // Remplace par ton image principale
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
                    "GIARDINO DEI TAROCCHI 🃏",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Un air de Parc Güell ou de palais surréaliste, version mosaïque magique de la Toscane 🇪🇸🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Imaginé par l'artiste de génie Niki de Saint Phalle de 1978 jusqu'à sa mort en 2002, le Jardin du Tarot est un parc de sculture ésotérique et fantastique situé à Capalbio. Inspiré par les cartes des 22 arcanes majeurs, ce chef-d'œuvre monumental abrite des géants de béton recouverts de mosaïques étincelantes, de céramiques colorées, de miroirs et de verres précieux. Une aventure artistique et visuelle unique au monde, où le rêve et la folie des grandeurs s'unissent sous le soleil toscan.",
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
                        _buildImageItem('assets/ima/22.webp'),
                        _buildImageItem('assets/ima/21.jpg'),
                        _buildImageItem('assets/ima/20.webp'),
                        _buildImageItem('assets/ima/24.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("SERVICES & INFOS SUR SITE ✨"),
                  const SizedBox(height: 15),
                  _buildServicesGrid(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("SCULPTURES & SYMBOLS 📜"),
                  _buildContentBlock(
                      "Les 22 Arcanes Majeurs",
                      "Le parc est une transcription vivante du jeu de Tarot. Chaque sculpture géante incarne une figure symbolique (L'Impératrice, Le Magicien, La Force...) dans laquelle le visiteur peut parfois entrer, s'abriter ou se perdre à travers des jeux de miroirs déroutants."
                  ),
                  _buildContentBlock(
                      "L'Art de la Mosaïque et des Miroirs",
                      "Niki de Saint Phalle a assemblé à la main des milliers d'éclats de verre précieux et de mosaïques aux couleurs vives. Les surfaces réfléchissantes captent la lumière naturelle pour redessiner le paysage environnant au fil des heures."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("TARIFS DES BILLETS 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("OUVERTURE & HORAIRES ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Attention : Les prix et horaires peuvent changer au cours de l'année. Les billets achetés en ligne ne sont ni échangeables ni remboursables (même en cas de pluie, le parc restant ouvert).",
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
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("• Plein tarif : 15,00 €", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold), softWrap: true),
        SizedBox(height: 5),
        Text("• Tarif réduit : 10,00 € (7-22 ans, plus de 65 ans, résidents Capalbio, groupes dès 25 pers.)", style: TextStyle(color: Colors.white70, fontSize: 13), softWrap: true),
        SizedBox(height: 5),
        Text("• Scolaires : 8,00 € par élève (groupes d'au moins 10 élèves)", style: TextStyle(color: Colors.white70, fontSize: 13), softWrap: true),
        SizedBox(height: 5),
        Text("• Gratuit : 0 à 6 ans, situation de handicap (supérieure à 67%) et son accompagnateur.", style: TextStyle(color: Colors.white70, fontSize: 13), softWrap: true),
        SizedBox(height: 8),
        Text("⚠️ Justificatif obligatoire à l'entrée pour les tarifs réduits/gratuits.", style: TextStyle(color: Colors.orangeAccent, fontSize: 12, fontWeight: FontWeight.bold), softWrap: true),
      ],
    ),
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

  Widget _buildServicesGrid() => Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(12)),
    child: const Column(
      children: [
        Row(children: [Icon(Icons.schedule, color: Color(0xFFFFD700)), SizedBox(width: 10), Expanded(child: Text("Durée de visite : ~1h30m (Tour sans guide)", style: TextStyle(color: Colors.white70), softWrap: true))]),
        SizedBox(height: 8),
        Row(children: [Icon(Icons.local_parking, color: Colors.greenAccent), SizedBox(width: 10), Expanded(child: Text("Parking gratuit et non surveillé", style: TextStyle(color: Colors.white70), softWrap: true))]),
        SizedBox(height: 8),
        Row(children: [Icon(Icons.pets, color: Colors.amberAccent), SizedBox(width: 10), Expanded(child: Text("Animaux admis (chiens tenus en laisse)", style: TextStyle(color: Colors.white70), softWrap: true))]),
        SizedBox(height: 8),
        Row(children: [Icon(Icons.accessible, color: Colors.lightBlueAccent), SizedBox(width: 10), Expanded(child: Text("Accessibilité partielle", style: TextStyle(color: Colors.white70), softWrap: true))]),
        SizedBox(height: 8),
        Row(children: [Icon(Icons.menu_book, color: Colors.white), SizedBox(width: 10), Expanded(child: Text("Librairie (Bookshop) & Caffetteria sur place", style: TextStyle(color: Colors.white70), softWrap: true))]),
        SizedBox(height: 8),
        Row(children: [Icon(Icons.smoke_free, color: Colors.redAccent), SizedBox(width: 10), Expanded(child: Text("Interdiction de fumer dans le parc", style: TextStyle(color: Colors.white70), softWrap: true))]),
      ],
    ),
  );

  Widget _buildCalendarSection() => Column(children: [
    const SizedBox(height: 5),
    _buildCalendarRow("✅ Réservation", "Seul l’achat en ligne garantit l’entrée au Jardin. Le nombre de visiteurs quotidiens est strictly limité pour préserver les œuvres."),
    _buildCalendarRow("🎒 Info", "Aucune visite guidée ou privée n'est proposée par l'établissement. La découverte se fait librement à votre rythme."),
    _buildCalendarRow("❌ Important", "Les billets ne sont valables que pour la date et l’heure choisies. L'accès peut vous être refusé en cas de retard ou d'erreur de jour."),
  ]);

  Widget _buildCalendarRow(String status, String info) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 85, child: Text(status, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Période / Jours", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Horaires d'Ouverture", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Du 1er avril\nau 15 octobre", "Tous les jours : 14h30 - 19h30"),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Admission", style: TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Dernière entrée autorisée à 18h15. Le jardin reste ouvert les jours fériés et de pluie.", style: TextStyle(color: Colors.white70, fontSize: 13), softWrap: true)),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}