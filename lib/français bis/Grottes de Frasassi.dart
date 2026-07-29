import 'package:flutter/material.dart';

class GrottesDeFrasassiPage extends StatelessWidget {
  const GrottesDeFrasassiPage({super.key});

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
                  image: AssetImage('assets/imag/9.jpg'),
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
                    "GROTTE DE FRASASSI 🦇",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Un air de gigantesques grottes de Carlsbad aux États-Unis 🇺🇸🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Situées au cœur des Apennins dans la région des Marches, les Grottes de Frasassi offrent l'un des spectacles souterrains les plus époustouflants de la planète. Ce royaume figé dans le temps dévoile un ballet magique de stalactites majestueuses, de stalagmites géantes et de cascades de cristaux. Au fil de ce parcours surréaliste, vous plongerez dans un écosystème préservé depuis des millions d'années. C'est un véritable chef-d'œuvre naturel où l'eau continue, goutte après goutte, de sculpter d'incroyables architectures dans un silence absolu.",
                    style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
                    softWrap: true,
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("APERÇU 📸"),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        _buildImageItem('assets/imag/5.jpg'),
                        _buildImageItem('assets/imag/6.jpg'),
                        _buildImageItem('assets/imag/8.jpg'),
                        _buildImageItem('assets/imag/10.jpg'),
                        _buildImageItem('assets/imag/9.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("VISITES & PARCOURS SPÉLÉOLOGIQUES 🪖"),
                  _buildContentBlock(
                      "Visite Classique",
                      "Un parcours accessible à tous pour admirer les salles grandioses et les concrétions impressionnantes. Réservation en ligne fortement recommandée pour éviter l'attente au parking San Vittore."
                  ),
                  _buildContentBlock(
                      "Parcours Bleu (Durée : ~2h | 40€)",
                      "Une première approche de la spéléologie. Le billet inclut la visite avec des guides spécialisés et la fourniture de tout l'équipement nécessaire. Réservation obligatoire par téléphone ou email."
                  ),
                  _buildContentBlock(
                      "Parcours Rouge (Durée : ~3h | 50€)",
                      "Pour les plus aventuriers, ce parcours plus long et technique permet d'explorer les profondeurs cachées de la grotte. Matériel et guides inclus."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("TARIFS & CONSEILS PRATIQUES 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("HORAIRES D'OUVERTURE ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Attention : Arrivez au parking San Vittore 15 min avant l'heure du billet (30 min si retrait de gratuité). Navette incluse. Les horaires et tarifs sont susceptibles de varier. Fermé le 4 déc, 25 déc et du 7 au 30 janvier.",
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
          "Plein: 20€ | Réduit: 18€ | Jeunes (6-14): 14€ | Gratuit: -6 ans & PMR",
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
    _buildCalendarRow("✅ Top", "Achat en ligne sur tickets.frasassi.com pour éviter la file d'attente. Le billet numérique est accepté."),
    _buildCalendarRow("🎒 Info", "Le service de navette depuis le parking de San Vittore delle Chiuse est gratuit et inclus."),
    _buildCalendarRow("❌ Éviter", "Se présenter sans réservation en plein été (juin à septembre), risque d'attente prolongée."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Période", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Plages horaires (Générales)", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Hiver\n(Nov - Fév)", "En semaine : 11:30, 15:30\nWeek-ends/Fériés : 10:00, 11:00, 12:00, 14:30, 16:00, 17:00"),
      _buildTableRowData("Printemps /\nAutomne", "Tous les jours : 10:00, 11:00, 12:00, 14:30, 16:00, 17:00"),
      _buildTableRowData("Été\n(7 Juin - 14 Sept)", "Entrées échelonnées toutes les 10/20/30 min selon l'affluence. (Billetterie 9h30-17h00)"),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Anglais", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Visites en anglais tous les jours à 11:40, 13:40 et 15:40", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 12), softWrap: true)),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}