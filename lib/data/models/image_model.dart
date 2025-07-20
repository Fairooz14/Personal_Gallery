class ImageModel {
  final String url;
  final String label;
  final DateTime uploadedAt;

  ImageModel({
    required this.url,
    required this.label,
    required this.uploadedAt,
  });

  factory ImageModel.fromMap(Map<dynamic, dynamic> map) {
    return ImageModel(
      url: map['url'] ?? '',
      label: map['label'] ?? '',
      uploadedAt: DateTime.parse(map['uploaded_at'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'label': label,
      'uploaded_at': uploadedAt.toIso8601String(),
    };
  }
}
