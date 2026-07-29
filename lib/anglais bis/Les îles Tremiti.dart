import 'package:flutter/material.dart';

class IlesTremitiPage extends StatelessWidget {
  const IlesTremitiPage({super.key});

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
                  image: AssetImage('assets/imag/21.webp'), // Replace with your main image
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
                    "TREMITI ISLANDS 🏝️",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "A feel of the Caribbean, the wild Puglia archipelago version 🇩🇴🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Located off the coast of the Gargano Peninsula in the Adriatic Sea, the Tremiti Islands archipelago is a haven of biodiversity and natural beauty. Consisting primarily of the islands of San Domino and San Nicola, this pristine jewel dazzles with crystal-clear turquoise waters, white limestone coves, and fragrant pine forests. It is a timeless destination blending wild, paradisiacal beaches with medieval historical heritage.",
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
                        _buildImageItem('assets/imag/21.webp'),
                        _buildImageItem('assets/imag/22.jpg'),
                        _buildImageItem('assets/imag/23.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("THE ISLANDS & EXPLORATIONS ⚓"),
                  _buildContentBlock(
                      "San Domino (Nature & Relaxation)",
                      "The largest and greenest island, blanketed with Aleppo pine forests. It is home to Cala delle Arene, the archipelago's only fine sand beach, ideal for swimming in crystal-clear waters."
                  ),
                  _buildContentBlock(
                      "San Nicola (History & Culture)",
                      "The historical heart of the Tremiti Islands. Dominated by the imposing, fortified abbey-fortress of Santa Maria a Mare, this rocky island offers a captivating journey into the past alongside dramatic panoramas."
                  ),
                  _buildContentBlock(
                      "Marine Reserve & Boat Caves",
                      "The best way to explore the archipelago is by renting a small boat (gozzo) or taking a guided tour. Do not miss the Swallow Cave (Grotta delle Rondinelle) and the famous submerged statue of Padre Pio."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("PRICES & PRACTICAL TIPS 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("FERRY CONNECTIONS ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Note: Cars owned by non-residents are strictly prohibited on the islands. Exploration is done entirely on foot, by bicycle, or via water taxis between San Domino and San Nicola.",
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
      Icon(Icons.directions_boat, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Round-trip Ferry: ~€35 to €50 (season dependent) | Landing Tax: ~€5 | Island Access: Free",
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
    _buildCalendarRow("✅ Best", "June and September for warm waters, perfect weather, and comfortable crowd levels."),
    _buildCalendarRow("🎒 Info", "Be sure to book your ferry tickets online in advance (departures from Termoli, Vieste, Peschici, or Rodi Garganico)."),
    _buildCalendarRow("❌ Avoid", "August if you want to avoid dense crowds, as well as days with rough sea conditions (risk of ferry cancellations)."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Ferry / Hydrofoil Frequency", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("High Season\n(June - Sept)", "Multiple daily morning departures (starting at 8:00 AM-9:00 AM) from the mainland. Late afternoon returns (5:30 PM-6:30 PM)."),
      _buildTableRowData("Low Season\n(Oct - May)", "Significantly reduced connections, mainly operating from the port of Termoli. Schedules depend on weather conditions."),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Inter-Island", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Water shuttles run continuously between San Domino and San Nicola (a trip of just a few minutes, ~€5).", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 12), softWrap: true)),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}