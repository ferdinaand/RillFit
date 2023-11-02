class NotificationData {
  final String title;
  final String summary;
  final String type;
  final String timestamp;
  final bool success;

  NotificationData({
    required this.title,
    required this.summary,
    required this.type,
    required this.timestamp,
    required this.success,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      title: json['title'].toString(),
      summary: json['summary'].toString(),
      type: json['type'].toString(),
      timestamp: json['timestamp'].toString(),
      success: json['success'] as bool,
    );
  }
}
