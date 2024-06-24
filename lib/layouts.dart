// import 'package:flutter/material.dart';
// import 'home_page.dart';
// import 'laporan_page.dart';

// class Layouts extends StatefulWidget {
//   @override
//   _LayoutsState createState() => _LayoutsState();
// }

// class _LayoutsState extends State<Layouts> {
//   final PageController _pageController = PageController();
//   int _currentIndex = 0;

//   void _logout(BuildContext context) {
//     // Implementasi logout di sini
//     // Misalnya, menghapus token autentikasi atau data pengguna dari penyimpanan lokal

//     // Setelah logout berhasil, navigasikan ke halaman login
//     Navigator.pushReplacementNamed(context, '/');
//   }

//   void _showNotificationBottomSheet() {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Container(
//           padding: EdgeInsets.all(20),
//           height: 200,
//           width: MediaQuery.of(context).size.width,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Notifikasi Terkini',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               Expanded(
//                 child: Center(
//                   child: Text(
//                     'Tidak ada notifikasi.',
//                     style: TextStyle(fontSize: 18),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   void _showSearchBottomSheet() {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Container(
//           padding: EdgeInsets.all(20),
//           height: 300,
//           width: MediaQuery.of(context).size.width,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Pencarian',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Cari...',
//                 ),
//               ),
//               SizedBox(height: 10),
//               Expanded(
//                 child: ListView(
//                   children: [
//                     ListTile(
//                       title: Text('Temukan Pegawai A'),
//                       onTap: () {},
//                     ),
//                     ListTile(
//                       title: Text('Temukan Pegawai B'),
//                       onTap: () {},
//                     ),
//                     ListTile(
//                       title: Text('Temukan Pegawai C'),
//                       onTap: () {},
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Row(
//           children: [
//             /*Image.asset(
//               'assets/Logo.png',
//               width: 32,
//               height: 32,
//             ),
//             SizedBox(width: 10),*/
//             Text(_currentIndex == 0 ? 'Discover' : 'Laporan'),
//           ],
//         ),
//         backgroundColor: Color.fromARGB(255, 255, 255, 255),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: _showSearchBottomSheet,
//           ),
//           IconButton(
//             icon: Icon(Icons.notifications),
//             onPressed: _showNotificationBottomSheet,
//           ),
//         ],
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(1.0),
//           child: Container(
//             height: 1.0,
//             color: const Color.fromARGB(255, 220, 220, 220),
//           ),
//         ),
//       ),
//       body: PageView(
//         controller: _pageController,
//         onPageChanged: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         children: [
//           MyHomePage(),
//           LaporanPage(),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         backgroundColor: Colors.white,
//         onTap: (index) {
//           _pageController.animateToPage(
//             index,
//             duration: Duration(milliseconds: 300),
//             curve: Curves.easeInOut,
//           );
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Discover',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.bar_chart),
//             label: 'Laporan',
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'home_page.dart';
import 'laporan_page.dart';
import 'profile.dart';

class Layouts extends StatefulWidget {
  @override
  _LayoutsState createState() => _LayoutsState();
}

class _LayoutsState extends State<Layouts> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _logout(BuildContext context) {
    // Implementasi logout di sini
    // Misalnya, menghapus token autentikasi atau data pengguna dari penyimpanan lokal

    // Setelah logout berhasil, navigasikan ke halaman login
    Navigator.pushReplacementNamed(context, '/');
  }

  void _showNotificationBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Notifikasi Terkini',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Tidak ada notifikasi.',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSearchBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pencarian',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Cari...',
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: Text('Temukan Pegawai A'),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text('Temukan Pegawai B'),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text('Temukan Pegawai C'),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text(_currentIndex == 0 ? 'Discover' : _currentIndex == 1 ? 'Laporan' : 'Profile'),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: _showSearchBottomSheet,
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: _showNotificationBottomSheet,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            height: 1.0,
            color: const Color.fromARGB(255, 220, 220, 220),
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          MyHomePage(),
          LaporanPage(),
          ProfilePage(), // Add ProfilePage here
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Laporan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile', // Add Profile item here
          ),
        ],
      ),
    );
  }
}
