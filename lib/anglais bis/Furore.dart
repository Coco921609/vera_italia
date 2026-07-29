import 'package:flutter/material.dart';

class FurorePage extends StatelessWidget {
  const FurorePage({super.key});

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
                  image: AssetImage('assets/imag/20.jpg'), // Replace with your main image
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
                    "FURORE FIORD 🌊",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "A hint of Mostar in Bosnia, set within an Italian fjord on the Amalfi Coast 🇧🇦🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Furore is a hidden gem of the Amalfi Coast, famous for its spectacular fjord carved into the rock. Spanned by a monumental 30-meter-high arched bridge, this inlet shelters a tiny secret beach and old fishermen's houses. It is a striking postcard setting reminiscent of Mostar's rocky gorge, blending the immensity of the cliff with the gentleness of the Mediterranean Sea.",
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
                        _buildImageItem('assets/imag/15.webp'),
                        _buildImageItem('assets/imag/17.jpg'),
                        _buildImageItem('assets/imag/20.jpg'),
                        _buildImageItem('assets/imag/19.webp'),
                        _buildImageItem('assets/imag/18.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("MUST-SEES & EXPERIENCES 🏊‍♂️"),
                  _buildContentBlock(
                      "Fjord Beach (Swimming Allowed)",
                      "Swimming is completely allowed and free in the fjord! The water is exceptionally clear and protected from the wind by towering cliffs. Access is on foot via a stone staircase leading down from the main bridge."
                  ),
                  _buildContentBlock(
                      "The Arched Bridge & Cliff Diving",
                      "The road bridge overlooking the fjord offers a dizzying panorama. This is where the annual international high diving championship takes place, with athletes plunging from heights of over 28 meters."
                  ),
                  _buildContentBlock(
                      "The Painted Village 'Il Paese Dipinto'",
                      "Furore is also known as the 'village that doesn't exist' because its houses are scattered across the cliffside. Following the trails upward reveals beautiful murals painted directly onto the building facades."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("PRICES & PRACTICAL TIPS 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("ACCESS & OPENING HOURS ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Note: The beach is very narrow and shade falls quickly in the afternoon due to the high cliffs. There is no parking in the immediate vicinity; taking a bus or scooter is highly recommended.",
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
      Icon(Icons.euro_symbol, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Beach Access: Free | Swimming: Open & Allowed | Sunbeds: None (Wild Beach)",
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
    _buildCalendarRow("✅ Top", "Arrive early in the morning (between 9 AM and 12 PM) to secure a spot on the pebbles and catch direct sunlight."),
    _buildCalendarRow("🎒 Info", "Bring water shoes as the beach consists of pebbles and entry into the sea can be slippery."),
    _buildCalendarRow("❌ Avoid", "Arriving by car. Parking on the bridge is strictly impossible. Take the SITA bus (Furore Fiordo stop)."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Period", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Accessibility / Hours", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("May - October\n(Ideal Season)", "Free access 24/7. Perfect for swimming. Staircase open."),
      _buildTableRowData("November - April\n(Low Season)", "Free access, but sea temperatures are cold. Watch for stormy days (staircase access occasionally closed for safety)."),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Safety", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Unsupervised beach. Always check sea conditions before swimming or venturing far from shore.", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 12), softWrap: true)),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}