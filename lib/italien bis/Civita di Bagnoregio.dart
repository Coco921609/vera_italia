import 'package:flutter/material.dart';

class CivitaDiBagnoregioPage extends StatelessWidget {
  const CivitaDiBagnoregioPage({super.key});

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
                  image: AssetImage('assets/ima/1.jpg'), // Mantieni le tue immagini
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
                    "CIVITA DI BAGNOREGIO 🏰",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Un'atmosfera da Grand Canyon o Meteore, versione borgo medievale sospeso del Lazio 🇺🇸🇬🇷🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Soprannominata 'la città che muore' a causa della progressiva erosione dello sperone di tufo su cui sorge, Civita di Bagnoregio è un capolavoro di epoca medievale ed etrusca. Situato nel Lazio, questo spettacolare borgo è accessibile unicamente attraverso un unico e vertiginoso ponte pedonale sospeso sopra una vasta valle di calanchi rocciosi. Quando la nebbia avvolge la valle, l'isolotto di pietra sembra fluttuare come per magia sopra le nuvole.",
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
                        _buildImageItem('assets/ima/1.jpg'),
                        _buildImageItem('assets/ima/2.jpg'),
                        _buildImageItem('assets/ima/4.webp'),
                        _buildImageItem('assets/ima/3.jpg'),
                        _buildImageItem('assets/ima/5.webp'),
                        _buildImageItem('assets/ima/6.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("ESPLORAZIONI STORICHE 📜"),
                  _buildContentBlock(
                      "Il Ponte Sospeso & Panorama",
                      "La scoperta inizia con la traversata a piedi della passerella lunga 300 metri. È un'esperienza indimenticabile in cui si prende piena coscienza del totale isolamento del borgo e della fragilità geologica del sito."
                  ),
                  _buildContentBlock(
                      "Porta Santa Maria & I Vicoli",
                      "Entrate nel borgo attraversando questa monumentale porta scavata direttamente nella roccia dagli Etruschi. Oltre la porta vi attende un labirinto di vicoli fioriti, case in pietra risalenti al Medioevo e cortili interni perfettamente conservati."
                  ),
                  _buildContentBlock(
                      "Il Belvedere sulla Valle dei Calanchi",
                      "In fondo al borgo, i giardini sospesi e i punti panoramici offrono viste mozzafiato a perdita d'occhio sul paesaggio lunare e spettacolare dei calanchi argillosi che circondano la collina."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("CONSIGLI PRATICI & BUDGET 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("AFFLUENZA & ORARI ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Attenzione: Il borgo conta meno di una dozzina di abitanti residenti. La maggior parte dei piccoli negozi e ristoranti chiude o riduce fortemente gli orari durante la stagione invernale.",
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
      Icon(Icons.euro, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Biglietto d'ingresso: ~5€ (sostegno alla conservazione) | Parcheggio belvedere: ~2€/h",
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
    _buildCalendarRow("✅ Top", "Primavera e autunno. Le temperature sono ideali per salire la passerella e le nebbie mattutine d'ottobre regalano un'atmosfera magica."),
    _buildCalendarRow("🎒 Info", "La salita finale sulla passerella è piuttosto ripida. Indossate buone scarpe da camminata e viaggiate leggeri senza bagagli ingombranti."),
    _buildCalendarRow("❌ Evitare", "I fine settimana di grande affluenza in estate, poiché la stretta passerella si congestiona rapidamente sotto il caldo soffocante del primo pomeriggio."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Periodo", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Consigli di Visita & Affluenza", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Mattina\n(08:00 - 10:00)", "Il momento migliore per evitare la folla delle escursioni giornaliere. Luce perfetta per fotografare la silhouette del borgo."),
      _buildTableRowData("Tardo pomeriggio\n(Dopo le 17:00)", "Il borgo ritrova la sua autentica tranquillità. I tramonti accendono le pareti di tufo in un'atmosfera di totale serenità."),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Accesso", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("La biglietteria è aperta tutti i giorni dalle 08:00 alle 20:00. Al di fuori di questi orari, l'accesso al ponte rimane libero.", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 12), softWrap: true)),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}