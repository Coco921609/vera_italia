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
                    "A feel of a Scottish citadel or Minas Tirith, the Abruzzo sentinel version 🏴󠁧󠁢󠁳󠁣󠁴󠁿🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Perched at 1,460 meters above sea level in the heart of Gran Sasso National Park, Rocca Calascio is one of the highest and most spectacular fortresses in Europe. A true icon of medieval Italy, this limestone eagle's nest overlooks a wild, lunar mountain landscape that stretches as far as the eye can see. Perfectly integrated into the rock face, this military sentinel appears to float above the void, offering a striking plunge into the history of Italy's vast open spaces.",
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
                        _buildImageItem('assets/ima/18.webp'),
                        _buildImageItem('assets/ima/16.jpg'),
                        _buildImageItem('assets/ima/17.jpg'),
                        _buildImageItem('assets/ima/19.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("HISTORICAL EPIC 📜"),
                  _buildContentBlock(
                      "From Medieval Origins to Frederick II",
                      "Documented as early as the 1240s during the reign of Frederick II, the site initially served as a strategic watchtower to oversee seasonal transhumance livestock routes. Excavations reveal that wool trading and sheep farming maintained a stable, prosperous settlement even at this high altitude."
                  ),
                  _buildContentBlock(
                      "The Golden Age: From the Piccolomini to the Medici",
                      "Between the 15th and 16th centuries, the fortress expanded into its current colossal structure. The powerful Sienese Piccolomini family added an outer curtain wall flanked by four massive circular corner towers around the original central keep. In 1579, the Medici family of Tuscany acquired the estate, launching an era of great economic prosperity tied to the wool trade."
                  ),
                  _buildContentBlock(
                      "From Decline to Cinematic Renaissance",
                      "A chronic lack of water (residents relied exclusively on underground cisterns) and the decline of traditional pastoral life led to a slow abandonment during the 19th century. Left in ruins, the fortress was rediscovered in the 1980s. Its surreal, dramatic beauty has since made it an iconic filming location for international cinema classics (such as Ladyhawke and The Name of the Rose)."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("PRACTICAL TIPS & EXPERIENCE 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("VISIT RECOMMENDATIONS ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Warning: Due to the high altitude (1,460 m), weather conditions can change drastically and rapidly. Always pack a windbreaker, even in the middle of summer.",
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
          "Access to Outer Ruins: Free & Open | Shuttle Bus (Village to Citadel in peak season): ~€2",
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
    _buildCalendarRow("✅ Best", "Sunset. The golden, low-angled light across the surrounding mountains and castle limestone creates an enchanting panorama."),
    _buildCalendarRow("🎒 Info", "Final access is on foot along a walking trail from the village of Calascio. Sturdy sneakers or hiking shoes are recommended."),
    _buildCalendarRow("❌ Avoid", "Stormy or thick foggy days in winter, as the climb can become treacherous and visibility over the valley drops to zero."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Time", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Atmosphere & Visibility", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Daytime", "Ideal for examining the detailed military architecture, the adjacent Church of Santa Maria della Pietà, and the raw scale of the national park."),
      _buildTableRowData("Dusk", "A magical moment when stillness settles over Abruzzo and the castle turns golden, taking on a mystical feel at twilight."),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}