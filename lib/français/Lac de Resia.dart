import 'package:flutter/material.dart';

class LacDeResiaPage extends StatelessWidget {
  const LacDeResiaPage({super.key});

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
                  image: AssetImage('assets/images/2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("LAC DE RESIA 🏔️", style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 2)),
                  const SizedBox(height: 10),
                  const Text("Un air de lac de Bled, Slovénie, version italienne 🇸🇮🇮🇹", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  const Text(
                    "Au cœur du Trentin-Haut-Adige, le lac de Resia subjugue par son clocher mystérieux émergeant des eaux, vestige tragique d'un village englouti en 1950. Entre paysages alpins grandioses et récits historiques, ce site est un sanctuaire pour les passionnés de photographie et d'histoire. Aujourd'hui, ce joyau propose des visites guidées poignantes, des activités nautiques et des randonnées panoramiques inoubliables.",
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
                        _buildImageItem('assets/images/3.jpeg'),
                        _buildImageItem('assets/images/4.jpg'),
                        _buildImageItem('assets/images/5.jpg'),
                        _buildImageItem('assets/images/6.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("UN PEU D'HISTOIRE 📜"),
                  _buildContentBlock("La création du réservoir", "En 1950, la vallée est transformée pour produire de l'énergie. La fusion de plusieurs lacs naturels engloutit le village antique de Graun, forçant les habitants à l'exil."),
                  _buildContentBlock("Un clocher solitaire", "Vestige du XIVe siècle, ce clocher est tout ce qui survit de l'église originelle. Il se dresse aujourd'hui comme un monument poignant, témoin silencieux d'un passé immergé."),
                  _buildContentBlock("Un patrimoine préservé", "Le lac est désormais un lieu de mémoire. Des visites guidées permettent de découvrir la profondeur de ce site où beauté naturelle et récits captivants s'entremêlent."),

                  const SizedBox(height: 30),
                  _buildSectionTitle("CONSEILS PRATIQUES 💡"),
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
                    child: Text("⚠️ Attention : les horaires peuvent changer au cours de l'année.", style: TextStyle(color: Colors.white30, fontSize: 12)),
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
    child: const Row(children: [Icon(Icons.euro_symbol, color: Colors.greenAccent), SizedBox(width: 10), Expanded(child: Text("Accès au site : Gratuit", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)))]),
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
    _buildCalendarRow("✅ Top", "Automne (couleurs) & Printemps"),
    _buildCalendarRow("☀️ Ok", "Été (venez tôt pour éviter la chaleur)"),
    _buildCalendarRow("❌ Fermé", "Hiver (fermeture climatique)"),
  ]);

  Widget _buildCalendarRow(String status, String info) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 70, child: Text(status, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        Expanded(child: Text(info, style: const TextStyle(color: Colors.white70, height: 1.3), softWrap: true)),
      ],
    ),
  );

  Widget _buildHoursTable() => Table(
    columnWidths: const {
      0: FlexColumnWidth(1.2),
      1: FlexColumnWidth(1.2),
      2: FlexColumnWidth(1.6),
    },
    border: TableBorder.all(color: Colors.white24),
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Dates", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Horaires", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Dernière adm.", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ]),
      _buildTableRowData("Avril - Juin", "09:00-19:00", "18:30"),
      _buildTableRowData("Juillet - Août", "08:00-20:00", "19:30"),
      _buildTableRowData("Sept - Oct", "09:00-18:00", "17:30"),
      _buildTableRowData("Nov - Mars", "Fermé", "-"),
      const TableRow(children: [
        Padding(padding: EdgeInsets.all(10.0), child: Text("Foule", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Privilégiez avant 09h ou après 17h", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 12))),
        Padding(padding: EdgeInsets.all(10.0), child: Text("Surtout Été", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 12))),
      ]),
    ],
  );

  TableRow _buildTableRowData(String p, String h, String da) => TableRow(children: [
    Padding(padding: const EdgeInsets.all(10.0), child: Text(p, style: const TextStyle(color: Colors.white70))),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(h, style: const TextStyle(color: Colors.white70))),
    Padding(padding: const EdgeInsets.all(10.0), child: Text(da, style: const TextStyle(color: Colors.white70))),
  ]);
}