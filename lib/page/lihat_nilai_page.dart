import 'package:flutter/material.dart';
import 'package:uhamka_mobile/model/Nilai.dart';
import 'package:uhamka_mobile/services/NilaiService.dart';

class LihatNilaiPage extends StatefulWidget {
  static String tag = 'lihat-nilai-page';
  final DataNilaiDataSource _nilaiDataSource = DataNilaiDataSource([]);
  final bool isLoaded = false;
  @override
  _LihatNilaiPageState createState() => _LihatNilaiPageState();
}

class _LihatNilaiPageState extends State<LihatNilaiPage> {
  DataNilaiDataSource _nilaiDataSource = DataNilaiDataSource([]);
  bool isLoaded = false;
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  NilaiService nilaiService;

  @override
  void initState() {
    super.initState();
    nilaiService = NilaiService();
  }

  Future<void> getAllDataNilai() async {
    final results = await nilaiService.getAllDataNilai();
    if (!isLoaded) {
      setState(() {
        _nilaiDataSource = DataNilaiDataSource(results);
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getAllDataNilai();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Nilai'),
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        child: PaginatedDataTable(
          header: Text('Data Nilai'),
          rowsPerPage: _rowsPerPage,
          availableRowsPerPage: <int>[5, 10, 20],
          onRowsPerPageChanged: (int value) {
            setState(() {
              _rowsPerPage = value;
            });
          },
          columns: kTableColumns,
          source: _nilaiDataSource,
        ),
      ),
    );
  }
}

const kTableColumns = <DataColumn>[
  DataColumn(label: Text('NIM')),
  DataColumn(label: Text('ID Matkul')),
  DataColumn(label: Text('Tugas')),
  DataColumn(label: Text('Kuis')),
  DataColumn(label: Text('UTS')),
  DataColumn(label: Text('UAS'))
];

class DataNilaiDataSource extends DataTableSource {
  int _selectedCount = 0;
  final List<Nilai> _listNilai;
  DataNilaiDataSource(this._listNilai);

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _listNilai.length) return null;
    final Nilai dataNilai = _listNilai[index];
    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text('${dataNilai.nim}')),
      DataCell(Text('${dataNilai.idMatkul}')),
      DataCell(Text('${dataNilai.tugas}')),
      DataCell(Text('${dataNilai.kuis}')),
      DataCell(Text('${dataNilai.uts}')),
      DataCell(Text('${dataNilai.uas}')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _listNilai.length;

  @override
  int get selectedRowCount => _selectedCount;
}
