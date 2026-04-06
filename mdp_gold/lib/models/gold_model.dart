class GoldModel {
  final String tanggal;
  final int harga;

  GoldModel({
    required this.tanggal,
    required this.harga,
  });

  factory GoldModel.fromJson(Map<String, dynamic> json) {
    return GoldModel(
      tanggal: json['tanggal'] ?? '',
      harga: (json['harga'] as num).toInt(),
    );
  }
}