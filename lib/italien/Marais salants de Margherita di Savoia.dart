import 'package:flutter/material.dart';

class MaraisSalantsPage extends StatelessWidget {
  const MaraisSalantsPage({super.key});

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
                  image: AssetImage('assets/images/25.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("SALINE DI MARGHERITA DI SAVOIA  🦩", style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2)),
                  const SizedBox(height: 10),
                  const Text("Un tocco delle saline di Aigues-Mortes, in una versione italiana gigante 🇫🇷🇮🇹", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  const Text(
                    "Considerate le più grandi d'Europa, le saline di Margherita di Savoia sono una meraviglia naturale che si estende per 20 km lungo la costa adriatica. Coprendo 4.500 ettari nel cuore della Puglia, questa riserva naturale protetta produce circa 500.000 tonnellate di sale marino ogni anno. È un sito spettacolare che attira viaggiatori, fotografi e birdwatcher da tutto il mondo grazie alla sua incredibile biodiversità.",
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
                      children: [
                        _buildImageItem('assets/images/21.jpg'),
                        _buildImageItem('assets/images/23.jpg'),
                        _buildImageItem('assets/images/26.jpg'),
                        _buildImageItem('assets/images/22.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("CENNI STORICI 📜"),
                  _buildContentBlock("Origini Preistoriche e Antiche", "Fin dall'età del bronzo, il sale si formava spontaneamente nella laguna del lago Salpi. Serbatoi in pietra di quest'epoca testimoniano ancora il drenaggio dei minerali. I Romani sfruttavano già attivamente questo prezioso tesoro nel loro insediamento chiamato 'Salinis'."),
                  _buildContentBlock("Trasformazione del Sito", "Sotto il dominio reale, il sito fu chiamato 'Regie Saline'. Nel XVIII secolo, fu scavata una seconda apertura verso il mare per purificare le acque stagnanti del Pantano, ponendo le basi per gli impianti moderni. Nel 1879, la città fu rinominata Margherita di Savoia in onore della regina."),
                  _buildContentBlock("Perla Ecologica del Sud", "Dichiarata zona umida di importanza internazionale (Convenzione di Ramsar), la salina è oggi la più grande riserva animale dell'Italia centro-meridionale. Ospita ogni anno tra i 20.000 e i 50.000 uccelli migratori, inclusi i maestosi fenicotteri rosa."),

                  const SizedBox(height: 30),
                  _buildSectionTitle("CONSIGLI PRATICI 💡"),
                  const SizedBox(height: 15),
                  _buildReservationBanner(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("PRENOTAZIONI E CONTATTI 📞"),
                  const SizedBox(height: 15),
                  _buildContactTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Text("⚠️ Nota: Gli orari esatti per la visita guidata saranno concordati telefonicamente.", style: TextStyle(color: Colors.white30, fontSize: 12)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) => Text(title, style: const TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, fontSize: 18));

  Widget _buildContentBlock(String title, String body) => Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
      const SizedBox(height: 5),
      Text(body, style: const TextStyle(color: Colors.white60, height: 1.5), softWrap: true),
    ]),
  );

  Widget _buildReservationBanner() => Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(12)),
    child: const Row(children: [
      Icon(Icons.lock_outline, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
            "Accesso solo tramite prenotazione ufficiale",
            style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)
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
        fit: BoxFit.contain,
      ),
    ),
  );

  Widget _buildCalendarSection() => Column(children: [
    _buildCalendarRow("✅ Ottimale", "Primavera e Autunno (ideale per il birdwatching)"),
    _buildCalendarRow("☀️ Ok", "Estate (stagione di raccolta, ma molto caldo)"),
    _buildCalendarRow("❌ Evitare", "Inverno (minore attività di uccelli migratori)"),
  ]);

  Widget _buildCalendarRow(String status, String info) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 70, child: Text(status, style: const TextStyle(color: Colors.white))),
        Expanded(child: Text(info, style: const TextStyle(color: Colors.white70), softWrap: true))
      ],
    ),
  );

  Widget _buildContactTable() => Table(
    columnWidths: const {
      0: FlexColumnWidth(1.1),
      1: FlexColumnWidth(2.9),
    },
    border: TableBorder.all(color: Colors.white24),
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Canale", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Info Ufficiali", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ]),
      _buildTableRowData("Sito Web", "www.infosalina.it"),
      _buildTableRowData("Chiamate", "Solo orario d'ufficio"),
      _buildTableRowData("Visite", "Da concordare telefonicamente"),
    ],
  );

  TableRow _buildTableRowData(String label, String value) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(label, style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.w500))),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
  ]);
}