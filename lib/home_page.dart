import 'package:flutter/material.dart';
import 'api_service.dart'; // Import the API service
import 'laporan_page.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AutoAttend',
      theme: ThemeData(
        primaryColor: Color(0xFF4A90E2),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Absensi>> futureAbsensi;

  @override
  void initState() {
    super.initState();
    futureAbsensi = ApiService().fetchAbsensiTerbaru();
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
            Text('Discover'),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Selamat Datang!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(child: _buildTimeBox('Waktu Masuk', '07.00')),
                SizedBox(width: 10), // Add some space between the boxes
                Expanded(child: _buildTimeBox('Waktu Pulang', '15.00')),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Riwayat Kehadiran Terakhir',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<Absensi>>(
                future: futureAbsensi,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Absensi absensi = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: _buildAttendanceHistory(
                            absensi.namaUser,
                            absensi.waktuMasuk != null
                                ? 'MASUK – ${absensi.waktuMasuk} WIB'
                                : 'KELUAR – ${absensi.waktuKeluar} WIB',
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return Center(child: CircularProgressIndicator());
                },
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
        currentIndex: 0, // Set the initial selected index
        selectedItemColor: Color(0xFF4A90E2),
        onTap: (index) {
          // Handle bottom navigation item tap
          if (index == 1) { // Check if "Laporan" item is tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LaporanPage()),
            );
          }
        },
      ),
    );
  }

  Widget _buildTimeBox(String title, String time) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Text(title),
          SizedBox(height: 10),
          Text(
            time,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF4A90E2)),
          ),
        ],
      ),
    );
  }

  Widget _buildAttendanceHistory(String name, String details) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            details,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
