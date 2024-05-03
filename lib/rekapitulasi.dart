import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Rekapitulasi extends StatefulWidget {
  @override
  _RekapitulasiState createState() => _RekapitulasiState();
}

class _RekapitulasiState extends State<Rekapitulasi> {
  List<Map<String, dynamic>> _attendanceData = [
    {'name': 'Alvi kh', 'status': 'Hadir', 'date': DateTime.now()},
    {'name': 'Dina Intan K', 'status': 'Hadir', 'date': DateTime.now().subtract(Duration(days: 3))},
    {'name': 'Rayya RR', 'status': 'Tidak Hadir', 'date': DateTime.now().subtract(Duration(days: 10))},
    {'name': 'Alvi kh', 'status': 'Hadir', 'date': DateTime.now()},
    {'name': 'Dina Intan K', 'status': 'Hadir', 'date': DateTime.now().subtract(Duration(days: 3))},
    {'name': 'Rayya RR', 'status': 'Tidak Hadir', 'date': DateTime.now().subtract(Duration(days: 10))},
    {'name': 'Alvi kh', 'status': 'Hadir', 'date': DateTime.now()},
    {'name': 'Dina Intan K', 'status': 'Hadir', 'date': DateTime.now().subtract(Duration(days: 3))},
    {'name': 'Rayya RR', 'status': 'Tidak Hadir', 'date': DateTime.now().subtract(Duration(days: 10))},
  ];

  late List<Map<String, dynamic>> _originalAttendanceData = List<Map<String, dynamic>>.from(_attendanceData);

  String _selectedTimeRange = 'Hari Ini';

  void _filterAttendanceData(String timeRange) {
    setState(() {
      _selectedTimeRange = timeRange;
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
          final firstDayOfMonth = DateTime(DateTime.now().year, DateTime.now().month, 1);
          _attendanceData = _originalAttendanceData.where((entry) => entry['date'].isAfter(firstDayOfMonth)).toList();
          break;
        case 'Semua':
          _attendanceData = List<Map<String, dynamic>>.from(_originalAttendanceData);
          break;
        default:
          break;
      }
    });
  }

  // Helper function to check if a given date is today
  bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year && date.month == now.month && date.day == now.day;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rekapitulasi Kehadiran'),
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          ),
        backgroundColor: Color.fromARGB(255, 82, 16, 234),
        actions: [
          PopupMenuButton<String>(
            onSelected: _filterAttendanceData,
            itemBuilder: (BuildContext context) {
              return ['Hari Ini', 'Minggu Ini', 'Bulan Ini', 'Semua'].map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _attendanceData.length,
        itemBuilder: (context, index) {
          final attendance = _attendanceData[index];
          return ListTile(
            title: Text(attendance['name']),
            subtitle: Text(attendance['status']),
            trailing: Text(DateFormat('yyyy-MM-dd').format(attendance['date'])),
          );
        },
      ),
    );
  }
}
