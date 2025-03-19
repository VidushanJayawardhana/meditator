class SleepExerciseModel {
  final String category;
  final String name;
  final String description;
  final String audioUrl;
  final int duration;

  SleepExerciseModel({
    required this.category,
    required this.name,
    required this.description,
    required this.audioUrl,
    required this.duration,
  });

  factory SleepExerciseModel.fromJson(Map<String, dynamic> json) {
    return SleepExerciseModel(
      category: json['category'],
      name: json['name'],
      description: json['description'],
      audioUrl: json['audio_url'],
      duration: json['duration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'name': name,
      'description': description,
      'audio_url': audioUrl,
      'duration': duration,
    };
  }
}
