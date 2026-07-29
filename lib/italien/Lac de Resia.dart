import 'package:flutter/material.dart';

class LacDeResiaPage extends StatelessWidget {
  const LacDeResiaPage({super.key});

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
                  image: AssetImage('assets/images/2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("LAGO DI RESIA 🏔️", style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2)),
                  const SizedBox(height: 10),
                  const Text("Un tocco di Lago di Bled, Slovenia, in versione italiana 🇸🇮🇮🇹", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  const Text(
                    "Nel cuore del Trentino-Alto Adige, il Lago di Resia affascina con il suo misterioso campanile che emerge dall'acqua, tragico vestigio di un villaggio sommerso nel 1950. Tra magnifici paesaggi alpini e racconti storici, questo site è un santuario per gli appassionati di fotografia e di storia. Oggi, questo gioiello offre toccanti visite guidate, attività acquatiche ed escursioni panoramiche indimenticabili.",
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
                        _buildImageItem('assets/images/3.jpeg'),
                        _buildImageItem('assets/images/4.jpg'),
                        _buildImageItem('assets/images/5.jpg'),
                        _buildImageItem('assets/images/6.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("UN PO' DI STORIA 📜"),
                  _buildContentBlock("La creazione del bacino", "Nel 1950, la valle fu trasformata per produrre energia. La fusione di diversi laghi naturali sommerse l'antico villaggio di Curon, costringendo gli abitanti all'esilio."),
                  _buildContentBlock("Un campanile solitario", "Reliquia del XIV secolo, questo campanile è tutto ciò che resta dell'antica chiesa. Si erge oggi come un monumento toccante, testimone silenzioso di un passato sommerso."),
                  _buildContentBlock("Un patrimonio preservato", "Il lago è oggi un luogo della memoria. Le visite guidate permettono ai visitatori di scoprire la profondità di questo sito dove bellezza naturale e storie avvincenti si intrecciano."),

                  const SizedBox(height: 30),
                  _buildSectionTitle("CONSIGLI PRATICI 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("ORARI DI APERTURA ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text("⚠️ Nota: gli orari possono variare durante l'anno.", style: TextStyle(color: Colors.white30, fontSize: 12)),
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
    child: const Row(children: [Icon(Icons.euro_symbol, color: Colors.greenAccent), SizedBox(width: 10), Expanded(child: Text("Accesso al sito: Gratuito", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)))]),
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
    _buildCalendarRow("✅ Ideale", "Autunno (colori) & Primavera"),
    _buildCalendarRow("☀️ OK", "Estate (arrivare presto per evitare il caldo)"),
    _buildCalendarRow("❌ Chiuso", "Inverno (chiusura climatica)"),
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
      0: FlexColumnWidth(1.2),
      1: FlexColumnWidth(1.3),
      2: FlexColumnWidth(1.5)
    },
    border: TableBorder.all(color: Colors.white24),
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(8.0), child: Text("Date", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(8.0), child: Text("Orari", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(8.0), child: Text("Ultimo ingresso", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ]),
      _buildTableRowData("Aprile - Giugno", "09:00-19:00", "18:30"),
      _buildTableRowData("Luglio - Agosto", "08:00-20:00", "19:30"),
      _buildTableRowData("Sett - Ott", "09:00-18:00", "17:30"),
      _buildTableRowData("Nov - Marzo", "Chiuso", "-"),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(8.0), child: Text("Affluenza", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(8.0), child: Text("Preferire prima delle 09:00 o dopo le 17:00", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 11))),
        Padding(padding: EdgeInsets.all(8.0), child: Text("Principalmente in estate", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 11))),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h, String da) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(8.0), child: Text(p, style: const TextStyle(color: Colors.white70))),
    Padding(padding: const EdgeInsets.all(8.0), child: Text(h, style: const TextStyle(color: Colors.white70))),
    Padding(padding: const EdgeInsets.all(8.0), child: Text(da, style: const TextStyle(color: Colors.white70))),
  ]);
}