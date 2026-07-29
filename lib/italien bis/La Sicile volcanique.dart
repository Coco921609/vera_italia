import 'package:flutter/material.dart';

class SicileVolcaniquePage extends StatelessWidget {
  const SicileVolcaniquePage({super.key});

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
                  image: AssetImage('assets/ima/27.jpeg'),
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
                    "SICILIA VULCANICA 🌋",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Un'atmosfera da paesaggi islandesi o hawaiani, versione teatralità mediterranea 🇮🇸🇺🇸🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Terra plasmata dal fuoco e dalla mitologia, la Sicilia è uno degli epicentri vulcanici più attivi e affascinanti del pianeta. Dominata dal gigante Etna, il vulcano più alto d'Europa, e circondata a nord dall'arcipelago vulcanico delle Isole Eolie (tra cui l'esplosivo Stromboli e il solforoso Vulcano), la regione offre uno spettacolo geologico puro. Dalle colate di lava nera in contrasto con la neve ad alta quota alle regolari esplosioni notturne proiettate sullo sfondo del mare, la Sicilia vulcanica è un'avventura viscerale nel cuore delle forze della Terra.",
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
                        _buildImageItem('assets/ima/25.jpeg'),
                        _buildImageItem('assets/ima/26.jpg'),
                        _buildImageItem('assets/ima/27.jpeg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("I GIGANTI DI FUOCO 📜"),
                  _buildContentBlock(
                      "L'Etna: Il Faro del Mediterraneo",
                      "Culminando a oltre 3.300 metri, l'Etna (Mongibello) ridisegna costantemente la topografia della Sicilia orientale. I suoi fertili pendii ospitano vigneti d'eccezione e fiorenti agrumeti, mentre i suoi crateri sommitali offrono un paesaggio lunare fatto di deserti di cenere nera e fumarole attive."
                  ),
                  _buildContentBlock(
                      "Il Stromboli: Il Faro delle Eolie",
                      "Questo vulcano insulare è in eruzione continua da quasi 2.000 anni. Le sue regolari esplosioni di brandelli di lava incandescente, visibili di notte dal mare lungo la famosa 'Sciara del Fuoco', costituiscono uno spettacolo ipnotico unico al mondo."
                  ),
                  _buildContentBlock(
                      "Vulcano: L'Origine del Mito",
                      "È su quest'isola che i Romani collocavano le fucine di Vulcano, dio del fuoco. Caratterizzata da intensi odori di zolfo, bagni di fango terapeutici e spiagge di sabbia nero pece, Vulcano offre un'immersione geotermica totale a cielo aperto."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("CONSIGLI PRATICI & SICUREZZA 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("DINAMICA DEI VULCANI ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Attenzione: Le condizioni di accesso alle cime dipendono strettamente dai bollettini di attività emessi dall'INGV (Istituto Nazionale di Geofisica e Vulcanologia). Le normative possono variare da un'ora all'altra.",
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
      Icon(Icons.warning_amber_rounded, color: Colors.orangeAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Accesso regolamentato | Guida vulcanologica obbligatoria oltre le quote autorizzate (~50€ - ~90€ a seconda dell'escursione).",
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
    _buildCalendarRow("✅ Top", "La primavera e l'autunno per l'Etna (evita il caldo soffocante o il gelo invernale). Per lo Stromboli, le escursioni notturne estive in mare sono magiche."),
    _buildCalendarRow("🎒 Info", "È richiesto un equipaggiamento da trekking completo: scarponi da montagna alti, abbigliamento caldo a strati e occhiali per proteggersi dalle polveri di cenere."),
    _buildCalendarRow("❌ Evitare", "Di intraprendere l'ascesa ai crateri sommitali da soli o senza essersi prima informati sullo stato di allerta vulcanica in vigore."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Vulcano", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Tipo di Attività & Accessibilità", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("L'Etna", "Attività effusiva ed esplosiva intermittente. Funivia e 4x4 operativi di giorno in base al meteo."),
      _buildTableRowData("Stromboli", "Attività stromboliana persistente (esplosioni ogni 15-20 min). Escursioni di osservazione programmate al tramonto."),
      _buildTableRowData("Vulcano", "Intensa attività fumarolica. L'accesso al gran cratere è soggetto alle variazioni di emissione di gas tossici."),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}