import 'package:flutter/material.dart';

class LaporanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan'),
      ),
      body: Center(
        child: Text(
          'Halaman Laporan',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
