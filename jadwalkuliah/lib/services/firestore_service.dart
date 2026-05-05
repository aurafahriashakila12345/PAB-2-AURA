import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/jadwal_model.dart';

class FirestoreService {
  final CollectionReference jadwalRef =
      FirebaseFirestore.instance.collection('jadwal');

  Future<void> addJadwal(Jadwal jadwal) async {
    await jadwalRef.add(jadwal.toMap());
  }

  Stream<List<Jadwal>> getJadwal() {
    return jadwalRef.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Jadwal.fromMap(doc.id, data);
      }).toList();
    });
  }

  Future<void> updateJadwal(Jadwal jadwal) async {
    await jadwalRef.doc(jadwal.id).update(jadwal.toMap());
  }

  Future<void> deleteJadwal(String id) async {
    await jadwalRef.doc(id).delete();
  }
}