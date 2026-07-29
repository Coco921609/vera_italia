import 'package:flutter/material.dart';

class SicileVolcaniquePage extends StatelessWidget {
  const SicileVolcaniquePage({super.key});

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
                  image: AssetImage('assets/ima/27.jpeg'), // Replace with your main image
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
                    "VOLCANIC SICILY 🌋",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "A hint of Icelandic or Hawaiian landscapes, the theatrical Mediterranean version 🇮🇸🇺🇸🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "A land forged by fire and mythology, Sicily is one of the most active and captivating volcanic epicenters on the planet. Dominated by the giant Mount Etna, Europe's highest active volcano, and bordered to the north by the Aeolian volcanic archipelago (including the explosive Stromboli and sulfurous Vulcano), the region offers a raw geological spectacle. From black lava flows contrasting with high-altitude snow to regular nocturnal explosions projected against the sea, volcanic Sicily is a visceral adventure into the heart of Earth's forces.",
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
                        _buildImageItem('assets/ima/25.jpeg'),
                        _buildImageItem('assets/ima/26.jpg'),
                        _buildImageItem('assets/ima/27.jpeg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("THE GIANTS OF FIRE 📜"),
                  _buildContentBlock(
                      "Mount Etna: The Lighthouse of the Mediterranean",
                      "Culminating at over 3,300 meters, Mount Etna (Mongibello) constantly reshapes eastern Sicily's topography. Its fertile slopes harbor exceptional vineyards and flourishing citrus groves, while its summit craters offer a lunar landscape of black ash deserts and active fumaroles."
                  ),
                  _buildContentBlock(
                      "Stromboli: The Aeolian Lighthouse",
                      "This island volcano has been in continuous eruption for nearly 2,000 years. Its regular outbursts of incandescent lava fragments, visible at night from the sea along the famous 'Sciara del Fuoco' (Stream of Fire), create a hypnotic spectacle unique in the world."
                  ),
                  _buildContentBlock(
                      "Vulcano: The Origin of the Myth",
                      "It was on this island that the Romans located the forge of Vulcan, the god of fire. Defined by intense sulfur scents, therapeutic mud baths, and ink-black sand beaches, Vulcano offers a total open-air geothermal immersion."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("PRACTICAL TIPS & SAFETY 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("VOLCANO DYNAMICS ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Note: Summit access conditions strictly depend on activity reports issued by the INGV (National Institute of Geophysics and Volcanology). Regulations can change from hour to hour.",
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
      Icon(Icons.warning_amber_rounded, color: Colors.orangeAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Restricted access | Certified volcanological guide required beyond authorized altitudes (~€50 to ~€90 depending on excursion).",
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
    _buildCalendarRow("✅ Best", "Spring and autumn for Mount Etna (avoids scorching heat or winter freezing). For Stromboli, summer nighttime sea excursions are magical."),
    _buildCalendarRow("🎒 Info", "Full hiking gear is required: high-top trekking boots, warm layered clothing, and protective eyewear against windblown ash dust."),
    _buildCalendarRow("❌ Avoid", "Attempting summit crater climbs alone or without checking the current volcanic alert level in advance."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Volcano", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Activity Type & Accessibility", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Mount Etna", "Intermittent effusive and explosive activity. Cable car and 4x4 vehicles operate daytime depending on weather."),
      _buildTableRowData("Stromboli", "Persistent Strombolian activity (explosions every 15-20 min). Observation hikes timed around sunset."),
      _buildTableRowData("Vulcano", "Intense fumarolic activity. Access to the main crater is subject to fluctuations in toxic gas emissions."),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}