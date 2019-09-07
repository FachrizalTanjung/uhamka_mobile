import 'package:flutter/material.dart';

class JadwalMatakuliahPage extends StatefulWidget {
  static String tag = 'jadwal-matakuliah-page';

  @override
  _JadwalMatakuliahPageState createState() => _JadwalMatakuliahPageState();
}

class _JadwalMatakuliahPageState extends State<JadwalMatakuliahPage> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

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
          source: DataMahasiswaDataSource(),
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
          source: DataMahasiswaDataSource(),
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
          source: DataMahasiswaDataSource(),
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
          source: DataMahasiswaDataSource(),
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
          source: DataMahasiswaDataSource(),
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
          source: DataMahasiswaDataSource(),
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
          source: DataMahasiswaDataSource(),
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
  DataColumn(label: Text('Hari')),
  DataColumn(label: Text('Jam')),
  DataColumn(label: Text('Ruang')),
];

class DataJadwal {
  final String dosen;
  final String hari;
  final String jam;
  final String ruang;
  bool selected = false;

  DataJadwal(this.dosen, this.hari, this.jam, this.ruang);
}

class DataMahasiswaDataSource extends DataTableSource {
  int _selectedCount = 0;

  final List<DataJadwal> _listJadwal = <DataJadwal>[
    new DataJadwal('Ridho', 'Senin', '07.50 - 09.30', 'FT 406'),
  ];

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _listJadwal.length) return null;
    final DataJadwal dataJadwal = _listJadwal[index];
    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text('${dataJadwal.dosen}')),
      DataCell(Text('${dataJadwal.hari}')),
      DataCell(Text('${dataJadwal.jam}')),
      DataCell(Text('${dataJadwal.ruang}')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _listJadwal.length;

  @override
  int get selectedRowCount => _selectedCount;
}
