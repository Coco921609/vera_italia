import 'package:flutter/material.dart';

class GrottesCastellanaPage extends StatelessWidget {
  const GrottesCastellanaPage({super.key});

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
                  image: AssetImage('assets/ima/38.jpg'),
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
                    "GROTTE DI CASTELLANA 🕳️",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Un'atmosfera da abisso di Padirac o da antro di Moria, versione cattedrale sotterranea della Puglia 🇫🇷🇳🇿🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Situate ai margini della Valle d'Itria, le Grotte di Castellana costituiscono uno dei complessi speleologici più vasti e spettacolari d'Italia. A oltre 60 metri di profondità, questa rete di gallerie svela un labirinto di stalattiti cristalline, stalagmiti monumentali, canyon e profondi inghiottitoi modellati dall'acqua nel corso di milioni di anni. Il punto culminante dell'esplorazione è la Grotta Bianca, celebrata in tutto il mondo dagli speleologi come la cavità sotterranea più luminosa e pura del pianeta.",
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
                        _buildImageItem('assets/ima/36.webp'),
                        _buildImageItem('assets/ima/35.jpg'),
                        _buildImageItem('assets/ima/37.webp'),
                        _buildImageItem('assets/ima/38.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("I PERCORSI DI ESPLORAZIONE 📜"),
                  _buildContentBlock(
                      "Itinerario Completo: L'Immersione Totale",
                      "Un percorso eccezionale di 3 chilometri (andata e ritorno) della durata di circa 100 minuti. Vi condurrà attraverso le sale più belle del complesso fino alla leggendaria Grotta Bianca, un gioiello d'alabastro scintillante di una purezza ineguagliabile."
                  ),
                  _buildContentBlock(
                      "Itinerario Parziale: La Scoperta Express",
                      "Dalla lunghezza di circa 1 chilometro per una durata di 50 minuti, questo tracciato più breve permette di ammirare la maestosa Grave, la prima ed enorme caverna naturale della rete, ideale per chi dispone di poco tempo."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("SERVIZI & INFO SUL SITO ✨"),
                  const SizedBox(height: 15),
                  _buildServicesGrid(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("TARIFFE DEI BIGLIETTI (IN BIGLIETTERIA) 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("ORGANIZZAZIONE DEI TOUR ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Attenzione: La temperatura all'interno delle grotte è costante tutto l'anno a circa 16,5°C con un elevato tasso di umidità. Prevedete un maglione o una giacca e scarpe chiuse antiscivolo. I prezzi possono variare nel corso dell'anno.",
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
        Text("• Biglietto Intero (Dai 15 anni):", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold), softWrap: true),
        Text("  - Visita Completa: 25 € | Visita Parziale: 22 €", style: TextStyle(color: Colors.white70, fontSize: 13), softWrap: true),
        SizedBox(height: 5),
        Text("• Biglietto Ridotto (da 6 a 14 anni):", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold), softWrap: true),
        Text("  - Visita Completa: 22 € | Visita Parziale: 19 €", style: TextStyle(color: Colors.white70, fontSize: 13), softWrap: true),
        SizedBox(height: 5),
        Text("• Gratuito: Bambini fino a 5 anni compiuti.", style: TextStyle(color: Colors.white70, fontSize: 13), softWrap: true),
        SizedBox(height: 8),
        Text("💎 Esclusiva Online: Biglietto Famiglia a 61 €", style: TextStyle(color: Color(0xFFFFD700), fontSize: 14, fontWeight: FontWeight.bold), softWrap: true),
        Text("Valido per 2 adulti + 2 bambini (6-14 anni). Costi di prenotazione inclusi. Non disponibile presso le biglietterie fisiche.", style: TextStyle(color: Colors.white60, fontSize: 12), softWrap: true),
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
        Row(children: [Icon(Icons.child_friendly, color: Colors.greenAccent), SizedBox(width: 10), Expanded(child: Text("Noleggio marsupi per neonati gratuito (passeggini vietati)", style: TextStyle(color: Colors.white70), softWrap: true))]),
        SizedBox(height: 8),
        Row(children: [Icon(Icons.local_parking, color: Colors.lightBlueAccent), SizedBox(width: 10), Expanded(child: Text("Parcheggio a pagamento P1 situato nelle immediate vicinanze dell'area", style: TextStyle(color: Colors.white70), softWrap: true))]),
        SizedBox(height: 8),
        Row(children: [Icon(Icons.wc, color: Colors.amberAccent), SizedBox(width: 10), Expanded(child: Text("Servizi igienici a pagamento vicini alla biglietteria (pulizia continua)", style: TextStyle(color: Colors.white70), softWrap: true))]),
      ],
    ),
  );

  Widget _buildCalendarSection() => Column(children: [
    const SizedBox(height: 5),
    _buildCalendarRow("✅ Prenotazione", "Si consiglia vivamente di acquistare i biglietti online al più tardi il giorno prima della visita per assicurarvi la fascia oraria ed evitare le code."),
    _buildCalendarRow("🎒 Accesso", "Il biglietto digitale ricevuto via e-mail vi permette di recarvi direttamente ai tornelli. Arrivate almeno 15 minuti prima dell'inizio del tour."),
    _buildCalendarRow("❌ Biglietteria", "I biglietti venduti sul posto il giorno stesso dipendono strettamente dai posti rimasti. È impossibile acquistare in biglietteria per i giorni successivi."),
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
      0: FlexColumnWidth(1.4),
      1: FlexColumnWidth(2.6),
    },
    border: TableBorder.all(color: Colors.white24),
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Tipo di itinerario", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Distanza, Durata e Specifiche", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Completo 🚶", "3 chilometri | ~100 minuti\nEsplora l'intera rete sotterranea fino alla meravigliosa Grotta Bianca."),
      _buildTableRowData("Parziale 🧭", "1 chilometro | ~50 minuti\nSi concentra sulle prime gallerie e sull'enorme caverna iniziale (La Grave)."),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}