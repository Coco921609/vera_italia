import 'package:flutter/material.dart';

class CivitaDiBagnoregioPage extends StatelessWidget {
  const CivitaDiBagnoregioPage({super.key});

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
                  image: AssetImage('assets/ima/1.jpg'), // Replace with your main image
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
                    "CIVITA DI BAGNOREGIO 🏰",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "A hint of Grand Canyon or Meteora, Lazio's suspended medieval citadel edition 🇺🇸🇬🇷🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Nicknamed 'the dying city' (la città che muore) due to the progressive erosion of the tufa cliff on which it rests, Civita di Bagnoregio is a masterpiece of the medieval and Etruscan eras. Located in Lazio, this spectacular village is accessible only by a single, dizzying pedestrian footbridge suspended high above a vast valley of rocky ravines. When the fog settles in, the stone islet seems to float magically above the clouds.",
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
                      shrinkWrap: true,
                      children: [
                        _buildImageItem('assets/ima/1.jpg'),
                        _buildImageItem('assets/ima/2.jpg'),
                        _buildImageItem('assets/ima/4.webp'),
                        _buildImageItem('assets/ima/3.jpg'),
                        _buildImageItem('assets/ima/5.webp'),
                        _buildImageItem('assets/ima/6.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("HISTORICAL EXPLORATIONS 📜"),
                  _buildContentBlock(
                      "The Pedestrian Bridge & Panorama",
                      "The journey begins by crossing the 300-meter-long footbridge on foot. It is an unforgettable experience where you become fully aware of the village's complete isolation and the site's geological fragility."
                  ),
                  _buildContentBlock(
                      "Santa Maria Gate & The Alleys",
                      "Enter the village through this monumental gateway carved directly into the rock by the Etruscans. Behind it lies a maze of flower-lined alleys, stone houses dating back to the Middle Ages, and well-preserved inner courtyards."
                  ),
                  _buildContentBlock(
                      "The Badlands Valley Viewpoint",
                      "At the end of the village, hanging gardens and panoramic viewpoints offer breathtaking views over the lunar and dramatic landscape of clay badlands (i calanchi) surrounding the hill."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("PRACTICAL TIPS & BUDGET 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("VISITOR FLOW & HOURS ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Note: The village has fewer than a dozen permanent residents. Most small shops and restaurants close or significantly reduce their hours during the winter season.",
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
      Icon(Icons.euro, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Entrance Ticket: ~€5 (conservation support) | Viewpoint Parking: ~€2/h",
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
    _buildCalendarRow("✅ Top", "Spring and autumn. Temperatures are ideal for climbing the bridge, and morning mists in October provide a magical atmosphere."),
    _buildCalendarRow("🎒 Info", "The final ascent on the footbridge is quite steep. Wear good walking shoes and travel light without bulky luggage."),
    _buildCalendarRow("❌ Avoid", "Peak weekends in summer, as the narrow footbridge quickly becomes congested under the stifling midday heat."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Time Frame", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Visiting Advice & Crowds", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Morning\n(08:00 - 10:00)", "The best time to avoid day-trip tour crowds. Crisp morning light ideal for photographing the outer silhouette."),
      _buildTableRowData("Late Afternoon\n(After 17:00)", "The village regains its authentic tranquility. Sunsets set the tufa cliffs ablaze in a peaceful atmosphere."),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Access", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("The ticket office is open daily from 08:00 to 20:00. Outside these hours, bridge access remains freely open.", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 12), softWrap: true)),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}