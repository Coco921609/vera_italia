import 'package:flutter/material.dart';

class AlberobelloPage extends StatelessWidget {
  const AlberobelloPage({super.key});

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
                  image: AssetImage('assets/ima/33.jpg'), // Remplace par ton image principale
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
                      "ALBEROBELLO 🛖",
                      style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2)
                  ),
                  const SizedBox(height: 10),
                  const Text(
                      "Un air de village de Hobbits ou d'oasis fantastique, version architecture vernaculaire des Pouilles 🇳🇿🇮🇹",
                      style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Inscrit au patrimoine mondial de l'UNESCO, le cœur historique d'Alberobello offre un spectacle architectural unique au monde. Célèbre pour ses 'Trulli' — de petites maisons de pierre calcaire blanchies à la chaux et coiffées de toits coniques gris faits de dalles posées à sec —, la ville s'apparente à un conte de fées grandeur nature. Flâner dans ses ruelles escarpées, bordées de façades immaculées ornées de symboles mystiques peints à la main, est une véritable plongée dans l'ingéniosité et les traditions secrètes du sud de l'Italie.",
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
                        _buildImageItem('assets/ima/31.jpg'),
                        _buildImageItem('assets/ima/32.jpg'),
                        _buildImageItem('assets/ima/33.jpg'),
                        _buildImageItem('assets/ima/34.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("LES QUARTIERS HISTORIQUES 📜"),
                  _buildContentBlock(
                      "Rione Monti : Le Cœur Vivant",
                      "Le quartier le plus célèbre et touristique de la ville, étalé sur une colline. Il compte plus de 1 000 trulli abritant aujourd'hui des échoppes d'artisans locaux, des tisseurs de lin et des terrasses panoramiques d'où l'on peut admirer une véritable mer de toits coniques."
                  ),
                  _buildContentBlock(
                      "Rione Aia Piccola : L'Authenticité Préservée",
                      "Moins fréquenté et purement résidentiel, ce quartier offre une immersion paisible dans la vie quotidienne locale. Les ruelles y sont plus calmes, préservant l'atmosphère d'origine de la cité et permettant de comprendre le mode de vie traditionnel à l'intérieur de ces structures de pierre."
                  ),
                  _buildContentBlock(
                      "Le Trullo Sovrano et l'Église Saint-Antoine",
                      "Alberobello pousse l'architecture des trulli à son paroxysme avec le Trullo Sovrano, le seul édifice de ce type construit sur deux étages, et l'église Saint-Antoine de Padoue, unique temple au monde reproduisant les formes coniques de l'architecture vernaculaire locale."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("CONSEILS PRATIQUES & SENSATIONS 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("RECOMMANDATIONS DE VISITE ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Attention : Alberobello est une destination extrêmement prisée en été. En haute saison, les ruelles du Rione Monti se saturent dès 10h00 du matin. Privilégiez une visite matinale ou nocturne.",
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

  Widget _buildSectionTitle(String title) => Text(title, style: const TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, fontSize: 18));

  Widget _buildContentBlock(String title, String body) => Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
      const SizedBox(height: 5),
      Text(body, style: const TextStyle(color: Colors.white60, height: 1.5), softWrap: true),
    ]),
  );

  Widget _buildPriceSection() => Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(12)),
    child: const Row(children: [
      Icon(Icons.house_siding, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Accès aux quartiers historiques : Gratuit et libre | Entrée Trullo Sovrano : Muséographie ~2€",
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
    _buildCalendarRow("✅ Top", "Le lever du jour ou la fin d'après-midi, lorsque la pierre calcaire reflète une lumière douce et que les ombres des toits coniques s'étirent sur les ruelles blanchies."),
    _buildCalendarRow("🎒 Info", "Levez les yeux : les toits des trulli arborent souvent des symboles d'origine païenne, chrétienne ou magique, peints pour protéger les foyers du mauvais œil."),
    _buildCalendarRow("❌ Éviter", "Le créneau 11h00 - 15h00 en plein mois d'août, car la chaleur y est écrasante sur la pierre blanche et la densité touristique y atteint son maximum."),
  ]);

  Widget _buildCalendarRow(String status, String info) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 70, child: Text(status, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
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
        Padding(padding: EdgeInsets.all(10.0), child: Text("Moment", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Ambiance & Visibilité", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ]),
      _buildTableRowData("Matinée", "Atmosphère sereine et idéale pour la photographie. Les résidents s'activent calmement avant l'afflux touristique."),
      _buildTableRowData("Nocturne", "Les trulli s'illuminent sous les éclairages publics. L'ambiance devient magique, presque irréelle, idéale pour une promenade fraîche."),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70))),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}