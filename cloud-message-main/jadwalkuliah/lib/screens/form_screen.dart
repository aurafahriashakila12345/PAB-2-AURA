import 'package:flutter/material.dart';
import '../models/jadwal_model.dart';
import '../services/firestore_service.dart';

class FormScreen extends StatefulWidget {
  final Jadwal? jadwal;
  const FormScreen({super.key, this.jadwal});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final course = TextEditingController();
  final lecturer = TextEditingController();
  final day = TextEditingController();
  final time = TextEditingController();
  final firestore = FirestoreService();

  bool isLoading = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    if (widget.jadwal != null) {
      course.text = widget.jadwal!.course;
      lecturer.text = widget.jadwal!.lecturer;
      day.text = widget.jadwal!.day;
      time.text = widget.jadwal!.time;
    }
  }

  @override
  void dispose() {
    course.dispose();
    lecturer.dispose();
    day.dispose();
    time.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    if (course.text.isEmpty ||
        lecturer.text.isEmpty ||
        day.text.isEmpty ||
        time.text.isEmpty) {
      setState(() => errorMessage = 'Semua field harus diisi');
      return;
    }

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final data = Jadwal(
        id: widget.jadwal?.id ?? '',
        course: course.text,
        lecturer: lecturer.text,
        day: day.text,
        time: time.text,
        imageBase64: '',
      );

      if (widget.jadwal == null) {
        await firestore.addJadwal(data);
      } else {
        await firestore.updateJadwal(data);
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.jadwal == null ? 'Jadwal ditambahkan' : 'Jadwal diperbarui',
            ),
          ),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      setState(() => errorMessage = 'Error: $e');
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Jadwal')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              TextField(
                controller: course,
                enabled: !isLoading,
                decoration: const InputDecoration(
                  labelText: 'Mata Kuliah',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: lecturer,
                enabled: !isLoading,
                decoration: const InputDecoration(
                  labelText: 'Dosen',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: day,
                enabled: !isLoading,
                decoration: const InputDecoration(
                  labelText: 'Hari',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: time,
                enabled: !isLoading,
                decoration: const InputDecoration(
                  labelText: 'Jam',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: isLoading ? null : _handleSave,
                child: isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}