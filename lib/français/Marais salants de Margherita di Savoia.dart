import 'package:flutter/material.dart';

class MaraisSalantsPage extends StatelessWidget {
  const MaraisSalantsPage({super.key});

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
                  image: AssetImage('assets/images/25.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("MARAIS SALANTS DE MARGHERITA DI SAVOIA  🦩", style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2)),
                  const SizedBox(height: 10),
                  const Text("Un air des marais d'Aigues-Mortes, version géante italienne 🇫🇷🇮🇹", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  const Text(
                    "Considéré comme le plus grand d'Europe, le marais salant de Margherita di Savoia est une merveille de la nature s'étendant sur 20 km le long de la côte adriatique. Couvrant 4 500 hectares au cœur des Pouilles, cette réserve naturelle protégée produit chaque année environ 500 000 tonnes de sel de mer. Un site spectaculaire qui attire les voyageurs, les photographes et les ornithologues du monde entier grâce à sa biodiversité incroyable.",
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
                        _buildImageItem('assets/images/21.jpg'),
                        _buildImageItem('assets/images/23.jpg'),
                        _buildImageItem('assets/images/26.jpg'),
                        _buildImageItem('assets/images/22.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("UN PEU D'HISTOIRE 📜"),
                  _buildContentBlock("Origines préhistoriques & antiques", "Dès l'âge du bronze, le sel se formait spontanément dans la lagune du lac Salpi. Des réservoirs en pierre de cette époque témoignent encore du drainage des minéraux. Les Romains exploitaient déjà activement ce précieux trésor dans leur centre habité nommé 'Salinis'."),
                  _buildContentBlock("La métamorphose du site", "Sous la domination royale, le site prend le nom de 'Regie Saline'. Au XVIIIe siècle, une seconde embouchure est creusée vers la mer pour purifier les eaux stagnantes du Pantano, posant ainsi les bases des installations modernes. En 1879, la ville est renommée Margherita di Savoia en l'honneur de la reine."),
                  _buildContentBlock("La perle écologique du Sud", "Déclarée zone humide d'importance internationale (Convention de Ramsar), la saline est aujourd'hui la plus vaste réserve animale du centre-sud de l'Italie. Elle accueille chaque année entre 20 000 et 50 000 spécimens d'oiseaux migrateurs, dont les majestueux flamants roses."),

                  const SizedBox(height: 30),
                  _buildSectionTitle("CONSEILS PRATIQUES 💡"),
                  const SizedBox(height: 15),
                  _buildReservationBanner(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("RÉSERVATION & CONTACTS 📞"),
                  const SizedBox(height: 15),
                  _buildContactTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Text("⚠️ Note : les horaires exacts de votre visite guidée seront convenus ensemble lors de votre appel.", style: TextStyle(color: Colors.white30, fontSize: 12)),
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

  Widget _buildReservationBanner() => Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(12)),
    child: const Row(children: [
      Icon(Icons.lock_outline, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
            "Accès uniquement sur réservation officielle",
            style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)
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
    _buildCalendarRow("✅ Top", "Printemps & Automne (idéal pour observer les oiseaux migrateurs)"),
    _buildCalendarRow("☀️ Ok", "Été (saison de la récolte du sel, mais forte chaleur)"),
    _buildCalendarRow("❌ Éviter", "Hiver (moins d'activité ornithologique sur le site)"),
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

  Widget _buildContactTable() => Table(
    columnWidths: const {
      0: FlexColumnWidth(1.2),
      1: FlexColumnWidth(2.8),
    },
    border: TableBorder.all(color: Colors.white24),
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Canal", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Informations officielles", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ]),
      _buildTableRowData("Site Web", "www.infosalina.it"),
      _buildTableRowData("Appels", "Pendant les heures de bureau uniquement"),
      _buildTableRowData("Visites", "Horaires à convenir lors de l'appel"),
    ],
  );

  TableRow _buildTableRowData(String label, String value) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(label, style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.w500))),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
  ]);
}