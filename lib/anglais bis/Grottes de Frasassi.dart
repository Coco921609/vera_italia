import 'package:flutter/material.dart';

class GrottesDeFrasassiPage extends StatelessWidget {
  const GrottesDeFrasassiPage({super.key});

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
                  image: AssetImage('assets/imag/9.jpg'),
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
                    "FRASASSI CAVES 🦇",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "A hint of the massive Carlsbad Caverns in the United States 🇺🇸🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Located in the heart of the Apennines in the Marche region, the Frasassi Caves offer one of the most breathtaking subterranean spectacles on Earth. Frozen in time, this underground realm reveals a majestic dance of stalactites, giant stalagmites, and crystal cascades. Along this surreal trail, you will step into an ecosystem preserved for millions of years. It is a true natural masterpiece where water continues, drop by drop, to shape incredible architecture in absolute silence.",
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
                        _buildImageItem('assets/imag/5.jpg'),
                        _buildImageItem('assets/imag/6.jpg'),
                        _buildImageItem('assets/imag/8.jpg'),
                        _buildImageItem('assets/imag/10.jpg'),
                        _buildImageItem('assets/imag/9.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("TOURS & SPELEOLOGICAL ROUTES 🪖"),
                  _buildContentBlock(
                      "Classic Tour",
                      "A trail suitable for all visitors to admire the grand chambers and impressive rock formations. Online booking is strongly recommended to avoid waiting at the San Vittore parking area."
                  ),
                  _buildContentBlock(
                      "Blue Route (Duration: ~2h | €40)",
                      "An introductory speleological experience. The ticket includes guided exploration with specialized experts and all required safety equipment. Advance booking by phone or email is required."
                  ),
                  _buildContentBlock(
                      "Red Route (Duration: ~3h | €50)",
                      "Designed for adventurous visitors, this longer, technical route ventures into the deeper, hidden caverns. Equipment and specialized guides are included."
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
                      "⚠️ Note: Please arrive at San Vittore parking 15 min before your scheduled ticket time (30 min if picking up free tickets). Shuttle bus included. Times and prices are subject to change. Closed Dec 4, Dec 25, and Jan 7 to Jan 30.",
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
          "Adults: €20 | Reduced: €18 | Youth (6-14): €14 | Free: Under 6 & PRM",
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
    _buildCalendarRow("✅ Best", "Buy online at tickets.frasassi.com to skip ticket line queues. Digital e-tickets are accepted on mobile."),
    _buildCalendarRow("🎒 Info", "Shuttle service from the San Vittore delle Chiuse parking lot is complimentary and included with entry."),
    _buildCalendarRow("❌ Avoid", "Arriving without a reservation during peak summer months (June to September), which risks extended waiting times."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Time Slots (General)", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Winter\n(Nov - Feb)", "Weekdays: 11:30 AM, 3:30 PM\nWeekends/Holidays: 10:00 AM, 11:00 AM, 12:00 PM, 2:30 PM, 4:00 PM, 5:00 PM"),
      _buildTableRowData("Spring /\nAutumn", "Daily: 10:00 AM, 11:00 AM, 12:00 PM, 2:30 PM, 4:00 PM, 5:00 PM"),
      _buildTableRowData("Summer\n(Jun 7 - Sep 14)", "Staggered entries every 10/20/30 min according to crowd density. (Ticket office 9:30 AM - 5:00 PM)"),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("English", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("English guided tours depart daily at 11:40 AM, 1:40 PM, and 3:40 PM", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 12), softWrap: true)),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}