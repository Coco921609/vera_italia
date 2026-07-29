import 'package:flutter/material.dart';

class LuganoPage extends StatelessWidget {
  const LuganoPage({super.key});

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
                  image: AssetImage('assets/imag/1.jpg'), // Keep your image assets intact
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
                    "LUGANO 🏔️",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Swiss elegance with purely Mediterranean charm 🇨🇭🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Located in the Italian-speaking canton of Ticino in Switzerland, Lugano is a gem nestled between mountains and the glacial waters of its lake. With palm trees, colorful arcaded piazzas, and spectacular panoramas, the city offers a seamless blend of Swiss precision and Italian dolce vita. From ascending Monte San Salvatore to peaceful strolls through Parco Ciani, Lugano is a true invitation to contemplation.",
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
                        _buildImageItem('assets/imag/1.jpg'),
                        _buildImageItem('assets/imag/2.jpg'),
                        _buildImageItem('assets/imag/3.jpg'),
                        _buildImageItem('assets/imag/4.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("MUST-SEE SPOTS & WALKS 📜"),
                  _buildContentBlock(
                      "Monte San Salvatore",
                      "Accessible by funicular from Paradiso, it offers a breathtaking 360° view of Lake Lugano, the Alps, and even northern Italy. A classic hiking trail leads down to the picturesque village of Morcote."
                  ),
                  _buildContentBlock(
                      "Parco Ciani & The Lakefront",
                      "The green heart of the city. Featuring ancient trees, statues, and its famous wrought-iron gate opening directly onto the lake waters, it is the ideal spot for a sunset walk."
                  ),
                  _buildContentBlock(
                      "Gandria Olive Trail (Sentiero di Gandria)",
                      "A beautiful pedestrian trail (approx. 3 km) running along the lake from Castagnola to Gandria, an ancient fishing village with narrow, steep alleys that feels frozen in time."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("PRACTICAL TIPS 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("CROWDS & ACCESS ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Note: The city can be visited year-round, but funiculars (San Salvatore, Brè) experience partial winter closures.",
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
      Icon(Icons.account_balance_wallet, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "City/Lake: Free | Funiculars & Museums: Paid (Swiss Francs CHF)",
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
    _buildCalendarRow("✅ Best", "Spring & Summer (blooming flowers at Parco Ciani, swimming, pure dolce vita)"),
    _buildCalendarRow("🍂 Ok", "Autumn (stunning fall colors but shorter daylight hours)"),
    _buildCalendarRow("❌ Avoid", "Winter (many attractions closed, lake fog)"),
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
      1: FlexColumnWidth(1.3),
      2: FlexColumnWidth(2.0),
    },
    border: TableBorder.all(color: Colors.white24),
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Seasons", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Funiculars", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Tips", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Spring", "9:00 AM - 6:00 PM", "Ideal for hiking"),
      _buildTableRowData("Summer", "9:00 AM - 11:00 PM", "Arrive early, very popular"),
      _buildTableRowData("Autumn", "9:00 AM - 5:00 PM", "Beautiful light at the peak"),
      _buildTableRowData("Winter", "Often closed", "Focus on the lower city"),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Crowds", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("High in summer", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 11), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Book boat tours in advance", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 11), softWrap: true)),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h, String da) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(da, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}