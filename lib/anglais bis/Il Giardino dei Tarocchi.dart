import 'package:flutter/material.dart';

class GiardinoDeiTarocchiPage extends StatelessWidget {
  const GiardinoDeiTarocchiPage({super.key});

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
                  image: AssetImage('assets/ima/22.webp'), // Replace with your main image
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
                    "THE TAROT GARDEN 🃏",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "A feel of Park Güell or a surrealist palace, the magical mosaic version of Tuscany 🇪🇸🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Envisioned by the genius artist Niki de Saint Phalle from 1978 until her death in 2002, The Tarot Garden is an esoteric and fantastical sculpture park located in Capalbio. Inspired by the 22 Major Arcana tarot cards, this monumental masterpiece features concrete giants covered in sparkling mosaics, vibrant ceramics, mirrors, and precious glass. A unique artistic and visual adventure in the world, where dreams and grand ambitions unite under the Tuscan sun.",
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
                        _buildImageItem('assets/ima/22.webp'),
                        _buildImageItem('assets/ima/21.jpg'),
                        _buildImageItem('assets/ima/20.webp'),
                        _buildImageItem('assets/ima/24.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("ON-SITE SERVICES & INFO ✨"),
                  const SizedBox(height: 15),
                  _buildServicesGrid(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("SCULPTURES & SYMBOLS 📜"),
                  _buildContentBlock(
                      "The 22 Major Arcana",
                      "The park is a living transcription of the Tarot game. Each giant sculpture embodies a symbolic figure (The Empress, The Magician, Strength...) which visitors can sometimes enter, take shelter inside, or get lost in through puzzling mirror games."
                  ),
                  _buildContentBlock(
                      "The Art of Mosaics and Mirrors",
                      "Niki de Saint Phalle hand-assembled thousands of precious glass fragments and brightly colored mosaics. The reflective surfaces catch natural light to continuously reshape the surrounding landscape throughout the hours."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("TICKET PRICES 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("OPENING & HOURS ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Note: Prices and hours are subject to change throughout the year. Tickets purchased online are non-exchangeable and non-refundable (even in case of rain, as the park remains open).",
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
        Text("• Standard Fare: €15.00", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold), softWrap: true),
        SizedBox(height: 5),
        Text("• Reduced Fare: €10.00 (Ages 7–22, Seniors 65+, Capalbio residents, Groups of 25+)", style: TextStyle(color: Colors.white70, fontSize: 13), softWrap: true),
        SizedBox(height: 5),
        Text("• School Groups: €8.00 per student (Groups of at least 10 students)", style: TextStyle(color: Colors.white70, fontSize: 13), softWrap: true),
        SizedBox(height: 5),
        Text("• Free: Ages 0 to 6, Visitors with disabilities (over 67%) and their companion.", style: TextStyle(color: Colors.white70, fontSize: 13), softWrap: true),
        SizedBox(height: 8),
        Text("⚠️ Mandatory proof required at the entrance for reduced/free tickets.", style: TextStyle(color: Colors.orangeAccent, fontSize: 12, fontWeight: FontWeight.bold), softWrap: true),
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
        Row(children: [Icon(Icons.schedule, color: Color(0xFFFFD700)), SizedBox(width: 10), Expanded(child: Text("Visit duration: ~1h30m (Self-guided tour)", style: TextStyle(color: Colors.white70), softWrap: true))]),
        SizedBox(height: 8),
        Row(children: [Icon(Icons.local_parking, color: Colors.greenAccent), SizedBox(width: 10), Expanded(child: Text("Free and unmonitored parking lot", style: TextStyle(color: Colors.white70), softWrap: true))]),
        SizedBox(height: 8),
        Row(children: [Icon(Icons.pets, color: Colors.amberAccent), SizedBox(width: 10), Expanded(child: Text("Pets allowed (dogs must be kept on a leash)", style: TextStyle(color: Colors.white70), softWrap: true))]),
        SizedBox(height: 8),
        Row(children: [Icon(Icons.accessible, color: Colors.lightBlueAccent), SizedBox(width: 10), Expanded(child: Text("Partial accessibility", style: TextStyle(color: Colors.white70), softWrap: true))]),
        SizedBox(height: 8),
        Row(children: [Icon(Icons.menu_book, color: Colors.white), SizedBox(width: 10), Expanded(child: Text("On-site Bookstore & Coffee Shop (Caffetteria)", style: TextStyle(color: Colors.white70), softWrap: true))]),
        SizedBox(height: 8),
        Row(children: [Icon(Icons.smoke_free, color: Colors.redAccent), SizedBox(width: 10), Expanded(child: Text("Smoking is strictly prohibited in the park", style: TextStyle(color: Colors.white70), softWrap: true))]),
      ],
    ),
  );

  Widget _buildCalendarSection() => Column(children: [
    const SizedBox(height: 5),
    _buildCalendarRow("✅ Booking", "Online purchase alone guarantees entry to the Garden. The number of daily visitors is strictly limited to protect the artwork."),
    _buildCalendarRow("🎒 Info", "No guided or private tours are provided by the venue. Exploration is free and at your own pace."),
    _buildCalendarRow("❌ Important", "Tickets are only valid for the selected date and time slot. Access may be denied in case of late arrival or incorrect date choice."),
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
      0: FlexColumnWidth(1.2),
      1: FlexColumnWidth(2.8),
    },
    border: TableBorder.all(color: Colors.white24),
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Period / Days", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Opening Hours", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("From April 1st\nto October 15th", "Daily: 2:30 PM - 7:30 PM"),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Admission", style: TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Last entry permitted at 6:15 PM. The garden remains open on public holidays and rainy days.", style: TextStyle(color: Colors.white70, fontSize: 13), softWrap: true)),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}