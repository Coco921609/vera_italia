import 'package:flutter/material.dart';

class DolomitesPage extends StatelessWidget {
  const DolomitesPage({super.key});

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
                  image: AssetImage('assets/ima/28.jpeg'),
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
                    "LE DOLOMITI 🏔️",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Un'atmosfera da parchi nazionali dell'Ovest americano, versione cime monumentali delle Alpi 🇺🇸🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Iscritte al patrimonio mondiale dell'UNESCO, le Dolomiti si ergono majestuose nel nord-est dell'Italia. Caratterizzate da gigantesche pareti di roccia calcarea, guglie affilate e vallate rigogliose costellate da laghi alpini dalle acque turchesi, queste montagne offrono un paesaggio dalla drammatica verticalità. All'alba e al tramonto, un fenomeno unico chiamato 'Enrosadira' infiamma la roccia, tingendo le cime di sfumature spettacolari che vanno dal rosa acceso al rosso fuoco.",
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
                        _buildImageItem('assets/ima/28.jpeg'),
                        _buildImageItem('assets/ima/29.jpg'),
                        _buildImageItem('assets/ima/29.webp'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("LUOGHI EMBLEMATICI 📜"),
                  _buildContentBlock(
                      "Le Tre Cime di Lavaredo",
                      "Questi tre giganteschi obelischi rocciosi allineati sono il simbolo indiscutibile delle Dolomiti. Il sentiero escursionistico che ne fa il giro offre punti panoramici vertiginosi su queste pareti di pura dolomia che sfidano le leggi della gravità."
                  ),
                  _buildContentBlock(
                      "Il Lago di Braies",
                      "Vera e propria perla delle Alpi, questo lago d'altitudine è famoso per il riflesso perfetto delle pareti rocciose della Croda del Becco nelle sue acque verde smeraldo. Le sue tradizionali barche in legno lo rendono uno dei luoghi più poetici della regione."
                  ),
                  _buildContentBlock(
                      "L'Alpe di Siusi",
                      "L'altopiano più alto d'Europa offre un contrasto sorprendente: un immenso pascolo ondulato sospeso a 1.800 metri di altitudine, incorniciato dai profili massicci e dirupati delle cime del Sassolungo e dello Sciliar."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("CONSIGLI PRATICI & LOGISTICA 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("STAGIONI & ACCESSI ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Attenzione: I prezzi dei pedaggi delle strade alpine (come quella delle Tre Cime) e gli orari degli impianti di risalita possono variare nel corso dell'anno. In mezza stagione (maggio e novembre), la maggior parte delle funivie è chiusa.",
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
      Icon(Icons.hiking, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Accesso ai parchi: Gratuito | Strada a pedaggio Tre Cime: ~30€/auto | Pass funivie opzionale.",
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
    _buildCalendarRow("✅ Top", "Da metà giugno a settembre per le escursioni e la fioritura dei pascoli alpini. Da dicembre a marzo per lo sci nel cuore del comprensorio Dolomiti Superski."),
    _buildCalendarRow("🎒 Info", "Alcuni laghi e passi molto popolari (come Braies) regolano l'accesso automobilistico in estate. Prediligete le navette locali o arrivate prima delle 08:00."),
    _buildCalendarRow("❌ Evitare", "Il mese di maggio e il tardo autunno (ottobre/novembre), poiché il meteo è molto instabile, la neve blocca i passi e i rifugi sono chiusi."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Stagione", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Dinamica & Consigli di Visita", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Estate\n(Giun - Sett)", "Ideale per il trekking ad alta quota, le vie ferrate e l'apertura completa dei rifugi alpini."),
      _buildTableRowData("Inverno\n(Dic - Mar)", "Metamorfosi totale sotto la neve. Paradiso dello sci di pista, dello sci di fondo e delle escursioni con le ciaspole."),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}