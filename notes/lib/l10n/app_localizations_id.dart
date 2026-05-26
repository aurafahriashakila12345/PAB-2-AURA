// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Catatan Saya';

  @override
  String get addNote => 'Tambah Catatan';

  @override
  String get editNote => 'Edit Catatan';

  @override
  String get deleteNote => 'Hapus Catatan';

  @override
  String get title => 'Judul';

  @override
  String get description => 'Deskripsi';

  @override
  String get cancel => 'Batal';

  @override
  String get save => 'Simpan';

  @override
  String get add => 'Tambah';

  @override
  String get noNotes => 'Belum ada catatan';

  @override
  String get addFirstNote => 'Tekan tombol + untuk menambahkan catatan';

  @override
  String get noteAdded => 'Catatan berhasil ditambahkan';

  @override
  String get noteUpdated => 'Catatan berhasil diupdate';

  @override
  String get noteDeleted => 'Catatan berhasil dihapus';

  @override
  String deleteConfirm(String title) {
    return 'Apakah Anda yakin ingin menghapus \"$title\"?';
  }

  @override
  String get titleRequired => 'Judul tidak boleh kosong';

  @override
  String get descriptionRequired => 'Deskripsi tidak boleh kosong';

  @override
  String get tapToAddImage => 'Ketuk untuk menambah gambar';

  @override
  String get changeImage => 'Ganti Gambar';

  @override
  String get error => 'Terjadi kesalahan';

  @override
  String get delete => 'Hapus';

  @override
  String get language => 'Bahasa';

  @override
  String get languageIndonesian => 'Indonesia';

  @override
  String get languageEnglish => 'Inggris';

  @override
  String get copyFcmToken => 'Salin Token FCM';

  @override
  String get fcmTokenCopied => 'Token FCM disalin ke clipboard';

  @override
  String get errorOccurred => 'Terjadi kesalahan';

  @override
  String get addNoteHint => 'Tekan tombol + untuk menambahkan catatan';

  @override
  String noteAddFailed(String error) {
    return 'Gagal menambahkan catatan: $error';
  }

  @override
  String noteUpdateFailed(String error) {
    return 'Gagal mengupdate catatan: $error';
  }

  @override
  String noteDeleteFailed(String error) {
    return 'Gagal menghapus catatan: $error';
  }
}
