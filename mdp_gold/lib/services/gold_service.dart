import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import '../models/gold_model.dart';

class GoldService {
  final DatabaseReference _dbRef =
      FirebaseDatabase.instance.ref("harga_emas");

  Future<List<GoldModel>> getGoldData() async {
    final snapshot = await _dbRef.get();

    if (snapshot.exists) {
      final data = Map<String, dynamic>.from(snapshot.value as Map);

      List<GoldModel> list = data.values.map((e) {
        return GoldModel.fromJson(Map<String, dynamic>.from(e));
      }).toList();

      // 🔥 Sorting tanggal benar
      list.sort((a, b) {
        final dateA = DateFormat('dd-MM-yyyy').parse(a.tanggal);
        final dateB = DateFormat('dd-MM-yyyy').parse(b.tanggal);
        return dateB.compareTo(dateA);
      });

      return list;
    } else {
      return [];
    }
  }
}