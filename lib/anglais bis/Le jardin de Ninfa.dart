import 'package:flutter/material.dart';

class JardinDeNinfaPage extends StatelessWidget {
  const JardinDeNinfaPage({super.key});

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
                  image: AssetImage('assets/ima/7.webp'), // Replace with your main image
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
                    "GARDEN OF NINFA 🌺",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "A feel of a romantic English estate, the medieval oasis version of Lazio 🇬🇧🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Ranked among the most beautiful romantic gardens in the world, the Garden of Ninfa is an Eden suspended in time, located in the province of Latina. Built on the ruins of a thriving ancient medieval city, this unique park sees ivy-covered ruins, crystal-clear streams crossed by stone bridges, and an endless variety of exotic plants and heritage roses coexisting together. It is a living masterpiece where nature and history embrace in poetic harmony.",
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
                        _buildImageItem('assets/ima/7.webp'),
                        _buildImageItem('assets/ima/8.webp'),
                        _buildImageItem('assets/ima/9.webp'),
                        _buildImageItem('assets/ima/10.webp'),
                        _buildImageItem('assets/ima/11.webp'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("WALKS & RUINS ✨"),
                  _buildContentBlock(
                      "Ruins of the Church of Santa Maria Maggiore",
                      "Among the most spectacular remnants, the ancient nave of the main church is now carpeted with climbing flora. The lingering remains of medieval frescoes still whisper the bygone history of the city."
                  ),
                  _buildContentBlock(
                      "The Ninfa River & Its Bridges",
                      "Pure, crystal-clear water flows directly from the surrounding mountains to frame the ruins. The romantic-style bridges offer enchanted viewpoints worthy of an Impressionist painting."
                  ),
                  _buildContentBlock(
                      "Rose Collection & Exotic Flora",
                      "The site's unique microclimate allows magnolias, Japanese maples, and thousands of climbing roses to flourish along the old stone walls, blanketing the garden with subtle fragrances during bloom."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("PRICES & PRACTICAL TIPS 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("OPENING HOURS ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Note: Prices and schedule are subject to change throughout the year. The garden is visited primarily through mandatory online reservation in order to preserve its fragile ecosystem.",
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
      Icon(Icons.local_activity, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Adult Ticket: €20.75 incl. VAT | Under 12 years old: Free",
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
    _buildCalendarRow("✅ Best", "Springtime (April to June) to witness the spectacular blooming of heritage roses and cherry blossoms."),
    _buildCalendarRow("🎒 Info", "Visits are exclusively guided and last around one hour in order to respect the site's tranquility and history."),
    _buildCalendarRow("❌ Avoid", "Arriving without a prior reservation. The number of daily visitors is strictly limited to protect the flora."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Day", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Tour Hours", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Monday - Thursday", "Closed"),
      _buildTableRowData("Friday", "5:15 PM - 7:00 PM"),
      _buildTableRowData("Saturday", "5:15 PM - 7:00 PM"),
      _buildTableRowData("Sunday", "5:15 PM - 7:00 PM"),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}