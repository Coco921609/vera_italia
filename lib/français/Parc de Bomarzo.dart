import 'package:flutter/material.dart';

class ParcBomarzoPage extends StatelessWidget {
  const ParcBomarzoPage({super.key});

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
                  image: AssetImage('assets/images/7.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("PARC DE BOMARZO 👹", style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2)),
                  const SizedBox(height: 10),
                  const Text("Un air de Heligan et du domaine de Kuks 🇬🇧🇨🇿", style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  const Text(
                    "Le Bois Sacré, surnommé le « Parc des Monstres », est le plus ancien jardin de sculptures au monde. Imaginé dès 1552 par le Prince Vicino Orsini, ce site rompt avec les codes classiques des jardins italiens. Orsini a extrait des rochers sur place des créatures oniriques et grotesques, créant un labyrinthe mystérieux entre art, magie et littérature qui fascine les visiteurs depuis des siècles.",
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
                        _buildImageItem('assets/images/8.jpg'),
                        _buildImageItem('assets/images/10.jpg'),
                        _buildImageItem('assets/images/11.jpg'),
                        _buildImageItem('assets/images/12.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("TARIFS 🎟️"),
                  const SizedBox(height: 15),
                  _buildPriceBlock("Adultes (> 13 ans)", "16,00 €"),
                  _buildPriceBlock("Enfants (4 à 13 ans)", "10,00 €"),
                  _buildPriceBlock("Nourrissons (< 4 ans)", "Libre !"),

                  const SizedBox(height: 30),
                  _buildSectionTitle("CONSEILS PRATIQUES 💡"),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("HORAIRES D'OUVERTURE ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text("⚠️ Attention : les tarifs et horaires peuvent changer au cours de l'année.", style: TextStyle(color: Colors.white30, fontSize: 12)),
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

  Widget _buildPriceBlock(String label, String price) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(label, style: const TextStyle(color: Colors.white70), softWrap: true)),
        const SizedBox(width: 10),
        Text(price, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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

  Widget _buildCalendarSection() => Column(children: [
    const SizedBox(height: 5),
    _buildCalendarRow("✅ Top", "Printemps & Automne (lumière idéale)"),
    _buildCalendarRow("❌ Éviter", "Été (chaleur) & week-ends fréquentés"),
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

  Widget _buildHoursTable() => Table(
    columnWidths: const {
      0: FlexColumnWidth(1.2),
      1: FlexColumnWidth(1.3),
      2: FlexColumnWidth(1.5),
    },
    border: TableBorder.all(color: Colors.white24),
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Période", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Horaires", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Dernière adm.", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ]),
      _buildTableRowData("Nov - Fév", "09:00-17:00", "16:00"),
      _buildTableRowData("Mars - Sept", "09:00-19:00", "18:00"),
      _buildTableRowData("Octobre", "09:00-17/18h", "1h avant"),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Foule", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Privilégiez 09h ou fin de journée", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 12))),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Surtout Été", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 12))),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h, String da) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70))),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70))),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(da, style: const TextStyle(color: Colors.white70))),
  ]);
}