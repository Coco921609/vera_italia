import 'package:flutter/material.dart';

class DolomitesPage extends StatelessWidget {
  const DolomitesPage({super.key});

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
                  image: AssetImage('assets/ima/28.jpeg'), // Replace with your main image
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
                    "THE DOLOMITES 🏔️",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "A feel of the National Parks of the American West, the monumental Alpine peaks version 🇺🇸🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Recognized as a UNESCO World Heritage site, the Dolomites rise majestically across northeastern Italy. Characterized by colossal limestone rock walls, jagged spires, and lush valleys dotted with turquoise alpine lakes, these mountains offer a landscape of dramatic verticality. At sunrise and sunset, a unique phenomenon known as 'Enrosadira' sets the rock ablaze, bathing the peaks in spectacular shades ranging from vibrant pink to fiery red.",
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
                        _buildImageItem('assets/ima/28.jpeg'),
                        _buildImageItem('assets/ima/29.jpg'),
                        _buildImageItem('assets/ima/29.webp'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("ICONIC LOCATIONS 📜"),
                  _buildContentBlock(
                      "Tre Cime di Lavaredo",
                      "These three gigantic, aligned rock obelisks are the quintessential symbol of the Dolomites. The surrounding hiking loop offers breathtaking, dizzying views of pure dolomite walls that defy gravity."
                  ),
                  _buildContentBlock(
                      "Lake Braies (Lago di Braies)",
                      "A true gem of the Alps, this high-altitude lake is famous for the pristine reflection of the Croda del Becco rock face in its emerald-green waters. Its traditional wooden rowboats make it one of the most poetic spots in the region."
                  ),
                  _buildContentBlock(
                      "Alpe di Siusi (Seiser Alm)",
                      "The highest alpine meadow in Europe offers a striking contrast: an immense, rolling plateau sitting at 1,800 meters elevation, framed by the massive, steep silhouettes of the Sassolungo and Sciliar peaks."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("PRACTICAL TIPS & LOGISTICS 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("SEASONS & ACCESS ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Note: Toll prices for alpine roads (such as the Tre Cime road) and cable car operational hours are subject to change throughout the year. During shoulder seasons (May and November), most cable cars remain closed.",
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
      Icon(Icons.hiking, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Park Entry: Free | Tre Cime Toll Road: ~€30/car | Cable car passes optional.",
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
    _buildCalendarRow("✅ Best", "Mid-June to September for hiking and blooming alpine meadows. December to March for skiing in the heart of the Dolomiti Superski area."),
    _buildCalendarRow("🎒 Info", "Certain popular lakes and mountain passes (such as Braies) restrict vehicle access in summer. Take local shuttle buses or arrive before 8:00 AM."),
    _buildCalendarRow("❌ Avoid", "May and late autumn (October/November), as weather is highly unpredictable, snow blocks the passes, and mountain huts are closed."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Season", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Dynamics & Visiting Tips", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Summer\n(June - Sept)", "Ideal for high-altitude trekking, via ferratas, and full availability of mountain huts (Rifugi)."),
      _buildTableRowData("Winter\n(Dec - March)", "Complete snowbound transformation. A paradise for downhill skiing, cross-country skiing, and snowshoeing."),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}