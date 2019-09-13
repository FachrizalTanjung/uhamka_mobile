import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uhamka_mobile/model/Mahasiswa.dart';
import 'package:uhamka_mobile/services/MahasiswaService.dart';

// Future<List<DataMahasiswa>> fetchResults(http.Client client) async {
//   // final response = await client.get('http://192.168.43.91:8085/uhamka-ws/mahasiswa/get-all');
//   final response = await client
//       .get('http://baliimaginerentcar.com/uhamka-ws/mahasiswa/get-all');
//   return compute(parseResults, response.body);
// }

// List<DataMahasiswa> parseResults(String responseBody) {
//   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//   return parsed
//       .map<DataMahasiswa>((json) => DataMahasiswa.fromJson(json))
//       .toList();
// }

class DataMahasiswaPage extends StatefulWidget {
  static String tag = 'data-mahasiswa-page';
  final DataMahasiswaDataSource _dataMahasiswaDataSource =
      DataMahasiswaDataSource([]);
  final bool isLoaded = false;

  @override
  State<StatefulWidget> createState() => _DataMahasiswaPageState();
}

class _DataMahasiswaPageState extends State<DataMahasiswaPage> {
  DataMahasiswaDataSource _dataMahasiswaDataSource =
      DataMahasiswaDataSource([]);
  bool isLoaded = false;
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  MahasiswaService mahasiswaService;

  @override
  void initState() {
    super.initState();
    mahasiswaService = MahasiswaService();
  }

  Future<void> getDataMhs() async {
    final results = await mahasiswaService.getAllMahasiswa();
    print('is Loaded : $isLoaded');
    if (!isLoaded) {
      setState(() {
        _dataMahasiswaDataSource = DataMahasiswaDataSource(results);
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getDataMhs();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Mahasiswa'),
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        child: PaginatedDataTable(
          header: Text('Data Mahasiswa'),
          rowsPerPage: _rowsPerPage,
          availableRowsPerPage: <int>[5, 10, 20],
          onRowsPerPageChanged: (int value) {
            setState(() {
              _rowsPerPage = value;
            });
          },
          columns: kTableColumns,
          source: _dataMahasiswaDataSource,
        ),
      ),
    );
  }
}

const kTableColumns = <DataColumn>[
  DataColumn(label: Text('NIM')),
  DataColumn(label: Text('Nama')),
  DataColumn(label: Text('Tempat Tanggal Lahir')),
  DataColumn(label: Text('Alamat')),
  DataColumn(label: Text('Angkatan')),
];

// class DataMahasiswa {
//   final String nim;
//   final String nama;
//   final String tempatTglLahir;
//   final String alamat;
//   final String angkatan;
//   bool selected = false;

//   DataMahasiswa(
//       {this.nim, this.nama, this.tempatTglLahir, this.alamat, this.angkatan});

//   factory DataMahasiswa.fromJson(Map<String, dynamic> json) {
//     return DataMahasiswa(
//         nim: json['nim'] as String,
//         nama: json['nama'] as String,
//         tempatTglLahir: json['tempatTglLahir'] as String,
//         alamat: json['alamat'] as String,
//         angkatan: json['angkatan'] as String);
//   }
// }

class DataMahasiswaDataSource extends DataTableSource {
  int _selectedCount = 0;
  final List<Mahasiswa> _listMhs;
  DataMahasiswaDataSource(this._listMhs);

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _listMhs.length) return null;
    final Mahasiswa dataMhs = _listMhs[index];
    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text('${dataMhs.nim}')),
      DataCell(Text('${dataMhs.nama}')),
      DataCell(Text('${dataMhs.tempatTglLahir}')),
      DataCell(Text('${dataMhs.alamat}')),
      DataCell(Text('${dataMhs.angkatan}')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _listMhs.length;

  @override
  int get selectedRowCount => _selectedCount;
}
