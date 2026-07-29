import 'package:flutter/material.dart';

class FurorePage extends StatelessWidget {
  const FurorePage({super.key});

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
                  image: AssetImage('assets/imag/20.jpg'), // Mantieni le tue immagini
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
                    "FIORDO DI FURORE 🌊",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Un'atmosfera da Mostar in Bosnia, situata in un fiordo italiano della Costiera Amalfitana 🇧🇦🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Furore è un gioiello nascosto della Costiera Amalfitana, famoso per il suo spettacolare fiordo scavato nella roccia. Scavalcato da un monumentale ponte sospeso alto 30 metri, questo braccio di mare ospita una piccolissima spiaggia segreta e antiche case di pescatori. È uno scenario da cartolina mozzafiato che ricorda la gola rocciosa di Mostar, unendo l'immensità della falesia alla dolcezza del Mar Mediterraneo.",
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
                        _buildImageItem('assets/imag/15.webp'),
                        _buildImageItem('assets/imag/17.jpg'),
                        _buildImageItem('assets/imag/20.jpg'),
                        _buildImageItem('assets/imag/19.webp'),
                        _buildImageItem('assets/imag/18.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("IMPERDIBILI & ESPERIENZE 🏊‍♂️"),
                  _buildContentBlock(
                      "La Spiaggia del Fiordo (Balneazione Consentita)",
                      "La balneazione è completamente consentita e gratuita nel fiordo! L'acqua è di una limpidezza eccezionale e protetta dal vento dalle immense falesie. L'accesso avviene a piedi tramite una scalinata in pietra dal ponte principale."
                  ),
                  _buildContentBlock(
                      "Il Ponte Sospeso & Il Tuffo",
                      "Il ponte stradale che sovrasta il fiordo offre un panorama vertiginoso. È qui che ogni anno si svolge il campionato internazionale di tuffi dalle grandi altezze, dove gli atleti si tuffano da oltre 28 metri di altezza."
                  ),
                  _buildContentBlock(
                      "Il Paese Dipinto",
                      "Furore è anche chiamato il 'paese che non c'è' perché le sue case sono sparse sulla falesia. Risalendo i sentieri, potrete scoprire i magnifici affreschi murali dipinti direttamente sulle facciate."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("TARIFFE & CONSIGLI PRATICI 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("ACCESSO & INFO ORARI ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Attenzione: La spiaggia è molto stretta e il sole scompare rapidamente nel primo pomeriggio a causa delle falesie. Non c'è alcun parcheggio nelle immediate vicinanze, l'accesso in autobus o in scooter è vivamente consigliato.",
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
          "Accesso Spiaggia: Gratuito | Balneazione: Libera e consentita | Lettini: Nessuno (Spiaggia libera)",
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
    _buildCalendarRow("✅ Top", "Arrivare presto al mattino (tra le 9:00 e le 12:00) per trovare posto sui ciottoli e godersi il sole diretto."),
    _buildCalendarRow("🎒 Info", "Portate scarpe da scoglio, poiché la spiaggia è composta da ciottoli e l'accesso all'acqua può essere scivoloso."),
    _buildCalendarRow("❌ Evitare", "Arrivare in auto. È impossibile parcheggiare sul ponte. Prendete l'autobus SITA (Fermata Furore Fiordo)."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Accessibilità / Orari", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Maggio - Ottobre\n(Stagione Ideale)", "Accesso libero 24h/24. Ideale per la balneazione. Scalinata aperta."),
      _buildTableRowData("Novembre - Aprile\n(Bassa Stagione)", "Accesso libero, ma balneazione molto fredda. Attenzione ai giorni di mareggiata (accesso alle scale talvolta chiuso per sicurezza)."),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Sicurezza", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Spiaggia non sorvegliata. Controllate lo stato del mare prima di tuffarvi o nuotare al largo.", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 12), softWrap: true)),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}