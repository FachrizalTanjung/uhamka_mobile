import 'dart:io';

import 'package:flutter/material.dart';
import 'package:uhamka_mobile/model/Bimbingan.dart';
import 'package:uhamka_mobile/services/BimbinganService.dart';

class BimbinganSkripsiDosenPage extends StatefulWidget {
  static String tag = 'bimbingan-skripsi-dosen-page';
  final BimbinganDataSource _bimbinganDataSource = BimbinganDataSource([]);
  final bool isLoaded = false;
  @override
  _BimbinganSkripsiDosenPageState createState() =>
      _BimbinganSkripsiDosenPageState();
}

class _BimbinganSkripsiDosenPageState extends State<BimbinganSkripsiDosenPage> {
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: RaisedButton(
                        color: Colors.blueAccent,
                        onPressed: () {
                          HttpClient client = new HttpClient();
                          client.getUrl(Uri.parse('http://baliimaginerentcar.com/uhamka-ws/KartuBimbingan.pdf'))
                          .then((req){
                            
                          });
                        },
                        child: Text('Download Kartu Bimbingan'),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(4.0),
                    //   child: RaisedButton(
                    //     color: Colors.blueAccent,
                    //     onPressed: () {},
                    //     child: Text('Tambah Bimbingan'),
                    //   ),
                    // ),
                  ],
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
