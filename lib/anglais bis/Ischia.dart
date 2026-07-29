import 'package:flutter/material.dart';

class IschiaPage extends StatelessWidget {
  const IschiaPage({super.key});

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
                  image: AssetImage('assets/ima/39.webp'), // Replace with your main image
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
                    "ISCHIA 🏝️",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "A feel of a tropical riviera or thermal paradise, the authentic volcanic version of Campania 🏝️🌋🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Nicknamed 'The Green Island' due to its lush vegetation, Ischia is the largest island in the Bay of Naples. Unlike its neighbor Capri, this jewel of volcanic origin shines through its preserved authenticity and natural thermal springs renowned since Roman times. From lush tropical gardens to colorful fishing villages, fine sandy beaches, and its imposing medieval castle perched on a volcanic rock islet, Ischia is a sanctuary of well-being where nature displays a raw, healing energy.",
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
                        _buildImageItem('assets/ima/43.webp'),
                        _buildImageItem('assets/ima/42.jpg'),
                        _buildImageItem('assets/ima/39.webp'),
                        _buildImageItem('assets/ima/45.jpg'),
                        _buildImageItem('assets/ima/40.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("TREASURES OF THE GREEN ISLAND 📜"),
                  _buildContentBlock(
                      "Aragonese Castle (Castello Aragonese)",
                      "A true fortified symbol of Ischia, this spectacular medieval citadel sits atop a volcanic rock islet, connected to the main island by a stone bridge. Its ramparts shelter ancient churches and terraced gardens while offering breathtaking, panoramic views across the entire bay."
                  ),
                  _buildContentBlock(
                      "Thermal Parks & Sorgeto Bay",
                      "Underground volcanic activity feeds incredible thermal parks featuring pools of varying temperatures nestled in tropical gardens. At Sorgeto, boiling spring waters surge directly into the sea waves, creating natural hot rock pools free to access right in the ocean."
                  ),
                  _buildContentBlock(
                      "Sant'Angelo: The Fishermen's Haven",
                      "This picturesque, fully pedestrianized fishing village is linked to the rest of the island by a narrow sandy strip. With pastel-colored houses set against a massive rock promontory, quiet alleyways, and seaside cafes, it embodies absolute Mediterranean charm."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("PRACTICAL TIPS & SENSATIONS 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("LOGISTICS & SEA ACCESS ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Note: Vehicle traffic for non-residents is strictly prohibited on the island for a large part of the year (spring-summer). Rely on the excellent local bus network or rent a scooter on site.",
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
          "Ferry/Hydrofoil access: ~€12 to ~€25 one-way from Naples or Pozzuoli | Aragonese Castle Entry: ~€12",
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
    _buildCalendarRow("✅ Best", "Spring (April–June) and early autumn (September–October). The island is lush, blooming, and the thermal parks can be enjoyed comfortably away from summer crowds."),
    _buildCalendarRow("🎒 Info", "For a magical free thermal experience, walk down the stairs to Sorgeto Cove at night: you can bathe in hot thermal waters directly under the stars."),
    _buildCalendarRow("❌ Avoid", "July and August if you prefer to avoid heavy crowds. Beaches and local bus networks become overcrowded with summer vacationers."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Transport", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Frequency, Duration & Departure Ports", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Traghetto\n(Ferry)", "More budget-friendly and slower (~90 min). Allows vehicles with local permits. Departures from Naples (Calata Porta di Massa) or Pozzuoli."),
      _buildTableRowData("Aliscafo\n(Hydrofoil)", "Fast (~50 min) and reserved for foot passengers only. Ideal for day trips. Departures from Naples (Molo Beverello port)."),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}