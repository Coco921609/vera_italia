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
                  image: AssetImage('assets/imag/29.webp'), // Replace with your main image
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
                    "A feel of Napa Valley in California, the Tuscan autumn masterpiece version 🇺🇸🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "A UNESCO World Heritage Site, Val d'Orcia embodies the quintessence of the Tuscan landscape. While the valley is stunning year-round, it becomes truly magical in autumn. Rolling hills shed their spring greens to wrap themselves in an surreal palette of ochre, gold, and crimson tones. Between neatly lined cypress trees, grape-heavy vineyards, and mystical morning mists rising from the valleys, every panorama feels painted by a Renaissance master.",
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
                  _buildSectionTitle("AUTUMN HIGHLIGHTS 🍇"),
                  _buildContentBlock(
                      "Cypress Road & Morning Mists",
                      "The most iconic spot lies near San Quirico d'Orcia. In autumn, the secret is visiting at dawn: a dense, poetic mist wraps around the base of the rolling hills, allowing cypress treetops to emerge under the first low rays of sunlight. A photographer's paradise."
                  ),
                  _buildContentBlock(
                      "The Wine Route (Brunello & Montepulciano)",
                      "Autumn is the grape harvest season and the time for wine cellars to come alive. It is the perfect moment to explore the golden vineyards surrounding the hilltop towns of Montalcino and Montepulciano, tasting world-renowned vintages by the fireside in historic stone estates."
                  ),
                  _buildContentBlock(
                      "Pienza & The Chapel of Vitaleta",
                      "Stroll through the paved alleys of Pienza, the Renaissance 'ideal city', renowned for its Pecorino cheese (which gains rich new flavors this season). Along the way, take a detour to admire the tiny, secluded Chapel of Vitaleta, standing alone amidst bronze-colored fields."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("PRICES & PRACTICAL TIPS 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("ATMOSPHERE & LIGHT ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Note: Val d'Orcia cannot be properly visited by public transport. Renting a car or scooter is essential to venture onto the unpaved dirt roads (strade bianche) that lead to the finest scenic viewpoints.",
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
          "Valley Access: Free | Wine Tastings: ~€20 to €45 | Pienza Parking: ~€2/hr",
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
    _buildCalendarRow("✅ Best", "Late October to mid-November. The peak of warm autumn foliage, olive harvests, and mystical morning ground fog."),
    _buildCalendarRow("🎒 Info", "Bring a warm jacket and windbreaker. While autumn days remain gentle and sunny, mornings and evenings at elevation get chilly."),
    _buildCalendarRow("❌ Avoid", "Mid-summer (July/August) if you dream of textured colors. During this time, the harvested fields lie bare, dry, and sunbaked."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Season", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Light & Landscape Dynamics", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Autumn\n(Photo Ideal)", "Soft lighting all day. Spectacular mists in valley bottoms between 6:45 AM and 8:30 AM. Golden and burnt sienna hues."),
      _buildTableRowData("Spring\n(Alternative)", "Lush green valley bursting with wild flowers. Perfect for dynamic, fresh, and high-contrast scenery under changing skies."),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Wineries", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Winery estates remain open for tours in autumn, typically from 10:00 AM to 6:00 PM. Reservations strongly advised.", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 12), softWrap: true)),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}