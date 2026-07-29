import 'package:flutter/material.dart';

class FurorePage extends StatelessWidget {
  const FurorePage({super.key});

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
                  image: AssetImage('assets/imag/20.jpg'), // Remplace par ton image principale
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
                      "FIORDO DI FURORE 🌊",
                      style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2)
                  ),
                  const SizedBox(height: 10),
                  const Text(
                      "Un air de Mostar en Bosnie, située dans un fjord italien de la côte amalfitaine 🇧🇦🇮🇹",
                      style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Furore est un joyau caché de la côte amalfitaine, célèbre pour son fjord spectaculaire creusé par la roche. Enjambé par un pont suspendu monumental haut de 30 mètres, ce bras de mer abrite une minuscule plage secrète et d'anciennes maisons de pêcheurs. C'est un décor de carte postale saisissant qui rappelle la gorge rocheuse de Mostar, mariant l'immensité de la falaise à la douceur de la mer Méditerranée.",
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
                        _buildImageItem('assets/imag/15.webp'),
                        _buildImageItem('assets/imag/17.jpg'),
                        _buildImageItem('assets/imag/20.jpg'),
                        _buildImageItem('assets/imag/19.webp'),
                        _buildImageItem('assets/imag/18.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("INCONTOURNABLES & EXPÉRIENCES 🏊‍♂️"),
                  _buildContentBlock(
                      "La Plage du Fjord (Baignade Autorisée)",
                      "La baignade est entièrement autorisée et gratuite dans le fjord ! L'eau y est d'une clarté exceptionnelle et protégée du vent par les immenses falaises. L'accès se fait à pied par un escalier de pierre depuis le pont principal."
                  ),
                  _buildContentBlock(
                      "Le Pont Suspendu & Le Plongeon",
                      "Le pont routier qui surplombe le fjord offre un panorama vertigineux. C'est ici que se déroule chaque année le championnat international de plongeon de haut vol, où les athlètes sautent à plus de 28 mètres de haut."
                  ),
                  _buildContentBlock(
                      "Le Village Peint 'Il Paese Dipinto'",
                      "Furore est aussi appelé le 'village qui n'existe pas' car ses maisons sont dispersées sur la falaise. En remontant les sentiers, découvrez les magnifiques fresques murales peintes directement sur les façades."
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("TARIFS & CONSEILS PRATIQUES 💡"),
                  const SizedBox(height: 15),
                  _buildPriceSection(),
                  const SizedBox(height: 15),
                  _buildCalendarSection(),

                  const SizedBox(height: 30),
                  _buildSectionTitle("ACCÈS & INFOS D'OUVERTURE ⏰"),
                  const SizedBox(height: 15),
                  _buildHoursTable(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "⚠️ Attention : La plage est très étroite et le soleil s'y cache rapidement en milieu d'après-midi à cause des falaises. Il n'y a aucun parking à proximité immédiate, l'accès en bus ou en scooter est vivement recommandé.",
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
      Icon(Icons.euro_symbol, color: Colors.greenAccent),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          "Accès Plage : Gratuit | Baignade : Libre et autorisée | Transats : Aucun (Plage sauvage)",
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
    _buildCalendarRow("✅ Top", "Arriver tôt le matin (entre 9h et 12h) pour avoir de la place sur les galets et profiter du soleil direct."),
    _buildCalendarRow("🎒 Info", "Prévoyez des chaussures d'eau, car la plage est composée de galets et l'accès à l'eau peut être glissant."),
    _buildCalendarRow("❌ Éviter", "Venir en voiture. Il est impossible de se garer sur le pont. Prenez le bus SITA (Arrêt Furore Fiordo)."),
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
      0: FlexColumnWidth(1.3),
      1: FlexColumnWidth(2.7),
    },
    border: TableBorder.all(color: Colors.white24),
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Période", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Accessibilité / Horaires", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ]),
      _buildTableRowData("Mai - Octobre\n(Saison Idéale)", "Accès libre 24h/24. Idéal pour la baignade. Escalier ouvert."),
      _buildTableRowData("Novembre - Avril\n(Basse Saison)", "Accès libre, mais baignade très fraîche. Attention aux jours de tempête (accès aux escaliers parfois fermé par sécurité)."),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Sécurité", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Plage non surveillée. Surveillez l'état de la mer avant de sauter ou de vous baigner loin du bord.", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 12), softWrap: true)),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70))),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70), softWrap: true)),
  ]);
}