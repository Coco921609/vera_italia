import 'package:flutter/material.dart';

class RoccaCalascioPage extends StatelessWidget {
  const RoccaCalascioPage({super.key});

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
                  image: AssetImage('assets/ima/16.jpg'),
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
                    "ROCCA CALASCIO 🏰",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Un'atmosfera da cittadella scozzese o da Minas Tirith, versione sentinella d'Abruzzo 🏴󠁧󠁢󠁳󠁣󠁴󠁿🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Arroccata a 1.460 metri di altitudine nel cuore del Parco Nazionale del Gran Sasso, la Rocca di Calascio è una delle fortezze più alte e spettacolari d'Europa. Vera e propria icona dell'Italia medievale, questo nido d'aquila in pietra calcarea domina un paesaggio selvaggio e lunare di montagne a perdita d'occhio. Perfettamente integrata nella roccia, questa sentinella militare sembra fluttuare sul vuoto, offrendo un'immersione suggestiva nella storia dei grandi spazi italiani.",
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
                        _buildImageItem('assets/ima/18.webp'),
                        _buildImageItem('assets/ima/16.jpg'),
                        _buildImageItem('assets/ima/17.jpg'),
                        _buildImageItem('assets/ima/19.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("EPOPEA STORICA 📜"),
                  _buildContentBlock(
                      "Dalle origini medievali a Federico II",
                      "Menzionato già negli anni 1240 sotto il regno di Federico II, il sito è servito inizialmente come torre d'awistamento strategica per controllare le vie della transumanza. Gli scavi rivelano che il commercio della lana e l'allevamento ovino garantivano già un'occupazione stabile e prospera a questa quota elevata."
                  ),
                  _buildContentBlock(
                      "L'età d'oro: Dai Piccolomini ai Medici",
                      "È tra il XV e il XVI secolo che la fortezza assume il suo colossale aspetto attuale. La potente famiglia senese dei Piccolomini aggiunge alla torre originaria una cinta muraria affiancata da quattro imponenti torri circolari agli angoli. Nel 1579, i Medici di Toscana acquistano il territorio, aprendo un'era di grande ricchezza economica legata al commercio della lana."
                  ),
                  _buildContentBlock(
                      "Dal declino alla rinascita cinematografica",
                      "La cronica mancanza d'acqua (gli abitanti dipendevano esclusivamente da cisterne sotterranee) e l'abbandono del pastoralismo portano il borgo a un lungo declino nel XIX secolo. Lasciata in rovina, la fortezza viene riscoperta negli anni '80. La sua bellezza irreale e drammatica l'ha resa da allora la scenografia di culto di numerosi film cinematografici internazionali (come Ladyhawke o Il nome della rosa)."
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
                      "⚠️ Attenzione: A causa dell'altitudine elevata (1.460 m), le condizioni meteorologiche possono cambiare in modo drastico e improvviso. Portate sempre con voi una giacca antivento, anche in piena estate.",
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
      Icon(Icons.terrain, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Accesso alle rovine esterne: Gratuito e libero | Navetta paese-cittadella in alta stagione: ~2€",
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
    _buildCalendarRow("✅ Top", "Il tramonto. La luce radente sulle montagne circostanti e sulle pietre calcaree del castello offre un panorama assolutamente fiabesco."),
    _buildCalendarRow("🎒 Info", "L'accesso finale si effettua a piedi lungo un sentiero dal paese di Calascio. Scegliete buone scarpe da ginnastica o da trekking."),
    _buildCalendarRow("❌ Evitare", "Le giornate di tempesta o di fitta nebbia in inverno, poiché la salita può diventare pericolosa e la visibilità sulla valle è nulla."),
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
      _buildTableRowData("Di giorno", "Ideale per osservare l'architettura militare nei dettagli, la vicina chiesa di Santa Maria della Pietà e la grandezza selvaggia del parco nazionale."),
      _buildTableRowData("Crepuscolo", "L'istante magico in cui il silenzio avvolge gli Abruzzi e il castello assume sfumature dorate e mistiche al calar della sera."),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}