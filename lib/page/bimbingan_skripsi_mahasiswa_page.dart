import 'dart:io';

import 'package:flutter/material.dart';
import 'package:uhamka_mobile/model/Bimbingan.dart';
import 'package:uhamka_mobile/services/BimbinganService.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';

class BimbinganSkripsiMahasiswaPage extends StatefulWidget {
  static String tag = 'bimbingan-skripsi-mahasiswa-page';
  final BimbinganDataSource _bimbinganDataSource = BimbinganDataSource([]);
  final bool isLoaded = false;
  @override
  _BimbinganSkripsiMahasiswaPageState createState() =>
      _BimbinganSkripsiMahasiswaPageState();
}

class _BimbinganSkripsiMahasiswaPageState
    extends State<BimbinganSkripsiMahasiswaPage> {
  int _rowsPerPage = 5;
  BimbinganDataSource _bimbinganDataSource = BimbinganDataSource([]);
  bool isLoaded = false;
  BimbinganService bimbinganService;

  @override
  void initState() {
    super.initState();
    bimbinganService = BimbinganService();
  }

  Future<void> getAllDataBimbingan() async {
    final results = await bimbinganService.getAllDataBimbingan();
    if (!isLoaded) {
      setState(() {
        _bimbinganDataSource = BimbinganDataSource(results);
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getAllDataBimbingan();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bimbingan Skripsi'),
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            PaginatedDataTable(
              header: Text('Bimbingan Skripsi'),
              rowsPerPage: _rowsPerPage,
              availableRowsPerPage: <int>[5, 10],
              onRowsPerPageChanged: (int value) {
                setState(() {
                  _rowsPerPage = value;
                });
              },
              columns: kTableColumns,
              source: _bimbinganDataSource,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: Colors.blueAccent,
                    onPressed: () {
                      setState(() async {
                        Directory appDocDir =
                            await getExternalStorageDirectory();
                        String appDocPath = appDocDir.path;
                        print('Document Path : $appDocPath');
                        final taskId = await FlutterDownloader.enqueue(
                          url:
                              'http://baliimaginerentcar.com/uhamka-ws/KartuBimbingan.pdf',
                          savedDir: '$appDocPath',
                          showNotification:
                              true, // show download progress in status bar (for Android)
                          openFileFromNotification:
                              true, // click on notification to open downloaded file (for Android)
                        );
                        // setState(() {
                        //   FlutterDownloader.open(taskId: taskId);
                        // });

                        FlutterDownloader.open(taskId: taskId);
                      });
                    },
                    child: Text('Download Kartu Bimbingan'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

const kTableColumns = <DataColumn>[
  DataColumn(label: Text('Nama')),
  DataColumn(label: Text('Nim')),
  DataColumn(label: Text('Judul')),
  DataColumn(label: Text('Pembimbing')),
  DataColumn(label: Text('Tanggal')),
  DataColumn(label: Text('Keterangan')),
];

class BimbinganDataSource extends DataTableSource {
  int _selectedCount = 0;
  final List<Bimbingan> _listBs;
  BimbinganDataSource(this._listBs);

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _listBs.length) return null;
    final Bimbingan bs = _listBs[index];
    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text('${bs.nama}')),
      DataCell(Text('${bs.nim}')),
      DataCell(Text('${bs.judul}')),
      DataCell(Text('${bs.pembimbing}')),
      DataCell(Text('${bs.tanggal}')),
      DataCell(Text('${bs.keterangan}')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _listBs.length;

  @override
  int get selectedRowCount => _selectedCount;
}
