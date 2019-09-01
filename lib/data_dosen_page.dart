import 'package:flutter/material.dart';

class DataDosenPage extends StatefulWidget {
  static String tag = 'data-dosen-page';

  @override
  State<StatefulWidget> createState() => _DataDosenPageState();
}

class _DataDosenPageState extends State<DataDosenPage> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  Widget build(BuildContext context) {
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
          source: DataDosenDataSource(),
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
      //         source: _dataDosenDataSource,
      //       ),
      //     ],
      //   ),
      // ),
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
  DataDosen(this.nip, this.nama, this.alamat, this.noHp);

  final String nip;
  final String nama;
  final String alamat;
  final String noHp;
  bool selected = false;
}

class DataDosenDataSource extends DataTableSource {
  int _selectedCount = 0;

  final List<DataDosen> _listDosen = <DataDosen>[
    new DataDosen('23444', 'Nurul ambar', 'Taman puri 1', '08996524132'),
    new DataDosen('2344444', 'pandu', 'Taman Puri 2', '08996524135'),
  ];

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _listDosen.length) return null;
    final DataDosen dataDosen = _listDosen[index];
    return DataRow.byIndex(index: index,
        // selected: dataDosen.selected,
        // onSelectChanged: (bool value) {
        //   _selectedCount += value ? 1 : -1;
        //   assert(_selectedCount >= 0);
        //   dataDosen.selected = value;
        //   notifyListeners();
        // },
        cells: <DataCell>[
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
