import 'package:flutter/material.dart';

class Entry {
  final String title;
  final List<Entry> children;

  Entry(this.title, [this.children = const <Entry>[]]);
}

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return Container(
      child: ExpansionTile(
        key: PageStorageKey<Entry>(root),
        title: Text(
          root.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        children: root.children.map<Widget>(_buildTiles).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

final List<Entry> data = <Entry>[
  Entry(
    'Visi',
    <Entry>[
      Entry(
          'Merealisasikan HIMA TI UHAMKA yang bergerak aktif dan inovatif dibidang akademik dan non akademik secara internal maupun eksternal.'),
    ],
  ),
  Entry(
    'Misi',
    <Entry>[
      Entry(
          '1. Merealisasikan HIMA TI UHAMKA yang bergerak aktif dan inovatif dibidang akademik dan non akademik secara internal maupun eksternal.'),
      Entry(
          '2. Mengembangkan dan Menyalurkan potensi mahasiswa Teknik Informatika dibidang akademik dan non akademik.'),
      Entry('3. Membuat suasana nyaman dan rasa memiliki atas HIMA TI UHAMKA.'),
      Entry('4. Meningkatkan etos kerja dalam mencapai visi dan misi'),
    ],
  ),
];

class VisiMisiPage extends StatelessWidget {
  static String tag = 'visi-misi-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visi & Misi'),
      ),
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/logo-hima-uhamka.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
          ),
        ),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              EntryItem(data[index]),
          itemCount: data.length,
        ),
      ),
    );
  }
}
