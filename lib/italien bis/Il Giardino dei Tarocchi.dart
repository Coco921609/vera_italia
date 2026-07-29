import 'package:flutter/material.dart';

class GiardinoDeiTarocchiPage extends StatelessWidget {
  const GiardinoDeiTarocchiPage({super.key});

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
                  image: AssetImage('assets/ima/22.webp'),
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
                    "GIARDINO DEI TAROCCHI 🃏",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Un'atmosfera da Parc Güell o palazzo surrealista, versione mosaico magico della Toscana 🇪🇸🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Ideato dall'artista geniale Niki de Saint Phalle dal 1978 fino alla sua morte nel 2002, il Giardino dei Tarocchi è un parco di sculture esoterico e fantastico situato a Capalbio. Ispirato alle carte dei 22 arcani maggiori, questo capolavoro monumentale ospita giganti in cemento ricoperti di mosaici scintillanti, ceramiche colorate, specchi e vetri pregiati. Un'avventura artistica e visiva unica al mondo, dove il sogno e la megalomania si uniscono sotto il sole toscano.",
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
                        _buildImageItem('assets/ima/22.webp'),
                        _buildImageItem('assets/ima/21.jpg'),
                        _buildImageItem('assets/ima/20.webp'),
                        _buildImageItem('assets/ima/24.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("SERVIZI & INFO SUL SITO ✨"),
                  const SizedBox(height: 15),
                  _buildServicesGrid(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("SCULTURE & SIMBOLI 📜"),
                  _buildContentBlock(
                      "I 22 Arcani Maggiori",
                      "Il parco è una trascrizione vivente del gioco dei Tarocchi. Ogni scultura gigante incarna una figura simbolica (L'Imperatrice, Il Mago, La Forza...) nella quale il visitatore può talvolta entrare, ripararsi o perdersi attraverso disorientanti giochi di specchi."
                  ),
                  _buildContentBlock(
                      "L'Arte del Mosaico e degli Specchi",
                      "Niki de Saint Phalle ha assemblato a mano migliaia di frammenti di vetro pregiato e mosaici dai colori vivaci. Le superfici riflettenti catturano la luce naturale per ridisegnare il paesaggio circostante con il passare delle ore."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("TARIFFE DEI BIGLIETTI 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("APERTURA & ORARI ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Attenzione: I prezzi e gli orari possono variare nel corso dell'anno. I biglietti acquistati online non sono né sostituibili né rimborsabili (anche in caso di pioggia, poiché il parco rimane aperto).",
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
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("• Biglietto Intero: 15,00 €", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold), softWrap: true),
        SizedBox(height: 5),
        Text("• Biglietto Ridotto: 10,00 € (7-22 anni, over 65, residenti Capalbio, gruppi da 25 persone)", style: TextStyle(color: Colors.white70, fontSize: 13), softWrap: true),
        SizedBox(height: 5),
        Text("• Scuole: 8,00 € per studente (gruppi di almeno 10 studenti)", style: TextStyle(color: Colors.white70, fontSize: 13), softWrap: true),
        SizedBox(height: 5),
        Text("• Gratuito: 0-6 anni, persone con disabilità (superiore al 67%) e accompagnatore.", style: TextStyle(color: Colors.white70, fontSize: 13), softWrap: true),
        SizedBox(height: 8),
        Text("⚠️ Documento giustificativo obbligatorio all'ingresso per le tariffe ridotte/gratuite.", style: TextStyle(color: Colors.orangeAccent, fontSize: 12, fontWeight: FontWeight.bold), softWrap: true),
      ],
    ),
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

  Widget _buildServicesGrid() => Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(12)),
    child: const Column(
      children: [
        Row(children: [Icon(Icons.schedule, color: Color(0xFFFFD700)), SizedBox(width: 10), Expanded(child: Text("Durata della visita: ~1h30m (Percorso senza guida)", style: TextStyle(color: Colors.white70), softWrap: true))]),
        SizedBox(height: 8),
        Row(children: [Icon(Icons.local_parking, color: Colors.greenAccent), SizedBox(width: 10), Expanded(child: Text("Parcheggio gratuito e non custodito", style: TextStyle(color: Colors.white70), softWrap: true))]),
        SizedBox(height: 8),
        Row(children: [Icon(Icons.pets, color: Colors.amberAccent), SizedBox(width: 10), Expanded(child: Text("Animali ammessi (cani tenuti al guinzaglio)", style: TextStyle(color: Colors.white70), softWrap: true))]),
        SizedBox(height: 8),
        Row(children: [Icon(Icons.accessible, color: Colors.lightBlueAccent), SizedBox(width: 10), Expanded(child: Text("Accessibilità parziale", style: TextStyle(color: Colors.white70), softWrap: true))]),
        SizedBox(height: 8),
        Row(children: [Icon(Icons.menu_book, color: Colors.white), SizedBox(width: 10), Expanded(child: Text("Libreria (Bookshop) & Caffetteria all'interno", style: TextStyle(color: Colors.white70), softWrap: true))]),
        SizedBox(height: 8),
        Row(children: [Icon(Icons.smoke_free, color: Colors.redAccent), SizedBox(width: 10), Expanded(child: Text("Divieto di fumo nel parco", style: TextStyle(color: Colors.white70), softWrap: true))]),
      ],
    ),
  );

  Widget _buildCalendarSection() => Column(children: [
    const SizedBox(height: 5),
    _buildCalendarRow("✅ Prenotazione", "Solo l'acquisto online garantisce l'ingresso al Giardino. Il numero di visitatori giornalieri è strettamente limitato per preservare le opere."),
    _buildCalendarRow("🎒 Info", "Nessuna visita guidata o privata è offerta dalla struttura. La scoperta avviene liberamente al vostro ritmo."),
    _buildCalendarRow("❌ Importante", "I biglietti sono validi solo per la data e l'ora selezionate. L'accesso può essere rifiutato in caso di ritardo o errore di giorno."),
  ]);

  Widget _buildCalendarRow(String status, String info) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 85, child: Text(status, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Periodo / Giorni", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Orari di Apertura", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Dal 1° aprile\nal 15 ottobre", "Tutti i giorni: 14:30 - 19:30"),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Ingresso", style: TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Ultimo ingresso consentito alle 18:15. Il giardino rimane aperto nei giorni festivi e di pioggia.", style: TextStyle(color: Colors.white70, fontSize: 13), softWrap: true)),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}