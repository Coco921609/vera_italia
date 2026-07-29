import 'package:flutter/material.dart';

class IlesTremitiPage extends StatelessWidget {
  const IlesTremitiPage({super.key});

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
                  image: AssetImage('assets/imag/21.webp'),
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
                    "ISOLE TREMITI 🏝️",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Un'atmosfera da Caraibi, versione arcipelago selvaggio della Puglia 🇩🇴🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Situato al largo della penisola del Gargano nel mare Adriatico, l'arcipelago delle Isole Tremiti è un paradiso di biodiversità e bellezza naturale. Composto principalmente dalle isole di San Domino e San Nicola, questo gioiello preservato abbaglia per le sue acque turchesi di un'assoluta limpidezza, le sue cale di calcare bianco e le sue pinete profumate. È una destinazione fuori dal tempo che unisce spiagge selvagge paradisiache e resti storici medievali.",
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
                        _buildImageItem('assets/imag/21.webp'),
                        _buildImageItem('assets/imag/22.jpg'),
                        _buildImageItem('assets/imag/23.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("LE ISOLE & ESPLORAZIONI ⚓"),
                  _buildContentBlock(
                      "San Domino (Natura & Relax)",
                      "L'isola più grande e più verdeggiante, ricoperta di pini d'Aleppo. È qui che si trova la Cala delle Arene, l'unica spiaggia di sabbia fine dell'arcipelago, ideale per fare il bagno in acque traslucide."
                  ),
                  _buildContentBlock(
                      "San Nicola (Storia & Cultura)",
                      "Il cuore storico delle Tremiti. Dominata dall'imponente abbazia-fortezza fortificata di Santa Maria a Mare, quest'isola rocciosa offre un viaggio affascinante nel passato e panorami vertiginosi."
                  ),
                  _buildContentBlock(
                      "Riserva Marina & Grotte in Barca",
                      "Il modo migliore per esplorare l'arcipelago è noleggiare una piccola imbarcazione (gozzo) o fare un'escursione guidata. Da non perdere la Grotta delle Rondinelle e la famosa statua sommersa di Padre Pio."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("TARIFFE & CONSIGLI PRATICI 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("COLLEGAMENTI MARITTIMI ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Attenzione: Le auto dei non residenti sono severamente vietate sulle isole. L'esplorazione si fa interamente a piedi, in bicicletta o con i barcaioli che fanno da taxi tra San Domino e San Nicola.",
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
          "Traghetto A/R: ~35€ - 50€ (in base alla stagione) | Tassa di sbarco: ~5€ | Accesso isole: Gratuito",
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
    _buildCalendarRow("✅ Top", "Giugno e Settembre per un'acqua calda, un clima perfetto e un'affluenza molto vivibile."),
    _buildCalendarRow("🎒 Info", "Ricordatevi di prenotare i biglietti del traghetto in anticipo online (partenze da Termoli, Vieste, Peschici o Rodi Garganico)."),
    _buildCalendarRow("❌ Evitare", "Il mese di agosto se non amate la folla compatta, così come i giorni di mare mosso (rischio di cancellazioni)."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Stagione", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Frequenza Traghetti / Aliscafi", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Alta Stagione\n(Giun - Sett)", "Numerose partenze giornaliere al mattino (dalle 8:00-9:00) dalla terraferma. Ritorni nel tardo pomeriggio (17:30-18:30)."),
      _buildTableRowData("Bassa Stagione\n(Ott - Mag)", "Collegamenti molto ridotti, principalmente dal porto di Termoli. Orari soggetti alle condizioni meteo."),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Tra le Isole", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Navette marittime circolano continuamente tra San Domino e San Nicola (traitto di pochi minuti, ~5€).", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 12), softWrap: true)),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}