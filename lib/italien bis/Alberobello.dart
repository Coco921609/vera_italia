import 'package:flutter/material.dart';

class AlberobelloPage extends StatelessWidget {
  const AlberobelloPage({super.key});

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
                  image: AssetImage('assets/ima/33.jpg'), // Mantieni le tue immagini
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
                    "ALBEROBELLO 🛖",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Un'atmosfera da villaggio di Hobbit o da oasi fantastica, versione architettura vernacolare della Puglia 🇳NZ🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Iscritto nel Patrimonio Mondiale dell'UNESCO, il centro storico di Alberobello offre uno spettacolo architettonico unico al mondo. Famosa per i suoi 'Trulli' — piccole case in pietra calcarea imbiancate a calce e sormontate da tetti conici grigi fatti di lastre posate a secco —, la città assomiglia a una fiaba a grandezza naturale. Passeggiare per i suoi vicoli scoscesi, circondati da facciate immacolate decorate con simboli mistici dipinti a mano, è una vera immersione nell'ingegno e nelle tradizioni segrete del sud Italia.",
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
                        _buildImageItem('assets/ima/31.jpg'),
                        _buildImageItem('assets/ima/32.jpg'),
                        _buildImageItem('assets/ima/33.jpg'),
                        _buildImageItem('assets/ima/34.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("I RIONI STORICI 📜"),
                  _buildContentBlock(
                      "Rione Monti: Il Cuore Vivace",
                      "Il quartiere più famoso e turistico della città, adagiato su una collina. Conta più di 1.000 trulli che oggi ospitano botteghe artigiane locali, tessitori di lino e terrazze panoramiche da cui ammirare un vero e proprio mare di tetti conici."
                  ),
                  _buildContentBlock(
                      "Rione Aia Piccola: L'Autenticità Preservata",
                      "Meno frequentato e puramente residenziale, questo quartiere offre un'immersione tranquilla nella vita quotidiana locale. I vicoli sono più silenziosi, preservando l'atmosfera originale della città e permettendo di comprendere lo stile di vita tradizionale all'interno di queste strutture in pietra."
                  ),
                  _buildContentBlock(
                      "Il Trullo Sovrano e la Chiesa di Sant'Antonio",
                      "Alberobello porta l'architettura dei trulli al suo apice con il Trullo Sovrano, l'unico edificio di questo tipo costruito su due piani, e la Chiesa di Sant'Antonio di Padova, un tempio unico al mondo che riproduce le forme coniche dell'architettura vernacolare locale."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("CONSIGLI PRATICI & EMOZIONI 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("RACCOMANDAZIONI DI VISITA ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Attenzione: Alberobello è una destinazione estremamente popolare in estate. In alta stagione, i vicoli del Rione Monti si riempiono già dalle 10:00 del mattino. Prediligi una visita al mattino presto o di sera.",
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
      Icon(Icons.house_siding, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Accesso ai rioni storici: Gratuito e libero | Ingresso Trullo Sovrano: Museo ~2€",
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
    _buildCalendarRow("✅ Top", "L'alba o il tardo pomeriggio, quando la pietra calcarea riflette una luce morbida e le ombre dei tetti conici si allungano sui vicoli imbiancati."),
    _buildCalendarRow("🎒 Info", "Alzate lo sguardo: i tetti dei trulli mostrano spesso simboli di origine pagana, cristiana o magica, dipinti per proteggere le case dal malocchio."),
    _buildCalendarRow("❌ Evitare", "La fascia oraria 11:00 - 15:00 in pieno agosto, poiché il calore sulla pietra bianca è soffocante e l'afflusso turistico raggiunge il massimo."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Momento", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Atmosfera & Visibilità", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Mattina", "Atmosfera serena e ideale per le fotografie. I residenti si muovono con calma prima dell'afflusso turistico."),
      _buildTableRowData("Sera", "I trulli si illuminano sotto le luci pubbliche. L'atmosfera diventa magica, quasi irreale, ideale per una passeggiata al fresco."),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}