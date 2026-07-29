import 'package:flutter/material.dart';

class AlberobelloPage extends StatelessWidget {
  const AlberobelloPage({super.key});

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
                  image: AssetImage('assets/ima/33.jpg'), // Replace with your main image
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
                    "ALBEROBELLO 🛖",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "A hint of a Hobbit village or a fantasy oasis, Apulia's vernacular architecture edition 🇳🇿🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "A UNESCO World Heritage site, the historic heart of Alberobello offers a unique architectural spectacle. Famous for its 'Trulli' — small whitewashed limestone houses topped with conical gray roofs made of dry-laid stones —, the town feels like a real-life fairytale. Strolling through its steep alleyways, lined with immaculate facades decorated with hand-painted mystical symbols, is a true plunge into the ingenuity and secret traditions of Southern Italy.",
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
                        _buildImageItem('assets/ima/31.jpg'),
                        _buildImageItem('assets/ima/32.jpg'),
                        _buildImageItem('assets/ima/33.jpg'),
                        _buildImageItem('assets/ima/34.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("HISTORIC DISTRICTS 📜"),
                  _buildContentBlock(
                      "Rione Monti: The Living Heart",
                      "The most famous and visited district in town, spread over a hillside. It features over 1,000 trulli today housing local artisan shops, linen weavers, and panoramic terraces offering views over a sea of conical roofs."
                  ),
                  _buildContentBlock(
                      "Rione Aia Piccola: Preserved Authenticity",
                      "Less crowded and purely residential, this district offers a peaceful immersion into daily local life. The streets are quieter, preserving the town's original atmosphere and allowing visitors to understand the traditional way of life inside these stone structures."
                  ),
                  _buildContentBlock(
                      "Trullo Sovrano and the Church of Saint Anthony",
                      "Alberobello takes trulli architecture to its peak with the Trullo Sovrano, the only two-story building of its kind, and the Church of Saint Anthony of Padua, the only temple in the world replicating the conical shapes of local vernacular architecture."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("PRACTICAL TIPS & HIGHLIGHTS 💡"),
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
                      "⚠️ Note: Alberobello is an extremely popular destination in summer. In peak season, the streets of Rione Monti get crowded as early as 10:00 AM. Plan for an early morning or evening visit.",
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
      Icon(Icons.house_siding, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Access to historic districts: Free & open | Trullo Sovrano admission: Museum ~€2",
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
    _buildCalendarRow("✅ Top", "Sunrise or late afternoon, when the soft light reflects off the limestone and the shadows of the conical roofs stretch across the whitewashed alleys."),
    _buildCalendarRow("🎒 Info", "Look up: the roofs of the trulli often feature symbols of pagan, Christian, or magical origins, painted to protect homes from the evil eye."),
    _buildCalendarRow("❌ Avoid", "The 11:00 AM - 3:00 PM slot in peak August, as heat radiates intensely off the white stone and tourist density reaches its peak."),
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
      _buildTableRowData("Morning", "Serene atmosphere, ideal for photography. Locals quietly start their day before the tourist rush."),
      _buildTableRowData("Night", "The trulli light up under street lamps. The atmosphere becomes magical and almost unreal, perfect for a cool evening stroll."),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}