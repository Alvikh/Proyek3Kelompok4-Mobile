import 'package:flutter/material.dart';
import 'api_service.dart';
import 'package:intl/intl.dart';

String ucapanDiscover() {
  DateTime now = DateTime.now();
  String waktu = DateFormat('HH').format(now);

  if (int.parse(waktu) >= 5 && int.parse(waktu) < 12) {
    return 'Selamat pagi, Ray!';
  } else if (int.parse(waktu) >= 12 && int.parse(waktu) < 18) {
    return 'Selamat siang, Ray!';
  } else {
    return 'Selamat malam, Ray!';
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
  
  /*Widget _buildTimeBox(String title, String time) {
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
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A90E2)),
          ),
        ],
      ),
    );
  }
  */

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            ucapanDiscover(),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          /*SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(child: _buildTimeBox('Waktu Masuk', '07.00')),
              SizedBox(width: 10),
              Expanded(child: _buildTimeBox('Waktu Pulang', '12.00')),
            ],
          ),*/
          SizedBox(height: 20),
          Text(
            'Riwayat Deteksi Terkini',
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
                              ? 'RUANG A – ${absensi.waktuMasuk} WIB'
                              : 'RUANG A – ${absensi.waktuKeluar} WIB',
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
    );
  }
}