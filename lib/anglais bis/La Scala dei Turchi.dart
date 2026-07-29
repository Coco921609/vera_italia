import 'package:flutter/material.dart';

class ScalaDeiTurchiPage extends StatelessWidget {
  const ScalaDeiTurchiPage({super.key});

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
                  image: AssetImage('assets/ima/15.webp'), // Replace with your main image
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
                    "SCALA DEI TURCHI 🌊",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "A feel of the white cliffs of Pamukkale, the limestone majesty version of Sicily 🇹🇷🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Carved by wind and waves into a blindingly pure white marl, Scala dei Turchi (Stair of the Turks) is a monumental cliff shaped like a natural staircase that plunges proudly into the emerald waters of Agrigento's coast in Sicily. This unique natural landmark owes its name to successive waves of Saracen pirates who once found ideal shelter here to dock. It is a grand and surreal landscape where the immaculate white rock stands in magnificent contrast to the deep blue of the Mediterranean Sea.",
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
                        _buildImageItem('assets/ima/15.webp'),
                        _buildImageItem('assets/ima/12.jpg'),
                        _buildImageItem('assets/ima/14.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("LIGHTS & PANORAMAS ✨"),
                  _buildContentBlock(
                      "Stay Until Sunset",
                      "The sunset over Scala dei Turchi is quite spectacular, especially when climbing up the cliff, which offers a beautiful viewpoint facing west. Make sure to be there at least for the end of the day to admire the show. Note that access onto the cliff is restricted after 7:00 PM, but the sunset remains breathtaking from the beach below."
                  ),
                  _buildContentBlock(
                      "The White Marl Steps",
                      "The natural terraced formation of the cliff offers a striking visual experience. Marl, a sedimentary clay-limestone rock, feels cool underfoot, giving the sensation of walking on a warm glacier under the Sicilian sun."
                  ),
                  _buildContentBlock(
                      "Adjacent Fine Sand Beaches",
                      "Stretching out on either side of the white promontory are long strips of golden sand. Perfect for swimming, they allow you to observe the cliff from an exceptional perspective, heightening the color contrast."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("PRICES & ACCESS CONDITIONS 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("ACCESS & DYNAMICS ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Note: Prices and schedule are subject to change throughout the year. Local regulations aimed at protecting the marl rock from erosion are strictly enforced, please stay within designated paths.",
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
      Icon(Icons.credit_card, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Cliff Access Ticket: €6 per person | Payment exclusively by credit card at ticket booth",
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
    _buildCalendarRow("✅ Best", "Late afternoon, to catch the golden glow that washes over the white limestone as the sun sets on the western horizon."),
    _buildCalendarRow("🎒 Info", "The ticket office is located directly at the trailhead leading to the cliff. Cash is not accepted."),
    _buildCalendarRow("❌ Avoid", "Arriving after 7:00 PM if you wish to climb up onto the cliff structure, as access gates close for safety."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Zone", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Opening Hours & Regulations", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Cliff Access", "10:00 AM to 7:00 PM (Last entry allowed onto the limestone structure at 7:00 PM)."),
      _buildTableRowData("Cliff Base", "Open access in the evening to admire the sunset from the lower beach area."),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}