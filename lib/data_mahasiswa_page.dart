import 'package:flutter/material.dart';

class DataMahasiswaPage extends StatefulWidget {
  static String tag = 'data-mahasiswa-page';

  @override
  State<StatefulWidget> createState() => _DataMahasiswaPageState();
}

class _DataMahasiswaPageState extends State<DataMahasiswaPage> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  Widget build(BuildContext context) {
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
          source: DataMahasiswaDataSource(),
        ),
      ),
      // Scrollbar(
      //   child: ListView(
      //     padding: EdgeInsets.all(20.0),
      //     children: <Widget>[
      //       PaginatedDataTable(
      //         header: const Text('Nutrition'),
      //         rowsPerPage: _rowsPerPage,
      //         onRowsPerPageChanged: (int value) {
      //           setState(() {
      //             _rowsPerPage = value;
      //           });
      //         },
      //         columns: <DataColumn>[
      //           DataColumn(label: Text('NIP')),
      //           DataColumn(label: Text('Nama')),
      //           DataColumn(label: Text('Alamat')),
      //           DataColumn(label: Text('No. HP')),
      //         ],
      //         source: _DataMahasiswaDataSource,
      //       ),
      //     ],
      //   ),
      // ),
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

class DataMahasiswa {
  final String nim;
  final String nama;
  final String tempatTglLahir;
  final String alamat;
  final String angkatan;
  bool selected = false;

  DataMahasiswa(
      this.nim, this.nama, this.tempatTglLahir, this.alamat, this.angkatan);
}

class DataMahasiswaDataSource extends DataTableSource {
  int _selectedCount = 0;

  final List<DataMahasiswa> _listMhs = <DataMahasiswa>[
    new DataMahasiswa('14321', 'ambari', 'Bekasi 01-08-1997', 'Bekasi', '2017'),
    new DataMahasiswa(
        '122333', 'Rana Rani', 'Bekasi 01-01-1991', 'Bekasi Timur', '2011'),
    new DataMahasiswa(
        '1223335', 'sinta', 'bekasi 22- 03 -1998', 'jakarta', '2014'),
    new DataMahasiswa(
        '1223336', 'susi', 'bekasi 09- 03 -1998', 'Bekasi tambun', 'Gener'),
    new DataMahasiswa(
        '1323133', 'andi asep', 'bekasi 09- 03 -1998', 'Bekasi tambun', '2016'),
  ];

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _listMhs.length) return null;
    final DataMahasiswa dataMhs = _listMhs[index];
    return DataRow.byIndex(index: index,
        // selected: DataMahasiswa.selected,
        // onSelectChanged: (bool value) {
        //   _selectedCount += value ? 1 : -1;
        //   assert(_selectedCount >= 0);
        //   DataMahasiswa.selected = value;
        //   notifyListeners();
        // },
        cells: <DataCell>[
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
