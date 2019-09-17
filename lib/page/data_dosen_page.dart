import 'package:flutter/material.dart';
import 'package:uhamka_mobile/model/Dosen.dart';
import 'package:uhamka_mobile/services/DosenService.dart';

class DataDosenPage extends StatefulWidget {
  static String tag = 'data-dosen-page';
  final DataDosenDataSource _dosenDataSource = DataDosenDataSource([]);
  final bool isLoaded = false;

  @override
  State<StatefulWidget> createState() => _DataDosenPageState();
}

class _DataDosenPageState extends State<DataDosenPage> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  DataDosenDataSource _dosenDataSource = DataDosenDataSource([]);
  bool isLoaded = false;
  DosenService dosenService;

  @override
  void initState() {
    super.initState();
    dosenService = DosenService();
  }

  Future<void> getAllDataDosen() async {
    final results = await dosenService.getAllDataDosen();
    if (!isLoaded) {
      setState(() {
        _dosenDataSource = DataDosenDataSource(results);
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getAllDataDosen();
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
          source: _dosenDataSource,
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

class DataDosenDataSource extends DataTableSource {
  int _selectedCount = 0;
  final List<Dosen> _listDosen;
  DataDosenDataSource(this._listDosen);

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _listDosen.length) return null;
    final Dosen dataDosen = _listDosen[index];
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
