import 'package:flutter/material.dart';
import 'package:uhamka_mobile/model/KegiatanMahasiswa.dart';
import 'package:uhamka_mobile/services/KegiatanMahasiswaService.dart';

class KegiatanMahasiswaPage extends StatefulWidget {
  static String tag = 'kegiatan-mahasiswa-page';
  @override
  _KegiatanMahasiswaPageState createState() => _KegiatanMahasiswaPageState();
}

class _KegiatanMahasiswaPageState extends State<KegiatanMahasiswaPage> {
  KegiatanMahasiswaService kegiatanMahasiswaService;

  @override
  void initState() {
    super.initState();
    kegiatanMahasiswaService = KegiatanMahasiswaService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kegiatan Mahasiswa'),
          actions: <Widget>[],
        ),
        body: FutureBuilder(
          future: kegiatanMahasiswaService.getAllKegiatanMhs(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? KegiatanMahasiswaListView(
                    kgtn: snapshot.data,
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ));
  }
}

class KegiatanMahasiswaListView extends StatelessWidget {
  final List<KegiatanMahasiswa> kgtn;
  const KegiatanMahasiswaListView({Key key, this.kgtn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kgtn == null ? 0 : kgtn.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            child: ListTile(
              title: Text(kgtn[index].jenis + '\n' + kgtn[index].desc),
              leading: Icon(Icons.image),
              subtitle: Text(kgtn[index].type),
            ),
          ),
        );
      },
    );
  }
}
