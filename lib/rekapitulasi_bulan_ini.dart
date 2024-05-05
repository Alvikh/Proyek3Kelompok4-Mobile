import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Rekapitulasi extends StatefulWidget {
  @override
  _RekapitulasiState createState() => _RekapitulasiState();
}

class _RekapitulasiState extends State<Rekapitulasi> {
  late List<String> _pegawai = ['Alvi Kh', 'Dina Intan K', 'Rayya RR'];

  late List<Map<String, dynamic>> _attendanceData = [
    {
      'name': 'Alvi Kh', 
      'status': 'Hadir', 
      'date': DateTime.now()
    },
    {
      'name': 'Dina Intan K',
      'status': 'Hadir',
      'date': DateTime.now().subtract(Duration(days: 1))
    },
    {
      'name': 'Rayya RR',
      'status': 'Hadir',
      'date': DateTime.now().subtract(Duration(days: 2))
    },
  ];

  late List<Map<String, dynamic>> _originalAttendanceData =
      List<Map<String, dynamic>>.from(_attendanceData);

  late List<DateTime> _daysInMonth = [];
  late int _daysInCurrentMonth = 0;
  late int _currentMonth = DateTime.now().month;
  late int _currentYear = DateTime.now().year;

  @override
  void initState() {
    super.initState();
    _daysInMonth = _getDaysInMonth(_currentYear, _currentMonth);
    _daysInCurrentMonth = _daysInMonth.length;
  }

  List<DateTime> _getDaysInMonth(int year, int month) {
    List<DateTime> daysInMonth = [];
    final DateTime firstDayOfMonth = DateTime(year, month, 1);
    final DateTime lastDayOfMonth =
        DateTime(year, month + 1, 1).subtract(Duration(days: 1));
    for (int i = firstDayOfMonth.day; i <= lastDayOfMonth.day; i++) {
      daysInMonth.add(DateTime(year, month, i));
    }
    return daysInMonth;
  }

  Widget _buildTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              '${DateFormat('MMMM yyyy').format(DateTime(_currentYear, _currentMonth))}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            child: Table(
              defaultColumnWidth: FixedColumnWidth(30.0),
              columnWidths: {
                0: FixedColumnWidth(40.0),
                1: FixedColumnWidth(200.0),
              },
              border: TableBorder.all(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 2,
              ),
              children: [
                TableRow(children: [
                  Column(
                      children: [Text('No', style: TextStyle(fontSize: 16.0))]),
                  Column(children: [
                    Text('Nama Pegawai', style: TextStyle(fontSize: 16.0))
                  ]),
                  for (DateTime day in _daysInMonth)
                    Column(
                      children: [
                        Text('${day.day}', style: TextStyle(fontSize: 16.0)),
                      ],
                    ),
                ]),
                for (int i = 0; i < _pegawai.length; i++)
                  TableRow(children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text((i + 1).toString(),
                              style: TextStyle(fontSize: 16.0)),
                        ]),
                    Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Image.asset(
                                  'assets/Logo.png',
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              flex: 3,
                              child: Text(
                                _pegawai[i],
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    for (DateTime day in _daysInMonth)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: _buildStatusCell(_pegawai[i], day),
                          ),
                        ],
                      ),
                  ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusCell(String name, DateTime day) {
    bool hadir = _attendanceData.any((data) =>
        data['name'] == name &&
        data['date'].day == day.day &&
        data['date'].month == day.month);
    return Container(
      alignment: Alignment.center,
      color: hadir ? Colors.green : null,
      child: Text(
        hadir ? 'H' : '',
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rekapitulasi Kehadiran',
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 82, 16, 234),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: _buildTable(),
        ),
      ),
    );
  }
}
