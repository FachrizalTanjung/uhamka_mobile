import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<DataDosen>> fetchResults(http.Client client) async {
  // final response = await client.get('http://192.168.43.91:8085/uhamka-ws/dosen/get-all');
  final response =
      await client.get('http://baliimaginerentcar.com/uhamka-ws/dosen/get-all');
  return compute(parseResults, response.body);
}

List<DataDosen> parseResults(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<DataDosen>((json) => DataDosen.fromJson(json)).toList();
}

class DataDosenPage extends StatefulWidget {
  static String tag = 'data-dosen-page';
  final DataDosenDataSource _dataDosenDataSource = DataDosenDataSource([]);
  final bool isLoaded = false;

  @override
  State<StatefulWidget> createState() => _DataDosenPageState();
}

class _DataDosenPageState extends State<DataDosenPage> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  DataDosenDataSource _dataDosenDataSource = DataDosenDataSource([]);
  bool isLoaded = false;
  Future<void> getDataDsn() async {
    final results = await fetchResults(http.Client());
    if (!isLoaded) {
      setState(() {
        _dataDosenDataSource = DataDosenDataSource(results);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getDataDsn();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Dosen'),
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        child: PaginatedDataTable(
          header: Text('Data Dosen'),
          rowsPerPage: _rowsPerPage,
          availableRowsPerPage: <int>[5, 10, 20],
          onRowsPerPageChanged: (int value) {
            setState(() {
              _rowsPerPage = value;
            });
          },
          columns: kTableColumns,
          source: _dataDosenDataSource,
        ),
      ),
    );
  }
}

const kTableColumns = <DataColumn>[
  DataColumn(label: Text('NIP')),
  DataColumn(label: Text('Nama')),
  DataColumn(label: Text('Alamat')),
  DataColumn(label: Text('No HP')),
];

class DataDosen {
  DataDosen({this.nip, this.nama, this.alamat, this.noHp});

  final String nip;
  final String nama;
  final String alamat;
  final String noHp;
  bool selected = false;

  factory DataDosen.fromJson(Map<String, dynamic> json) {
    var dataDosen = DataDosen(
        nip: json['nip'] as String,
        nama: json['nama'] as String,
        alamat: json['alamat'] as String,
        noHp: json['noHp'] as String);
    return dataDosen;
  }
}

class DataDosenDataSource extends DataTableSource {
  int _selectedCount = 0;
  final List<DataDosen> _listDosen;
  DataDosenDataSource(this._listDosen);

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _listDosen.length) return null;
    final DataDosen dataDosen = _listDosen[index];
    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text('${dataDosen.nip}')),
      DataCell(Text('${dataDosen.nama}')),
      DataCell(Text('${dataDosen.alamat}')),
      DataCell(Text('${dataDosen.noHp}')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _listDosen.length;

  @override
  int get selectedRowCount => _selectedCount;
}
