// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'My Notes';

  @override
  String get addNote => 'Add Note';

  @override
  String get editNote => 'Edit Note';

  @override
  String get deleteNote => 'Delete Note';

  @override
  String get title => 'Title';

  @override
  String get description => 'Description';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get add => 'Add';

  @override
  String get noNotes => 'No notes yet';

  @override
  String get addFirstNote => 'Tap + button to add a note';

  @override
  String get noteAdded => 'Note added successfully';

  @override
  String get noteUpdated => 'Note updated successfully';

  @override
  String get noteDeleted => 'Note deleted successfully';

  @override
  String deleteConfirm(String title) {
    return 'Are you sure you want to delete \"$title\"?';
  }

  @override
  String get titleRequired => 'Title cannot be empty';

  @override
  String get descriptionRequired => 'Description cannot be empty';

  @override
  String get tapToAddImage => 'Tap to add image';

  @override
  String get changeImage => 'Change Image';

  @override
  String get error => 'An error occurred';

  @override
  String get delete => 'Delete';

  @override
  String get language => 'Language';

  @override
  String get languageIndonesian => 'Indonesian';

  @override
  String get languageEnglish => 'English';

  @override
  String get copyFcmToken => 'Copy FCM Token';

  @override
  String get fcmTokenCopied => 'FCM Token copied to clipboard';

  @override
  String get errorOccurred => 'An error occurred';

  @override
  String get addNoteHint => 'Tap + button to add a note';

  @override
  String noteAddFailed(String error) {
    return 'Failed to add note: $error';
  }

  @override
  String noteUpdateFailed(String error) {
    return 'Failed to update note: $error';
  }

  @override
  String noteDeleteFailed(String error) {
    return 'Failed to delete note: $error';
  }
}
