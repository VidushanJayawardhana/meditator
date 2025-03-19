class MeditationExerciseModel {
  final String category;
  final String name;
  final String description;
  final int duration;
  final String audioUrl;
  final String videoUrl;

  MeditationExerciseModel({
    required this.category,
    required this.name,
    required this.description,
    required this.duration,
    required this.audioUrl,
    required this.videoUrl,
  });

  //method to convert json to MeditationExerciseModel object
  factory MeditationExerciseModel.fromJson(Map<String, dynamic> json) {
    return MeditationExerciseModel(
      category: json['category'],
      name: json['name'],
      description: json['description'],
      duration: json['duration'],
      audioUrl: json['audio_url'],
      videoUrl: json['video_url'],
    );
  }

  //method to convert MeditationExerciseModel object to json
  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'name': name,
      'description': description,
      'duration': duration,
      'audio_url': audioUrl,
      'video_url': videoUrl,
    };
  }
}
