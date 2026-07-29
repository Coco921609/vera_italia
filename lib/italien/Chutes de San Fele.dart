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
                  const Text("CASCATE DI SAN FELE 🌊", style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2)),
                  const SizedBox(height: 10),
                  const Text("Un assaggio dei Laghi di Plitvice croati, in una versione italiana selvaggia 🇭🇷🇮🇹", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  const Text(
                    "Situate nel cuore dell'Appennino lucano in Basilicata, le cascate di San Fele offrono uno spettacolo degno di una fiaba. Formate dai suggestivi salti del torrente Bradano nella valle di Vitalba, si rivelano in mezzo a una natura rigogliosa e incontaminata. Questo santuario selvaggio, che mescola antichi mulini dimenticati e la calma assoluta della foresta, invita all'esplorazione attraverso i suoi sentieri escursionistici storici e i torrenti fragorosi.",
                    style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
                    softWrap: true,
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("ANTEPRIMA 📸"),
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
                  _buildSectionTitle("ITINERARI ED ESCURSIONI 📜"),
                  _buildContentBlock("Il Sentiero Verde - U Urtone (2 km)", "Un percorso di circa un'ora partendo dal paese. Conduce alla cascata U Urtone, alta 22 metri. Il sentiero segue il torrente Bradano, passando accanto a strutture idrauliche degli anni '50 e alle rovine di un antico mulino."),
                  _buildContentBlock("Il Sentiero Paradiso & I Gemelli", "Il sentiero Paradiso è molto breve (10 min), immerso in un silenzio assoluto. I Gemelli (300 m) rivelano due cascate nate dal magico incontro dei torrenti Bradano e Acquafredda."),
                  _buildContentBlock("Il Sentiero del Ponte (4,5 km)", "Il più lungo e selvaggio degli itinerari (circa 4 ore di cammino). Porta in una natura totalmente preservata e attraversa un magnifico ponte storico costruito negli anni '20."),

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
                    child: Text("⚠️ Nota: L'accesso è gratuito, ma si prega di seguire i periodi consigliati.", style: TextStyle(color: Colors.white30, fontSize: 12)),
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
    _buildCalendarRow("✅ Ottimo", "Autunno (colori degli alberi spettacolari) & Primavera"),
    _buildCalendarRow("☀️ Buono", "Estate (arrivare presto per evitare il caldo)"),
    _buildCalendarRow("❌ Evitare", "Inverno"),
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
        Padding(padding: EdgeInsets.all(8.0), child: Text("Stagioni", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(8.0), child: Text("Orari", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(8.0), child: Text("Consigli", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ]),
      _buildTableRowData("Primavera", "Sempre", "Consigliato"),
      _buildTableRowData("Estate", "Sempre", "Arrivare presto"),
      _buildTableRowData("Autunno", "Sempre", "Alba/Tramonto"),
      _buildTableRowData("Inverno", "Sempre", "Evitare"),
      TableRow(children: [
        const Padding(padding: EdgeInsets.all(8.0), child: Text("Affollamento", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold))),
        const Padding(padding: EdgeInsets.all(8.0), child: Text("Mattina/Sera", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 11))),
        const Padding(padding: EdgeInsets.all(8.0), child: Text("Soprattutto in estate", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 11))),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h, String da) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(8.0), child: Text(p, style: const TextStyle(color: Colors.white70))),
    Padding(padding: const EdgeInsets.all(8.0), child: Text(h, style: const TextStyle(color: Colors.white70))),
    Padding(padding: const EdgeInsets.all(8.0), child: Text(da, style: const TextStyle(color: Colors.white70))),
  ]);
}