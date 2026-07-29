import 'package:flutter/material.dart';

class JardinDeNinfaPage extends StatelessWidget {
  const JardinDeNinfaPage({super.key});

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
                  image: AssetImage('assets/ima/7.webp'),
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
                    "GIARDINO DI NINFA 🌺",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Un'atmosfera da tenuta romantica inglese, versione oasi medievale del Lazio 🇬🇧🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Classificato tra i giardini romantici più belli del mondo, il Giardino di Ninfa è un eden sospeso nel tempo, situato nella provincia di Latina. Realizzato sulle rovine di un'antica e fiorente città medievale, questo parco unico vede convivere rovine ricoperte d'edera, corsi d'acqua cristallini attraversati da ponti in pietra e un'infinita varietà di piante esotiche e rose antiche. È un'opera d'arte vivente dove natura e storia si fondono poeticamente.",
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
                        _buildImageItem('assets/ima/7.webp'),
                        _buildImageItem('assets/ima/8.webp'),
                        _buildImageItem('assets/ima/9.webp'),
                        _buildImageItem('assets/ima/10.webp'),
                        _buildImageItem('assets/ima/11.webp'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("PASSEGGIATE & VESTIGIA ✨"),
                  _buildContentBlock(
                      "Le Rovine della Chiesa di Santa Maria Maggiore",
                      "Tra i resti più spettacolari, l'antica navata della chiesa principale è oggi tappezzata da flora rampicante. I resti degli affreschi medievali sussurrano ancora la storia passata della città."
                  ),
                  _buildContentBlock(
                      "Il Fiume Ninfa & I Suoi Ponti",
                      "Un'acqua pura, di una trasparenza assoluta, scorre direttamente dalle montagne circostanti per circondare le rovine. I ponti in stile romantico offrono punti di vista incantevoli degni di un quadro impressionista."
                  ),
                  _buildContentBlock(
                      "La Collezione di Rose & Flora Esotica",
                      "Il microclima unico del sito permette a magnolie, abeti giapponesi e migliaia di rose rampicanti di sbocciare lungo i vecchi muri in pietra, sommergendo il giardino di profumi delicati durante la fioritura."
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
                      "⚠️ Attenzione: I prezzi e gli orari possono variare nel corso dell'anno. Il giardino si visita principalmente su prenotazione obbligatoria online per preservare il suo fragile ecosistema.",
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
      Icon(Icons.local_activity, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Biglietto Adulto: 20,75 € IVA inclusa | Sotto i 12 anni: Gratuito",
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
    _buildCalendarRow("✅ Top", "La primavera (da aprile a giugno) per assistere alla spettacolare fioritura delle rose antiche e dei ciliegi."),
    _buildCalendarRow("🎒 Info", "Le visite sono esclusivamente guidate e durano circa un'ora al fine di rispettare la tranquillità e la storia del luogo."),
    _buildCalendarRow("❌ Evitare", "Di venire senza prenotazione preventiva. Il numero di ingressi giornalieri è strettamente limitato per proteggere la flora."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Giorno", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Orari di Visita", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Lunedì - Giovedì", "Chiuso"),
      _buildTableRowData("Venerdì", "17:15 - 19:00"),
      _buildTableRowData("Sabato", "17:15 - 19:00"),
      _buildTableRowData("Domenica", "17:15 - 19:00"),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}