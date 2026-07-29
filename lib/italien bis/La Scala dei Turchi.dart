import 'package:flutter/material.dart';

class ScalaDeiTurchiPage extends StatelessWidget {
  const ScalaDeiTurchiPage({super.key});

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
                  image: AssetImage('assets/ima/15.webp'),
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
                    "SCALA DEI TURCHI 🌊",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Un'atmosfera da scogliere bianche di Pamukkale, versione maestosità calcarea della Sicilia 🇹🇷🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Scolpita dal vento e dalle onde in una marna di un bianco puro e accecante, la Scala dei Turchi è una falesia monumentale a forma di scalinata naturale che si tuffa fieramente nelle acque smeraldo della costa di Agrigento in Sicilia. Questo monumento naturale unico deve il suo nome alle successive ondate di pirati saraceni che un tempo vi trovavano un riparo ideale per approdare. È un paesaggio grandioso e irreale in cui il bianco immacolato della roccia contrasta magistralmente con il blu profondo del Mediterraneo.",
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
                        _buildImageItem('assets/ima/15.webp'),
                        _buildImageItem('assets/ima/12.jpg'),
                        _buildImageItem('assets/ima/14.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("LUCI & PANORAMI ✨"),
                  _buildContentBlock(
                      "Rimanete fino al tramonto",
                      "Il tramonto sulla Scala dei Turchi è davvero spettacolare, soprattutto salendo sulla falesia, che offre uno splendido punto di vista verso ovest. Fate in modo di esserci almeno per la fine della giornata per ammirare lo spettacolo. Si noti che non è possibile salire sulla falesia dopo le 19:00, ma il tramonto è bellissimo anche ai piedi della stessa."
                  ),
                  _buildContentBlock(
                      "Gli Scalini di Marna Bianca",
                      "La struttura a gradoni naturali della falesia permette un'immersione visiva straordinaria. La marna, una roccia sedimentaria argilloso-calcarea, rimane fresca sotto i piedi, offrendo la sensazione di camminare su un ghiacciaio caldo sotto il sole siciliano."
                  ),
                  _buildContentBlock(
                      "Le Spiagge di Sabbia Fine adiacenti",
                      "Da entrambi i lati del promontorio bianco si estendono lunghe strisce di sabbia dorata. Ideali per la balneazione, permettono di osservare la falesia con una prospettiva eccezionale, accentuando il contrasto dei colori."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("TARIFFE & CONDIZIONI DI ACCESSO 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("ACCESSO & ORARI ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Attenzione: I prezzi e gli orari possono variare nel corso dell'anno. Le normative locali volte a proteggere la marna dall'erosione sono severe, si prega di rispettare le segnalazioni.",
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
      Icon(Icons.credit_card, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Ingresso Falesia: 6 € a persona | Acquisto esclusivamente con carta di credito in biglietteria",
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
    _buildCalendarRow("✅ Top", "Tardo pomeriggio, per cogliere il colore dorato che assume la roccia bianca quando il sole scende sull'orizzonte occidentale."),
    _buildCalendarRow("🎒 Info", "La biglietteria si trova direttamente all'ingresso del sentiero che porta alla falesia. I contanti non sono accettati per il pagamento."),
    _buildCalendarRow("❌ Evitare", "Arrivare dopo le 19:00 se desiderate salire in quota, poiché gli accessi alla struttura superiore della falesia chiudono."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Zona", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Orari di Apertura & Regole", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Accesso Falesia", "10:00 - 19:00 (Ultima salita consentita sulla struttura calcarea alle 19:00)."),
      _buildTableRowData("Piedi della Falesia", "Accesso libero in serata per ammirare il tramonto dalla spiaggia sottostante."),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}