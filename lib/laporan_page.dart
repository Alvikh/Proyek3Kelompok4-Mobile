import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LaporanPage extends StatefulWidget {
  @override
  _LaporanPageState createState() => _LaporanPageState();
}

class _LaporanPageState extends State<LaporanPage> {
  List<Map<String, dynamic>> laporanData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.17:8000/api/laporan2'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData.containsKey('data')) {
        setState(() {
          laporanData = List<Map<String, dynamic>>.from(responseData['data']);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/Logo.png',
              width: 32,
              height: 32,
            ),
            SizedBox(width: 10),
            Text('Laporan', style: TextStyle(fontSize: 16)),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Notification clicked')),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tahun:'),
                      TextField(
                        decoration: InputDecoration(
                          hintText: '2024',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Bulan:'),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Juni',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement your logic here
                  },
                  child: Text('Tampilkan'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue, // Ganti primary dengan backgroundColor
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    // Implement your logic here
                  },
                  child: Text('Excel'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.green, // Ganti primary dengan backgroundColor
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Table(
                  border: TableBorder.all(),
                  children: [
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Tanggal',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Waktu Masuk',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Waktu Keluar',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Keterangan',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    for (var data in laporanData)
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(data['f_tanggal'] != null
                                ? data['f_tanggal']
                                : ''),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(data['f_waktu_masuk'] != null
                                ? data['f_waktu_masuk']
                                : ''),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(data['f_waktu_keluar'] != null
                                ? data['f_waktu_keluar']
                                : ''),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Ruang A'),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Laporan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
          ),
        ],
        currentIndex: 1, // Set the initial selected index to "Laporan"
        selectedItemColor: Color(0xFF4A90E2),
        onTap: (index) {
          // Handle bottom navigation item tap
          if (index == 0) {
            Navigator.pop(context); // Go back to the previous page
          }
          if (index == 2) {
            // Navigate to the Profile page
            // Add your Profile page navigation logic here
          }
        },
      ),
    );
  }
}
