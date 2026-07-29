import 'package:flutter/material.dart';

class ValDOrciaPage extends StatelessWidget {
  const ValDOrciaPage({super.key});

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
                  image: AssetImage('assets/imag/29.webp'),
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
                    "VAL D'ORCIA 🍂",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Un'atmosfera da Napa Valley in California, versione capolavoro autunnale toscano 🇺🇸🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Iscritta al patrimonio mondiale dell'UNESCO, la Val d'Orcia incarna la quintessenza del paesaggio toscano. Se la valle è splendida durante tutto l'anno, è in autunno che diventa veramente magica. Le colline ondulate abbandonano il loro verde primaverile per drappeggiarsi in una palette irreale di toni ocre, oro e porpora. Tra i cipressi allineati con cura, i vigneti carichi di grappoli e le nebbie mistiche che si sollevano dalle vallate al mattino presto, ogni panorama sembra dipinto da un maestro del Rinascimento.",
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
                        _buildImageItem('assets/imag/24.webp'),
                        _buildImageItem('assets/imag/25.jpg'),
                        _buildImageItem('assets/imag/26.webp'),
                        _buildImageItem('assets/imag/27.jpg'),
                        _buildImageItem('assets/imag/28.webp'),
                        _buildImageItem('assets/imag/29.webp'),
                        _buildImageItem('assets/imag/30.webp'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("TAPPE IMPERDIBILI IN AUTUNNO 🍇"),
                  _buildContentBlock(
                      "La Strada dei Cipressi & Nebbie Mattutine",
                      "Lo scorcio più iconico si trova vicino a San Quirico d'Orcia. In autunno, il grande segreto è andarci all'alba: una densa e poetica nebbia avvolge la base delle colline, lasciando emergere le cime dei cipressi sotto i primi raggi radenti del sole. Un paradiso per i fotografi."
                  ),
                  _buildContentBlock(
                      "La Strada del Vino (Brunello & Montepulciano)",
                      "L'autunno è la stagione della vendemmia e del risveglio delle cantine. È il momento ideale per percorrere i vigneti dorati che circondano i borghi arroccati di Montalcino e Montepulciano, e degustare vini di fama mondiale davanti al camino in un'antica dimora in pietra."
                  ),
                  _buildContentBlock(
                      "Pienza & La Cappella di Vitaleta",
                      "Passeggiate tra i vicoli pavimentati di Pienza, la 'città ideale' del Rinascimento, famosa per il suo formaggio Pecorino (che si arricchisce di nuovi sapori in questa stagione). Lungo la strada, fate una deviazione per ammirare la piccola e solitaria Cappella di Vitaleta, isolata in mezzo ai campi color bronzo."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("TARIFFE & CONSIGLI PRATICI 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("ATMOSFERA & LUCE ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Attenzione: La Val d'Orcia non si visita agevolmente con i trasporti pubblici. Noleggiare un'auto o uno scooter è fondamentale per avventurarsi sulle strade bianche non asfaltate che conducono ai punti panoramici più belli.",
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
      Icon(Icons.landscape, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Accesso Valle: Gratuito | Degustazioni di vino: ~20€ - 45€ | Parcheggio Pienza: ~2€/h",
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
    _buildCalendarRow("✅ Top", "Da fine ottobre a metà novembre. È il picco dei colori caldi ('foliage'), della raccolta delle olive e delle mistiche nebbie mattutine."),
    _buildCalendarRow("🎒 Info", "Portate una giacca calda e una giacca a vento. Anche se le giornate autunnali rimangono miti e soleggiate, le mattine e le sere in collina sono fresche."),
    _buildCalendarRow("❌ Evitare", "In piena estate (luglio/agosto) se sognate paesaggi sfaccettati e ricchi di sfumature. In quel periodo la terra è mietuta, spoglia, arida e spesso bruciata dal sole."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Luce & Dinamica dei Paesaggi", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Autunno\n(Ideale Foto)", "Luce morbida per tutto il giorno. Nebbie spettacolari nelle vallate tra le 06:45 e le 08:30. Sfumature dorate e terra di Siena."),
      _buildTableRowData("Primavera\n(Alternativa)", "Valle rigogliosa ed esplosiva di fiori selvatici. Perfetta per una resa dinamica, fresca e contrastata sotto un cielo mutevole."),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Vigneti", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Le tenute vitivinicole rimangono aperte per le visite in autunno, generalmente dalle 10:00 alle 18:00. La prenotazione è vivamente consigliata.", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 12), softWrap: true)),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}