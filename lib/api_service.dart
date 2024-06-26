import 'dart:convert';
import 'package:http/http.dart' as http;

class Absensi {
  final String id;
  final String namaUser;
  final String profilUser;
  final String? waktuMasuk;
  final String? waktuKeluar;
  final String updatedAt;

  Absensi({
    required this.id,
    required this.namaUser,
    required this.profilUser,
    this.waktuMasuk,
    this.waktuKeluar,
    required this.updatedAt,
  });

  factory Absensi.fromJson(Map<String, dynamic> json) {
    return Absensi(
      id: json['id'],
      namaUser: json['nama_user'],
      profilUser: json['profil_user'],
      waktuMasuk: json['waktu_masuk'],
      waktuKeluar: json['waktu_keluar'],
      updatedAt: json['updated_at'],
    );
  }
}

class ApiService {
  late String baseUrl;

  ApiService() {
    _initializeBaseUrl();
  }

  Future<void> _initializeBaseUrl() async {
    baseUrl = 'https://futurespeed.my.id:443/autoattend';
  }

  Future<List<Absensi>> fetchAbsensiTerbaru() async {
    await _initializeBaseUrl();
    final response = await http.get(Uri.parse('$baseUrl/index.php?id=4'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Absensi.fromJson(data)).toList();
    } else {
      throw Exception('Tidak dapat menemukan data.');
    }
  }
}
