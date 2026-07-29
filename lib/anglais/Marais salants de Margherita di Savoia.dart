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
                  const Text("MARGHERITA DI SAVOIA SALT PANS  🦩", style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2)),
                  const SizedBox(height: 10),
                  const Text("A touch of the Aigues-Mortes marshes, in a giant Italian version 🇫🇷🇮🇹", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  const Text(
                    "Considered the largest in Europe, the Margherita di Savoia salt pan is a natural wonder stretching 20 km along the Adriatic coast. Covering 4,500 hectares in the heart of Puglia, this protected nature reserve produces approximately 500,000 tons of sea salt annually. It is a spectacular site that attracts travelers, photographers, and birdwatchers from all over the world thanks to its incredible biodiversity.",
                    style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
                    softWrap: true,
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("OVERVIEW 📸"),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildImageItem('assets/images/21.jpg'),
                        _buildImageItem('assets/images/23.jpg'),
                        _buildImageItem('assets/images/26.jpg'),
                        _buildImageItem('assets/images/22.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("A BIT OF HISTORY 📜"),
                  _buildContentBlock("Prehistoric & Ancient Origins", "Since the Bronze Age, salt formed spontaneously in the Salpi Lake lagoon. Stone reservoirs from this era still testify to the drainage of minerals. The Romans were already actively exploiting this precious treasure in their settlement called 'Salinis'."),
                  _buildContentBlock("Transformation of the Site", "Under royal rule, the site was named 'Regie Saline'. In the 18th century, a second opening to the sea was dug to purify the stagnant waters of the Pantano, laying the foundation for modern facilities. In 1879, the town was renamed Margherita di Savoia in honor of the queen."),
                  _buildContentBlock("Ecological Pearl of the South", "Declared a wetland of international importance (Ramsar Convention), the salt pan is now the largest animal reserve in Central-Southern Italy. It hosts between 20,000 and 50,000 migratory birds each year, including the majestic pink flamingos."),

                  const SizedBox(height: 30),
                  _buildSectionTitle("PRACTICAL TIPS 💡"),
                  const SizedBox(height: 15),
                  _buildReservationBanner(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("BOOKING & CONTACTS 📞"),
                  const SizedBox(height: 15),
                  _buildContactTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Text("⚠️ Note: The exact times for your guided tour will be agreed upon during your call.", style: TextStyle(color: Colors.white30, fontSize: 12)),
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
            "Access by official reservation only",
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
        fit: BoxFit.contain,
      ),
    ),
  );

  Widget _buildCalendarSection() => Column(children: [
    _buildCalendarRow("✅ Top", "Spring & Autumn (ideal for birdwatching)"),
    _buildCalendarRow("☀️ Ok", "Summer (salt harvest season, but very hot)"),
    _buildCalendarRow("❌ Avoid", "Winter (less migratory bird activity)"),
  ]);

  Widget _buildCalendarRow(String status, String info) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 70, child: Text(status, style: const TextStyle(color: Colors.white))),
        Expanded(child: Text(info, style: const TextStyle(color: Colors.white70), softWrap: true))
      ],
    ),
  );

  Widget _buildContactTable() => Table(
    columnWidths: const {
      0: FlexColumnWidth(1.1),
      1: FlexColumnWidth(2.9),
    },
    border: TableBorder.all(color: Colors.white24),
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Channel", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Official Info", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ]),
      _buildTableRowData("Website", "www.infosalina.it"),
      _buildTableRowData("Calls", "During office hours only"),
      _buildTableRowData("Visits", "Schedule to be agreed upon by phone"),
    ],
  );

  TableRow _buildTableRowData(String label, String value) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(label, style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.w500))),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
  ]);
}