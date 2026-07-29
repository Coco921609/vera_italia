import 'package:flutter/material.dart';

class GrotteMangiapanePage extends StatelessWidget {
  const GrotteMangiapanePage({super.key});

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
                  image: AssetImage('assets/imag/11.webp'),
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
                    "GROTTE MANGIAPANE 🛖",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Un'atmosfera da Cappadocia in Turchia, versione troglodita siciliana 🇹🇷🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Situata vicino a Custonaci in Sicilia, la Grotta Mangiapane è la più grande delle grotte di Scurati. Questo luogo fuori dal tempo ospita un minuscolo villaggio rurale risalente al XIX secolo, costruito direttamente all'interno di una maestosa cavità alta 70 metri. Abbandonato negli anni '50 e poi accuratamente restaurato, testimonia la vita contadina siciliana di un tempo. Oggi trasformato in museo, le sue casette in pietra, le stalle e i forni a legna vi immergono in un'atmosfera autentica, tra mare e montagna.",
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
                        _buildImageItem('assets/imag/12.jpg'),
                        _buildImageItem('assets/imag/14.jpg'),
                        _buildImageItem('assets/imag/15.webp'),
                        _buildImageItem('assets/imag/11.webp'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("IMPERDIBILI & EVENTI 🏺"),
                  _buildContentBlock(
                      "Il Borgo Museo (Tutto l'anno)",
                      "Una passeggiata libera tra le antiche abitazioni allestite. Vi scoprirete gli attrezzi agricoli d'epoca, il mulino, la cappella e le autentiche botteghe del calzolaio o del fabbro."
                  ),
                  _buildContentBlock(
                      "Il Museo Vivente (Periodo Estivo)",
                      "Durante l'estate, il borgo riprende vita grazie ad artigiani locali che vengono a praticare i mestieri di una volta (ceramica, tessitura, produzione del formaggio) direttamente nelle botteghe della grotta."
                  ),
                  _buildContentBlock(
                      "Il Presepe Vivente (Periodo Natalizio)",
                      "Il famoso 'Presepe Vivente'! All'approssimarsi del Natale, la grotta si trasforma in un magnifico presepe vivente con oltre 160 figuranti, illuminato dalle torce in un'atmosfera magica."
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
                      "⚠️ Attenzione: Essendo gestito da un'associazione locale, gli orari possono essere irregolari fuori stagione. Si raccomanda vivamente di verificare in loco o sulle pagine ufficiali prima di mettervi in viaggio.",
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
          "Intero: ~8€ | Ridotto: ~5€ | Presepe Vivente: Tariffe specifiche",
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
    _buildCalendarRow("✅ Top", "Natale (per il Presepe Vivente) ed l'Estate per vedere gli artigiani al lavoro nel Museo Vivente."),
    _buildCalendarRow("🎒 Info", "Il terreno è in pietra e terra battuta, indossate scarpe basse e comode."),
    _buildCalendarRow("❌ Evitare", "La bassa stagione (Novembre, Febbraio, Marzo) senza chiamare prima, poiché il sito potrebbe essere chiuso."),
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
      _buildTableRowData("Alta Stagione\n(Giugno - Sett)", "Tutti i giorni: 10:00 - 18:00 (Spesso prolungato fino alle 19:00 ad agosto)"),
      _buildTableRowData("Bassa Stagione\n(Primavera/Autunno)", "Variabile. Generalmente aperto nel fine settimana: 10:00 - 18:00"),
      _buildTableRowData("Natale\n(Dic - Gen)", "Presepe Vivente: Aperto nel tardo pomeriggio / sera (circa 16:00 - 21:00)"),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Visita", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Visita libera (circa 45 min - 1h). Sul posto sono presenti pannelli esplicativi.", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 12), softWrap: true)),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}