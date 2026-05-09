class Jadwal {
  String id;
  String course;
  String lecturer;
  String day;
  String time;
  String imageBase64;

  Jadwal({
    this.id = '',
    required this.course,
    required this.lecturer,
    required this.day,
    required this.time,
    required this.imageBase64,
  });

  Map<String, dynamic> toMap() {
    return {
      'course': course,
      'lecturer': lecturer,
      'day': day,
      'time': time,
      'image_base64': imageBase64,
    };
  }

  factory Jadwal.fromMap(String id, Map<String, dynamic> data) {
    return Jadwal(
      id: id,
      course: data['course'],
      lecturer: data['lecturer'],
      day: data['day'],
      time: data['time'],
      imageBase64: data['image_base64'],
    );
  }
}