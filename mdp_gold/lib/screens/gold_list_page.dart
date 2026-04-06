import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/gold_model.dart';
import '../services/gold_service.dart';

class GoldListPage extends StatelessWidget {
  const GoldListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Harga Emas"),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<List<GoldModel>>(
        future: GoldService().getGoldData(),
        builder: (context, snapshot) {
          
          // 🔄 Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // ❌ Error
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }

          // ⚠️ Data kosong
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("Data tidak tersedia"),
            );
          }

          final data = snapshot.data!;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];

              return Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                child: ListTile(
                  title: Text(
                    formatter.format(item.harga),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text("Tanggal: ${item.tanggal}"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}