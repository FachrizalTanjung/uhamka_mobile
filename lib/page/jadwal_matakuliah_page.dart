import 'package:flutter/material.dart';
import 'package:uhamka_mobile/model/DataJadwal.dart';
import 'package:uhamka_mobile/services/JadwalService.dart';

class JadwalMatakuliahPage extends StatefulWidget {
  static String tag = 'jadwal-matakuliah-page';
  final DataJadwalDataSource _jadwalDataSource = DataJadwalDataSource([]);
  final bool isLoaded = false;

  @override
  _JadwalMatakuliahPageState createState() => _JadwalMatakuliahPageState();
}

class _JadwalMatakuliahPageState extends State<JadwalMatakuliahPage> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  DataJadwalDataSource _jadwalDataSource = DataJadwalDataSource([]);
  bool isLoaded = false;
  JadwalService jadwalService;

  @override
  void initState() {
    super.initState();
    jadwalService = JadwalService();
  }

  Future<void> getAllDataJadwal() async {
    final results = await jadwalService.getAllDataJadwal();
    if (!isLoaded) {
      setState(() {
        _jadwalDataSource = DataJadwalDataSource(results);
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      SingleChildScrollView(
        child: PaginatedDataTable(
          header: Text('Senin'),
          rowsPerPage: _rowsPerPage,
          availableRowsPerPage: <int>[5, 10, 20],
          onRowsPerPageChanged: (int value) {
            setState(() {
              _rowsPerPage = value;
            });
          },
          columns: kTableColumns,
          source: _jadwalDataSource,
        ),
      ),
      SingleChildScrollView(
        child: PaginatedDataTable(
          header: Text('Selasa'),
          rowsPerPage: _rowsPerPage,
          availableRowsPerPage: <int>[5, 10, 20],
          onRowsPerPageChanged: (int value) {
            setState(() {
              _rowsPerPage = value;
            });
          },
          columns: kTableColumns,
          source: _jadwalDataSource,
        ),
      ),
      SingleChildScrollView(
        child: PaginatedDataTable(
          header: Text('Rabu'),
          rowsPerPage: _rowsPerPage,
          availableRowsPerPage: <int>[5, 10, 20],
          onRowsPerPageChanged: (int value) {
            setState(() {
              _rowsPerPage = value;
            });
          },
          columns: kTableColumns,
          source: _jadwalDataSource,
        ),
      ),
      SingleChildScrollView(
        child: PaginatedDataTable(
          header: Text('Kamis'),
          rowsPerPage: _rowsPerPage,
          availableRowsPerPage: <int>[5, 10, 20],
          onRowsPerPageChanged: (int value) {
            setState(() {
              _rowsPerPage = value;
            });
          },
          columns: kTableColumns,
          source: _jadwalDataSource,
        ),
      ),
      SingleChildScrollView(
        child: PaginatedDataTable(
          header: Text('Jumat'),
          rowsPerPage: _rowsPerPage,
          availableRowsPerPage: <int>[5, 10, 20],
          onRowsPerPageChanged: (int value) {
            setState(() {
              _rowsPerPage = value;
            });
          },
          columns: kTableColumns,
          source: _jadwalDataSource,
        ),
      ),
      SingleChildScrollView(
        child: PaginatedDataTable(
          header: Text('Sabtu'),
          rowsPerPage: _rowsPerPage,
          availableRowsPerPage: <int>[5, 10, 20],
          onRowsPerPageChanged: (int value) {
            setState(() {
              _rowsPerPage = value;
            });
          },
          columns: kTableColumns,
          source: _jadwalDataSource,
        ),
      ),
      SingleChildScrollView(
        child: PaginatedDataTable(
          header: Text('Minggu'),
          rowsPerPage: _rowsPerPage,
          availableRowsPerPage: <int>[5, 10, 20],
          onRowsPerPageChanged: (int value) {
            setState(() {
              _rowsPerPage = value;
            });
          },
          columns: kTableColumns,
          source: _jadwalDataSource,
        ),
      ),
    ];
    final _kTabs = <Tab>[
      Tab(
        text: 'Senin',
      ),
      Tab(
        text: 'Selasa',
      ),
      Tab(
        text: 'Rabu',
      ),
      Tab(
        text: 'Kamis',
      ),
      Tab(
        text: 'Jumat',
      ),
      Tab(
        text: 'Sabtu',
      ),
      Tab(
        text: 'Minggu',
      ),
    ];
    getAllDataJadwal();
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Jadwal Mata Kuliah'),
          bottom: TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.white.withOpacity(0.3),
            indicatorColor: Colors.white,
            tabs: _kTabs,
          ),
        ),
        body: TabBarView(
          children: _kTabPages,
        ),
      ),
    );
  }
}

const kTableColumns = <DataColumn>[
  DataColumn(label: Text('Dosen')),
  DataColumn(label: Text('Mata Kuliah')),
  DataColumn(label: Text('Jam')),
  DataColumn(label: Text('Ruang')),
];

class DataJadwalDataSource extends DataTableSource {
  int _selectedCount = 0;
  final List<DataJadwal> _listJadwal;
  DataJadwalDataSource(this._listJadwal);

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _listJadwal.length) return null;
    final DataJadwal dataJadwal = _listJadwal[index];
    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text('${dataJadwal.namaDosen}')),
      DataCell(Text('${dataJadwal.mataKuliah}')),
      DataCell(Text('${dataJadwal.jamNgajar}')),
      DataCell(Text('${dataJadwal.ruanganNgajar}')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _listJadwal.length;

  @override
  int get selectedRowCount => _selectedCount;
}
