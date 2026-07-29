import 'package:flutter/material.dart';

class ScalaDeiTurchiPage extends StatelessWidget {
  const ScalaDeiTurchiPage({super.key});

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
                  image: AssetImage('assets/ima/15.webp'), // Remplace par ton image principale
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
                    "SCALA DEI TURCHI 🌊",
                    style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Un air de falaises blanches de Pamukkale, version majesté calcaire de la Sicile 🇹🇷🇮🇹",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Taillée par le vent et les vagues dans une marne d'un blanc pur et aveuglant, la Scala dei Turchi (l'Escalier des Turcs) est une falaise monumentale en forme d'escalier naturel qui plonge fièrement dans les eaux émeraude de la côte d'Agrigente en Sicile. Ce monument naturel unique doit son nom aux vagues successives de pirates sarrasins qui y trouvaient autrefois un abri idéal pour accoster. C'est un paysage grandiose et irréel où le blanc immaculé de la roche s'oppose magistralement au bleu profond de la Méditerranée.",
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
                        _buildImageItem('assets/ima/15.webp'),
                        _buildImageItem('assets/ima/12.jpg'),
                        _buildImageItem('assets/ima/14.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("LUMIÈRES & PANORAMAS ✨"),
                  _buildContentBlock(
                      "Restez jusqu’au coucher du soleil",
                      "Le coucher de soleil sur la Scala dei Turchi est assez spectaculaire, surtout en grimpant sur la falaise, qui offre un beau point de vue vers l’ouest. Faites donc en sorte d’y être au moins pour la fin de journée pour admirer le spectacle. Notez bien que l’on ne peut pas monter sur la falaise après 19 h, mais le coucher de soleil est très beau également au pied de celle-ci."
                  ),
                  _buildContentBlock(
                      "Les Escaliers de Marne Blanche",
                      "La structure en gradins naturels de la falaise permet une immersion visuelle saisissante. La marne, une roche sédimentaire argilo-calcaire, reste fraîche sous les pieds, offrant une sensation de marche sur un glacier chaud sous le soleil sicilien."
                  ),
                  _buildContentBlock(
                      "Les Plages de Sable Fin adjacentes",
                      "De part et d'autre du promontoire blanc se déploient de longues bandes de sable doré. Idéales pour la baignade, elles permettent d'observer la falaise avec un recul exceptionnel, accentuant le contraste des couleurs."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("TARIFS & CONDITIONS D'ACCÈS 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("ACCÈS & DYNAMIQUE ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Attention : Les prix et horaires peuvent changer au cours de l'année. Les réglementations locales visant à protéger la marne de l'érosion sont strictes, respectez les balisages.",
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
      Icon(Icons.credit_card, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Entrée Falaise : 6 € par personne | Achat uniquement par carte bancaire au guichet",
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
    _buildCalendarRow("✅ Top", "En fin d'après-midi, pour capter la couleur dorée que prend la roche blanche lorsque le soleil descend sur l'horizon ouest."),
    _buildCalendarRow("🎒 Info", "Le guichet se trouve directement à l'entrée du sentier menant à la falaise. Les espèces ne sont pas acceptées pour le paiement."),
    _buildCalendarRow("❌ Éviter", "D'arriver après 19 h si vous souhaitez monter en altitude, car les accès à la structure supérieure de la falaise ferment."),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Zone", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Horaires d'Ouverture & Règles", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), softWrap: true)),
      ]),
      _buildTableRowData("Accès Falaise", "10 h à 19 h (Dernière montée autorisée sur la structure calcaire à 19 h)."),
      _buildTableRowData("Pied de Falaise", "Accès libre en soirée pour admirer le coucher de soleil depuis la plage inférieure."),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70), softWrap: true)),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}