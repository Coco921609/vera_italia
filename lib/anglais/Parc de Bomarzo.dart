import 'package:flutter/material.dart';

class ParcBomarzoPage extends StatelessWidget {
  const ParcBomarzoPage({super.key});

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
                  image: AssetImage('assets/images/7.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("BOMARZO PARK 👹", style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2)),
                  const SizedBox(height: 10),
                  const Text("A touch of Heligan and the Kuks estate 🇬🇧🇨🇿", style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  const Text(
                    "The Sacred Wood, nicknamed the 'Park of the Monsters', is the oldest sculpture garden in the world. Conceived as early as 1552 by Prince Vicino Orsini, this site breaks away from the classic codes of Italian gardens. Orsini carved dreamlike and grotesque creatures from the rocks on-site, creating a mysterious labyrinth blending art, magic, and literature that has fascinated visitors for centuries.",
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
                      children: [
                        _buildImageItem('assets/images/8.jpg'),
                        _buildImageItem('assets/images/10.jpg'),
                        _buildImageItem('assets/images/11.jpg'),
                        _buildImageItem('assets/images/12.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("PRICES 🎟️"),
                  const SizedBox(height: 15),
                  _buildPriceBlock("Adults (> 13 years old)", "16.00 €"),
                  _buildPriceBlock("Children (4 to 13 years old)", "10.00 €"),
                  _buildPriceBlock("Infants (< 4 years old)", "Free!"),

                  const SizedBox(height: 30),
                  _buildSectionTitle("PRACTICAL TIPS 💡"),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("OPENING HOURS ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text("⚠️ Note: prices and hours may change throughout the year.", style: TextStyle(color: Colors.white30, fontSize: 12)),
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

  Widget _buildPriceBlock(String label, String price) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(label, style: const TextStyle(color: Colors.white70), softWrap: true)),
        const SizedBox(width: 10),
        Text(price, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ],
    ),
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
    _buildCalendarRow("✅ Best", "Spring & Autumn (ideal light)"),
    _buildCalendarRow("❌ Avoid", "Summer (heat) & busy weekends"),
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
      1: FlexColumnWidth(1.4),
      2: FlexColumnWidth(1.5)
    },
    border: TableBorder.all(color: Colors.white24),
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(8.0), child: Text("Period", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(8.0), child: Text("Hours", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(8.0), child: Text("Last adm.", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ]),
      _buildTableRowData("Nov - Feb", "09:00-17:00", "16:00"),
      _buildTableRowData("Mar - Sep", "09:00-19:00", "18:00"),
      _buildTableRowData("October", "09:00-17/18h", "1h before"),
      TableRow(children: [
        const Padding(padding: EdgeInsets.all(8.0), child: Text("Crowd", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold))),
        const Padding(padding: EdgeInsets.all(8.0), child: Text("Prefer 09:00 or end of day", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 11))),
        const Padding(padding: EdgeInsets.all(8.0), child: Text("Especially Summer", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 11))),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h, String da) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(8.0), child: Text(p, style: const TextStyle(color: Colors.white70))),
    Padding(padding: const EdgeInsets.all(8.0), child: Text(h, style: const TextStyle(color: Colors.white70))),
    Padding(padding: const EdgeInsets.all(8.0), child: Text(da, style: const TextStyle(color: Colors.white70))),
  ]);
}