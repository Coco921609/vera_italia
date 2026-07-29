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
                  image: AssetImage('assets/ima/39.webp'),
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
                    "Un'atmosfera da riviera tropicale o paradiso termale, versione vulcanica e autentica della Campania 🏝️🌋🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Soprannominata 'l'isola verde' per via della sua rigogliosa vegetazione, Ischia è la più grande isola del golfo di Napoli. A differenza della vicina Capri, questa perla d'origine vulcanica brilla per la sua autenticità preservata e per le sue sorgenti termali naturali rinomate fin dall'epoca romana. Dai rigogliosi giardini tropicali ai colorati borghi di pescatori, passando per le sue spiagge di sabbia fine e l'imponente castello medievale sospeso su un isolotto di roccia vulcanica, Ischia è un santuario del benessere dove la natura sprigiona un'energia pura e rigenerante.",
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
                        _buildImageItem('assets/ima/43.webp'),
                        _buildImageItem('assets/ima/42.jpg'),
                        _buildImageItem('assets/ima/39.webp'),
                        _buildImageItem('assets/ima/45.jpg'),
                        _buildImageItem('assets/ima/40.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("I TESORI DELL'ISOLA VERDE 📜"),
                  _buildContentBlock(
                      "Il Castello Aragonese",
                      "Vero simbolo fortificato di Ischia, questa spettacolare cittadella medievale svetta su un isolotto roccioso vulcanico, collegato all'isola principale da un ponte in pietra. Le sue mura custodiscono antiche chiese, giardini pensili e offrono una vista mozzafiato a picco su tutto il golfo."
                  ),
                  _buildContentBlock(
                      "I Parchi Termali e la Baia di Sorgeto",
                      "L'attività vulcanica sotterranea alimenta incredibili parchi termali dotati di piscine a varie temperature immerse in giardini tropicali. A Sorgeto, le sorgenti di acqua bollente sgorgano direttamente tra le onde del mare, creando vasche naturali di roccia calda ad accesso libero."
                  ),
                  _buildContentBlock(
                      "Sant'Angelo: Il Rifugio dei Pescatori",
                      "Questo pittoresco borgo di pescatori interamente pedonale è collegato al resto dell'isola da una sottile striscia di sabbia. Con le sue case dai colori pastello addossate a un imponente promontorio roccioso, le sue viuzze tranquille e i caffè in riva al mare, incarna la perfetta dolce vita mediterranea."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("CONSIGLI PRATICI & SENSAZIONI 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("LOGISTICA & ACCESSO MARITTIMO ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Attenzione: La circolazione dei veicoli appartenenti ai non residenti è strettamente vietata sull'isola durante gran parte dell'anno (primavera-estate). È consigliabile utilizzare l'ottima rete di autobus locali o noleggiare uno scooter sul posto.",
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
          "Traghetto/Aliscafo: da ~12€ a ~25€ a tratta da Napoli o Pozzuoli | Ingresso Castello Aragonese: ~12€",
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
    _buildCalendarRow("✅ Top", "La primavera (aprile-giugno) e l'inizio dell'autunno (settembre-ottobre). L'isola è rigogliosa e fiorita, e i parchi termali si godono appieno lontani dalla folla estiva."),
    _buildCalendarRow("🎒 Info", "Per un'esperienza termale magica e gratuita, scendete di notte i gradini che portano alla baia di Sorgeto: potrete fare il bagno nell'acqua calda termale sotto le stelle."),
    _buildCalendarRow("❌ Evitare", "I mesi di luglio e agosto se volete evitare la confusione. Le spiagge e gli autobus sono spesso presi d'assalto dai flussi turistici."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Trasporto", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Frequenza, Durata e Porti di Partenza", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Traghetto", "Più economico e più lento (~90 min). Consente l'imbarco dei veicoli autorizzati. Partenze da Napoli (Calata Porta di Massa) o Pozzuoli."),
      _buildTableRowData("Aliscafo", "Veloce (~50 min) e riservato ai soli passeggeri a piedi. Ideale per un'escursione in giornata. Partenze dal porto di Napoli Molo Beverello."),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}