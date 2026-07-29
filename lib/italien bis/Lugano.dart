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
                  image: AssetImage('assets/imag/1.jpg'),
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
                    "L'eleganza svizzera dal fascino puramente mediterraneo 🇨🇭🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Situata nel Canton Ticino, di lingua italiana in Svizzera, Lugano è una perla incastonata tra le montagne e le acque glaciali del suo lago. Con le sue palme, le sue piazze dai portici colorati e i suoi panorami spettacolari, la città offre una fusione perfetta tra la precisione svizzera e la dolce vita italiana. Dall'ascesa al Monte San Salvatore alle passeggiate rilassanti al Parco Ciani, Lugano è un invito alla contemplazione.",
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
                  _buildSectionTitle("TAPPE IMPERDIBILI & PASSEGGIATE 📜"),
                  _buildContentBlock(
                      "Il Monte San Salvatore",
                      "Raggiungibile in funicolare da Paradiso, offre una vista mozzafiato a 360° sul Lago di Lugano, sulle Alpi e persino sul nord Italia. Un'escursione classica permette di scendere verso il pittoresco villaggio di Morcote."
                  ),
                  _buildContentBlock(
                      "Il Parco Ciani & Il Lago",
                      "Il cuore verde della città. Con i suoi alberi secolari, le sue statue e il suo famoso cancello in ferro battuto che si apre direttamente sulle acque del lago, è il luogo ideale per una passeggiata al tramonto."
                  ),
                  _buildContentBlock(
                      "Il Sentiero di Gandria",
                      "Un magnifico percorso pedonale (circa 3 km) che costeggia il lago da Castagnola fino a Gandria, un antico villaggio di pescatori dalle viuzze strette e scoscese, rimasto pietrificato nel tempo."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("CONSIGLI PRATICI 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("AFFLUENZA & ACCESSI ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Attenzione: La città è visitabile tutto l'anno, ma le funicolari (San Salvatore, Brè) hanno chiusure invernali parziali.",
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
          "Città/Lago: Gratuito | Funicolari & Musei: A pagamento (Franchi Svizzeri CHF)",
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
    _buildCalendarRow("✅ Top", "Primavera & Estate (fiori al Parco Ciani, bagni al lago, dolce vita)"),
    _buildCalendarRow("🍂 Ok", "Autunno (colori sublimi ma giornate più corte)"),
    _buildCalendarRow("❌ Evitare", "Inverno (molte attrazioni chiuse, nebbia sul lago)"),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Stagioni", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Funicolari", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Consigli", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Primavera", "9:00 - 18:00", "Ideale per le escursioni"),
      _buildTableRowData("Estate", "9:00 - 23:00", "Arrivare presto, molto affollato"),
      _buildTableRowData("Autunno", "9:00 - 17:00", "Splendida luce dalla cima"),
      _buildTableRowData("Inverno", "Spesso chiuso", "Privilegiare la città bassa"),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Folla", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Alta in estate", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 11), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Prenotare i battelli", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 11), softWrap: true)),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h, String da) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(da, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}