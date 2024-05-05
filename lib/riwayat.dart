import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latihan/rekapitulasi_bulan_ini.dart';
import 'rekapitulasi_bulan_ini.dart';

class Riwayat extends StatefulWidget {
  @override
  _RiwayatState createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  List<Map<String, dynamic>> _attendanceData = [
    {'name': 'Alvi kh', 'status': 'Hadir', 'date': DateTime.now()},
    {'name': 'Dina Intan K', 'status': 'Hadir', 'date': DateTime.now().subtract(Duration(days: 1))},
    {'name': 'Rayya RR', 'status': 'Hadir', 'date': DateTime.now().subtract(Duration(days: 2))},
  ];

  late List<Map<String, dynamic>> _originalAttendanceData = List<Map<String, dynamic>>.from(_attendanceData);

  String _WaktuTerpilih = 'Hari Ini';

  void _filterAttendanceData(String timeRange) {
    setState(() {
      _WaktuTerpilih = timeRange;
      switch (timeRange) {
        case 'Hari Ini':
          _attendanceData = _originalAttendanceData.where((entry) => isToday(entry['date'])).toList();
          break;
        case 'Minggu Ini':
          final today = DateTime.now();
          final lastWeek = today.subtract(Duration(days: 6));
          _attendanceData = _originalAttendanceData.where((entry) => entry['date'].isAfter(lastWeek)).toList();
          break;
        case 'Bulan Ini':
          Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Rekapitulasi()),
                  );
          break;
        default:
          break;
      }
    });
  }

  bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year && date.month == now.month && date.day == now.day;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text(
          'Riwayat Kehadiran',
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 82, 16, 234),
        actions: [
          PopupMenuButton<String>(
            onSelected: _filterAttendanceData,
            itemBuilder: (BuildContext context) {
              return ['Hari Ini', 'Minggu Ini', 'Bulan Ini'].map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice, style: TextStyle(color: Colors.black)),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _attendanceData.length * 2 - 1,
        itemBuilder: (context, index) {
          if (index.isOdd) return Divider(height: 1);
          final realIndex = index ~/ 2;
          final attendance = _attendanceData[realIndex];
          return ListTile(
            title: Text(attendance['name'], style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            subtitle: Text(
              attendance['status'],
              style: TextStyle(color: attendance['status'] == 'Hadir' ? Colors.green : Colors.red, fontSize: 12),
            ),
            trailing: Text(DateFormat('yyyy-MM-dd').format(attendance['date']), style: TextStyle(color: Colors.grey)),
          );
        },
      ),
    );
  }
}
