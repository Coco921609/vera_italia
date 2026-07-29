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
                  const Text("PARCO DI BOMARZO 👹", style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2)),
                  const SizedBox(height: 10),
                  const Text("Un tocco di Heligan e la tenuta di Kuks 🇬🇧🇨🇿", style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  const Text(
                    "Il Bosco Sacro, soprannominato il 'Parco dei Mostri', è il giardino scultoreo più antico del mondo. Concepito fin dal 1552 dal Principe Vicino Orsini, questo sito rompe i canoni classici dei giardini italiani. Orsini scolpì creature grottesche e oniriche direttamente dalle rocce del luogo, creando un misterioso labirinto che fonde arte, magia e letteratura, affascinando i visitatori da secoli.",
                    style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
                    softWrap: true,
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("PANORAMICA 📸"),
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
                  _buildSectionTitle("PREZZI 🎟️"),
                  const SizedBox(height: 15),
                  _buildPriceBlock("Adulti (> 13 anni)", "16.00 €"),
                  _buildPriceBlock("Ragazzi (dai 4 ai 13 anni)", "10.00 €"),
                  _buildPriceBlock("Bambini (< 4 anni)", "Gratis!"),

                  const SizedBox(height: 30),
                  _buildSectionTitle("CONSIGLI PRATICI 💡"),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("ORARI DI APERTURA ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text("⚠️ Nota: prezzi e orari possono subire variazioni durante l'anno.", style: TextStyle(color: Colors.white30, fontSize: 12)),
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
    _buildCalendarRow("✅ Ottimo", "Primavera e Autunno (luce ideale)"),
    _buildCalendarRow("❌ Evitare", "Estate (caldo) e weekend affollati"),
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
        Padding(padding: EdgeInsets.all(8.0), child: Text("Periodo", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(8.0), child: Text("Orari", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(8.0), child: Text("Ultimo ingr.", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ]),
      _buildTableRowData("Nov - Feb", "09:00-17:00", "16:00"),
      _buildTableRowData("Mar - Set", "09:00-19:00", "18:00"),
      _buildTableRowData("Ottobre", "09:00-17/18h", "1h prima"),
      TableRow(children: [
        const Padding(padding: EdgeInsets.all(8.0), child: Text("Affollamento", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold))),
        const Padding(padding: EdgeInsets.all(8.0), child: Text("Preferire 09:00 o tardi", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 11))),
        const Padding(padding: EdgeInsets.all(8.0), child: Text("Specialmente in estate", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 11))),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h, String da) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(8.0), child: Text(p, style: const TextStyle(color: Colors.white70))),
    Padding(padding: const EdgeInsets.all(8.0), child: Text(h, style: const TextStyle(color: Colors.white70))),
    Padding(padding: const EdgeInsets.all(8.0), child: Text(da, style: const TextStyle(color: Colors.white70))),
  ]);
}