import 'package:flutter/material.dart';

class GrottesDeFrasassiPage extends StatelessWidget {
  const GrottesDeFrasassiPage({super.key});

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
                  image: AssetImage('assets/imag/9.jpg'),
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
                    "GROTTE DI FRASASSI 🦇",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Un'atmosfera da gigantesche grotte di Carlsbad negli Stati Uniti 🇺🇸🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Situate nel cuore degli Appennini nella regione Marche, le Grotte di Frasassi offrono uno degli spettacoli sotterranei più mozzafiato del pianeta. Questo regno pietrificato nel tempo svela un balletto magico di maestose stalattiti, stalagmiti giganti e cascate di cristalli. Lungo questo percorso surreale, vi immergerete in un ecosistema preservato da milioni di anni. È un vero e proprio capolavoro naturale dove l'acqua continua, goccia dopo goccia, a scolpire incredibili architetture in un silenzio assoluto.",
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
                        _buildImageItem('assets/imag/5.jpg'),
                        _buildImageItem('assets/imag/6.jpg'),
                        _buildImageItem('assets/imag/8.jpg'),
                        _buildImageItem('assets/imag/10.jpg'),
                        _buildImageItem('assets/imag/9.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("VISITE & PERCORSI SPELEOLOGICI 🪖"),
                  _buildContentBlock(
                      "Visita Classica",
                      "Un percorso accessibile a tutti per ammirare le sale grandiose e le impressionanti concrezioni. La prenotazione online è fortemente consigliata per evitare l'attesa al parcheggio di San Vittore."
                  ),
                  _buildContentBlock(
                      "Percorso Blu (Durata: ~2h | 40€)",
                      "Un primo approccio alla speleologia. Il biglietto include la visita con guide specializzate e la fornitura di tutta l'attrezzatura necessaria. Prenotazione obbligatoria via telefono o e-mail."
                  ),
                  _buildContentBlock(
                      "Percorso Rosso (Durata: ~3h | 50€)",
                      "Per i più avventurosi, questo percorso più lungo e tecnico permette di esplorare le profondità nascoste della grotta. Attrezzatura e guide incluse."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("TARIFFE & CONSIGLI PRATICI 💡"),
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
                    child: Text(
                      "⚠️ Attenzione: Arrivate al parcheggio San Vittore 15 min prima dell'orario del biglietto (30 min in caso di ritiro biglietto gratuito). Navetta inclusa. Gli orari e le tariffe sono soggetti a variazioni. Chiuso il 4 dic, 25 dic e dal 7 al 30 gennaio.",
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
          "Intero: 20€ | Ridotto: 18€ | Ragazzi (6-14): 14€ | Gratuito: -6 anni & PMR",
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
    _buildCalendarRow("✅ Top", "Acquisto online su tickets.frasassi.com per evitare la coda. Il biglietto digitale è accettato."),
    _buildCalendarRow("🎒 Info", "Il servizio navetta dal parcheggio di San Vittore delle Chiuse è gratuito e incluso."),
    _buildCalendarRow("❌ Evitare", "Presentarsi senza prenotazione in piena estate (da giugno a settembre), rischio di attesa prolungata."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Periodo", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Fasce Orarie (Generali)", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Inverno\n(Nov - Feb)", "In settimana: 11:30, 15:30\nFinesettimana/Festivi: 10:00, 11:00, 12:00, 14:30, 16:00, 17:00"),
      _buildTableRowData("Primavera /\nAutunno", "Tutti i giorni: 10:00, 11:00, 12:00, 14:30, 16:00, 17:00"),
      _buildTableRowData("Estate\n(7 Giu - 14 Set)", "Ingressi scaglionati ogni 10/20/30 min a seconda dell'affluenza. (Biglietteria 9:30-17:00)"),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Inglese", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Visite in inglese tutti i giorni alle 11:40, 13:40 e 15:40", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 12), softWrap: true)),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}