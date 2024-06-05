import 'package:flutter/material.dart';

class LaporanPage extends StatelessWidget {
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
            Text('Laporan'),
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
                          hintText: 'Mei',
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
                    backgroundColor: Colors.blue, // Ganti primary dengan backgroundColor
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    // Implement your logic here
                  },
                  child: Text('Excel'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Ganti primary dengan backgroundColor
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
                          child: Text('Tanggal', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Nama', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Waktu Masuk', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Waktu Pulang', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Keterangan', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    // Data dummy
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('01-05-2024'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Alvi Kh'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('08:00'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('17:00'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Hadir'),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('02-05-2024'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Alvi Kh'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('08:30'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('17:30'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Hadir'),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('03-05-2024'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Alvi Kh'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('09:00'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('18:00'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Hadir'),
                        ),
                      ],
                    ),
                    // Tambahkan lebih banyak TableRow di sini sesuai kebutuhan
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
