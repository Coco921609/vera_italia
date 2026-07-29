import 'package:flutter/material.dart';

class ChutesDeSanFelePage extends StatelessWidget {
  const ChutesDeSanFelePage({super.key});

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
                  image: AssetImage('assets/images/16.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("SAN FELE WATERFALLS 🌊", style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2)),
                  const SizedBox(height: 10),
                  const Text("A taste of Croatia's Plitvice Lakes, in a wild Italian version 🇭🇷🇮🇹", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  const Text(
                    "Located in the heart of the Lucanian Apennines in Basilicata, the San Fele waterfalls offer a spectacle worthy of a fairy tale. Formed by the unique leaps of the Bradano stream in the Vitalba valley, they reveal themselves amidst lush, preserved nature. This wild sanctuary, blending forgotten old mills and absolute forest calm, invites exploration through its historic hiking trails and roaring torrents.",
                    style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
                    softWrap: true,
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("PREVIEW 📸"),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildImageItem('assets/images/20.jpeg'),
                        _buildImageItem('assets/images/17.jpg'),
                        _buildImageItem('assets/images/18.jpg'),
                        _buildImageItem('assets/images/19.jpg'),
                        _buildImageItem('assets/images/15.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("ITINERARIES & HIKING 📜"),
                  _buildContentBlock("The Green Route - U Urtone (2 km)", "A route of about one hour starting from the village. It leads to the U Urtone waterfall, 22 meters high. The trail follows the Bradano stream, passing by 1950s hydraulic structures and the ruins of a historic mill."),
                  _buildContentBlock("The Paradise & The Twins", "The Paradise trail is very short (10 min), bathed in absolute silence. The Twins (300 m) reveals two waterfalls born from the magical meeting of the Bradano and Acquafredda streams."),
                  _buildContentBlock("The Bridge Trail (4.5 km)", "The longest and wildest of the itineraries (about 4 hours of walking). It leads into totally preserved nature and crosses a magnificent historic bridge built in the 1920s."),

                  const SizedBox(height: 30),
                  _buildSectionTitle("PRACTICAL TIPS 💡"),
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
                    child: Text("⚠️ Note: Access is free, but please follow recommended periods.", style: TextStyle(color: Colors.white30, fontSize: 12)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) => Text(title, style: const TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, fontSize: 18));

  Widget _buildContentBlock(String title, String body) => Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
      const SizedBox(height: 5),
      Text(body, style: const TextStyle(color: Colors.white60, height: 1.5), softWrap: true),
    ]),
  );

  Widget _buildPriceSection() => Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(12)),
    child: const Row(children: [Icon(Icons.euro_symbol, color: Colors.greenAccent), SizedBox(width: 10), Expanded(child: Text("Site Access: Free", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)))]),
  );

  Widget _buildImageItem(String path) => Padding(
    padding: const EdgeInsets.only(right: 15),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        path,
        fit: BoxFit.contain,
      ),
    ),
  );

  Widget _buildCalendarSection() => Column(children: [
    _buildCalendarRow("✅ Best", "Autumn (stunning tree colors with waterfall views at sunrise or sunset) & Spring"),
    _buildCalendarRow("☀️ Okay", "Summer (come early to avoid the heat)"),
    _buildCalendarRow("❌ Avoid", "Winter"),
  ]);

  Widget _buildCalendarRow(String status, String info) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 70, child: Text(status, style: const TextStyle(color: Colors.white))),
        Expanded(child: Text(info, style: const TextStyle(color: Colors.white70), softWrap: true))
      ],
    ),
  );

  Widget _buildHoursTable() => Table(
    columnWidths: const {
      0: FlexColumnWidth(1.1),
      1: FlexColumnWidth(1.2),
      2: FlexColumnWidth(1.7),
    },
    border: TableBorder.all(color: Colors.white24),
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(8.0), child: Text("Seasons", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(8.0), child: Text("Hours", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(8.0), child: Text("Tips", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ]),
      _buildTableRowData("Spring", "Anytime", "Recommended"),
      _buildTableRowData("Summer", "Anytime", "Come early"),
      _buildTableRowData("Autumn", "Anytime", "Sunrise/Sunset"),
      _buildTableRowData("Winter", "Anytime", "Avoid"),
      TableRow(children: [
        const Padding(padding: EdgeInsets.all(8.0), child: Text("Crowds", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold))),
        const Padding(padding: EdgeInsets.all(8.0), child: Text("Morning/Evening", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 11))),
        const Padding(padding: EdgeInsets.all(8.0), child: Text("Especially in summer", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 11))),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h, String da) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(8.0), child: Text(p, style: const TextStyle(color: Colors.white70))),
    Padding(padding: const EdgeInsets.all(8.0), child: Text(h, style: const TextStyle(color: Colors.white70))),
    Padding(padding: const EdgeInsets.all(8.0), child: Text(da, style: const TextStyle(color: Colors.white70))),
  ]);
}