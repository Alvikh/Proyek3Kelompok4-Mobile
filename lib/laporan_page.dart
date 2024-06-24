import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api_service.dart';

class LaporanPage extends StatefulWidget {
  @override
  _LaporanPageState createState() => _LaporanPageState();
}

class _LaporanPageState extends State<LaporanPage> {
  List<Map<String, dynamic>> laporanData = [];
  late ApiService apiService;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://futurespeed.my.id:443/autoattend/index.php'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      setState(() {
        laporanData = List<Map<String, dynamic>>.from(responseData);
      });
    } else {
      print('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Text('Tahun:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 4.0),
                      TextField(
                        decoration: InputDecoration(
                          hintText: '2024',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
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
                      Text('Bulan:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 4.0),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Juni',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
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
                    backgroundColor: Colors.blue,
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    // Implement your logic here
                  },
                  child: Text('Excel'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Table(
                  border: TableBorder.all(color: Colors.grey),
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.teal.shade100,
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Tanggal',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal.shade800,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Waktu Terdeteksi',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal.shade800,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Keterangan',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal.shade800,
                              )),
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
    );
  }
}
