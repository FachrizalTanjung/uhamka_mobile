import 'package:flutter/material.dart';
import 'package:uhamka_mobile/model/Mahasiswa.dart';
import 'package:uhamka_mobile/services/MahasiswaService.dart';

class DataMahasiswaPage extends StatefulWidget {
  static String tag = 'data-mahasiswa-page';
  final DataMahasiswaDataSource _mahasiswaDataSource =
      DataMahasiswaDataSource([]);
  final bool isLoaded = false;

  @override
  State<StatefulWidget> createState() => _DataMahasiswaPageState();
}

class _DataMahasiswaPageState extends State<DataMahasiswaPage> {
  DataMahasiswaDataSource _mahasiswaDataSource = DataMahasiswaDataSource([]);
  bool isLoaded = false;
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  MahasiswaService mahasiswaService;

  @override
  void initState() {
    super.initState();
    mahasiswaService = MahasiswaService();
  }

  Future<void> getAllDataMhs() async {
    final results = await mahasiswaService.getAllDataMhs();
    if (!isLoaded) {
      setState(() {
        _mahasiswaDataSource = DataMahasiswaDataSource(results);
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getAllDataMhs();
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
          source: _mahasiswaDataSource,
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
