import 'package:flutter/material.dart';

class GrottesCastellanaPage extends StatelessWidget {
  const GrottesCastellanaPage({super.key});

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
                  image: AssetImage('assets/ima/38.jpg'), // Replace with your main image
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
                    "CASTELLANA CAVES 🕳️",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "A hint of Padirac Chasm or Mines of Moria, Apulia's underground cathedral edition 🇫🇷🇳🇿🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Located on the edge of the Itria Valley, the Castellana Caves form one of Italy's largest and most spectacular speleological complexes. Over 60 meters underground, this cave system reveals a labyrinth of crystalline stalactites, monumental stalagmites, deep canyons, and chasms shaped by water over millions of years. The pinnacle of the exploration is the White Cave (Grotta Bianca), celebrated worldwide by speleologists as the most luminous and pristine underground cavern on Earth.",
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
                        _buildImageItem('assets/ima/36.webp'),
                        _buildImageItem('assets/ima/35.jpg'),
                        _buildImageItem('assets/ima/37.webp'),
                        _buildImageItem('assets/ima/38.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("EXPLORATION ROUTES 📜"),
                  _buildContentBlock(
                      "Full Route: Total Immersion",
                      "An exceptional 3-kilometer (round trip) route taking approximately 100 minutes. It leads you through the complex's most beautiful chambers all the way to the legendary White Cave, an alabaster jewel glowing with unmatched purity."
                  ),
                  _buildContentBlock(
                      "Partial Route: Express Discovery",
                      "Spanning about 1 kilometer for a duration of 50 minutes, this shorter trail allows you to admire the majestic Grave, the first and vast natural cavern of the network, ideal for visitors with limited time."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("ON-SITE SERVICES & INFO ✨"),
                  const SizedBox(height: 15),
                  _buildServicesGrid(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("TICKET PRICES (AT TICKET OFFICE) 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("TOUR ORGANIZATION ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Note: The temperature inside the caves remains constant year-round at approximately 16.5°C (61.7°F) with high humidity. Bring a sweater or light jacket as well as closed non-slip shoes. Prices are subject to change throughout the year.",
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
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("• Full fare (Ages 15+):", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold), softWrap: true),
        Text("  - Full Tour: €25 | Partial Tour: €22", style: TextStyle(color: Colors.white70, fontSize: 13), softWrap: true),
        SizedBox(height: 5),
        Text("• Reduced fare (Ages 6 to 14):", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold), softWrap: true),
        Text("  - Full Tour: €22 | Partial Tour: €19", style: TextStyle(color: Colors.white70, fontSize: 13), softWrap: true),
        SizedBox(height: 5),
        Text("• Free: Children up to 5 years old included.", style: TextStyle(color: Colors.white70, fontSize: 13), softWrap: true),
        SizedBox(height: 8),
        Text("💎 Online Exclusive: Family Ticket at €61", style: TextStyle(color: Color(0xFFFFD700), fontSize: 14, fontWeight: FontWeight.bold), softWrap: true),
        Text("Valid for 2 adults + 2 children (ages 6-14). Booking fees included. Not available at on-site ticket counters.", style: TextStyle(color: Colors.white60, fontSize: 12), softWrap: true),
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

  Widget _buildServicesGrid() => Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(12)),
    child: const Column(
      children: [
        Row(children: [Icon(Icons.child_friendly, color: Colors.greenAccent), SizedBox(width: 10), Expanded(child: Text("Free baby carrier rental (strollers strictly prohibited)", style: TextStyle(color: Colors.white70), softWrap: true))]),
        SizedBox(height: 8),
        Row(children: [Icon(Icons.local_parking, color: Colors.lightBlueAccent), SizedBox(width: 10), Expanded(child: Text("Paid P1 parking lot located right next to the entrance area", style: TextStyle(color: Colors.white70), softWrap: true))]),
        SizedBox(height: 8),
        Row(children: [Icon(Icons.wc, color: Colors.amberAccent), SizedBox(width: 10), Expanded(child: Text("Paid restrooms near the ticket office (continuously cleaned)", style: TextStyle(color: Colors.white70), softWrap: true))]),
      ],
    ),
  );

  Widget _buildCalendarSection() => Column(children: [
    const SizedBox(height: 5),
    _buildCalendarRow("✅ Booking", "It is strongly advised to buy your tickets online at least the day before your visit to secure your time slot and skip ticket lines."),
    _buildCalendarRow("🎒 Entry", "The digital ticket received via email allows you to head straight to the turnstiles. Please arrive at least 15 minutes before tour start."),
    _buildCalendarRow("❌ Counter", "On-site ticket sales on the day of the visit strictly depend on remaining availability. Same-day counter purchase for future dates is not available."),
  ]);

  Widget _buildCalendarRow(String status, String info) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 85, child: Text(status, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Expanded(child: Text(info, style: const TextStyle(color: Colors.white70, height: 1.3), softWrap: true))
      ],
    ),
  );

  Widget _buildHoursTable() => Table(
    columnWidths: const {
      0: FlexColumnWidth(1.4),
      1: FlexColumnWidth(2.6),
    },
    border: TableBorder.all(color: Colors.white24),
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Route Type", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Distance, Duration & Details", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Full Tour 🚶", "3 kilometers | ~100 minutes\nExplores the entire underground network leading all the way to the breathtaking White Cave."),
      _buildTableRowData("Partial Tour 🧭", "1 kilometer | ~50 minutes\nFocuses on the initial galleries and the massive opening cavern (The Grave)."),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}