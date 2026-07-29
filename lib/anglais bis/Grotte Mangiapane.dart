import 'package:flutter/material.dart';

class GrotteMangiapanePage extends StatelessWidget {
  const GrotteMangiapanePage({super.key});

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
                  image: AssetImage('assets/imag/11.webp'),
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
                    "MANGIAPANE CAVE 🛖",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "A hint of Cappadocia in Turkey, Sicilian troglodyte style 🇹🇷🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Located near Custonaci in Sicily, Mangiapane Cave is the largest of the Scurati caves. This timeless spot houses a tiny 19th-century rural village built directly inside a majestic 70-meter-high cavity. Abandoned in the 1950s and later carefully restored, it stands as a testament to traditional Sicilian peasant life. Now transformed into an open-air museum, its stone cottages, stables, and wood-burning ovens immerse you in an authentic atmosphere between sea and mountains.",
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
                        _buildImageItem('assets/imag/12.jpg'),
                        _buildImageItem('assets/imag/14.jpg'),
                        _buildImageItem('assets/imag/15.webp'),
                        _buildImageItem('assets/imag/11.webp'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("MUST-SEES & EVENTS 🏺"),
                  _buildContentBlock(
                      "The Museum Village (Year-Round)",
                      "A self-guided stroll through the restored historic dwellings. You will discover period agricultural tools, a flour mill, a small chapel, and authentic workshops belonging to shoemakers and blacksmiths."
                  ),
                  _buildContentBlock(
                      "The Living Museum (Summer Season)",
                      "During the summer, the village comes back to life as local artisans demonstrate traditional crafts (pottery, weaving, cheese-making) directly inside the cave's stone workshops."
                  ),
                  _buildContentBlock(
                      "The Living Nativity Scene (Christmas Season)",
                      "The famous 'Presepe Vivente'! As Christmas approaches, the cave transforms into a spectacular living nativity scene featuring over 160 costumed participants, illuminated by torchlight in a magical atmosphere."
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
                      "⚠️ Note: Managed by a local cultural association, opening hours can be irregular during the low season. Checking locally or on official pages before visiting is strongly advised.",
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
          "Full Price: ~€8 | Reduced: ~€5 | Living Nativity: Special Event Rates",
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
    _buildCalendarRow("✅ Best", "Christmas (for the Living Nativity Scene) and Summer to watch artisans at work in the Living Museum."),
    _buildCalendarRow("🎒 Info", "The ground consists of natural stone and packed dirt; wear flat, comfortable walking shoes."),
    _buildCalendarRow("❌ Avoid", "Low season (November, February, March) without calling ahead, as the site may be closed."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Hours (General)", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("High Season\n(June - Sept)", "Daily: 10:00 AM - 6:00 PM (Often extended to 7:00 PM in August)"),
      _buildTableRowData("Low Season\n(Spring/Autumn)", "Variable. Generally open weekends: 10:00 AM - 6:00 PM"),
      _buildTableRowData("Christmas\n(Dec - Jan)", "Living Nativity: Open late afternoon / evening (approx. 4:00 PM - 9:00 PM)"),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Tour", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Self-guided tour (approx. 45 min to 1 hour). Informational signs are located throughout the site.", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 12), softWrap: true)),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}