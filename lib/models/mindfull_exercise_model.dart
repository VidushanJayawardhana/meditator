class MindfullExerciseModel {
  final String category;
  final String name;
  final String description;
  final List<String> instructions;
  final int duration;
  final String instructionsUrl;
  final String imagePath;

  MindfullExerciseModel({
    required this.category,
    required this.name,
    required this.description,
    required this.instructions,
    required this.duration,
    required this.instructionsUrl,
    required this.imagePath,
  });

  //method to convert the json data to a MindfullExerciseModel object
  factory MindfullExerciseModel.fromJson(Map<String, dynamic> json) {
    return MindfullExerciseModel(
      category: json['category'],
      name: json['name'],
      description: json['description'],
      instructions: List<String>.from(json['instructions']),
      duration: json['duration'],
      instructionsUrl: json['instruction_url'],
      imagePath: json['image_path'],
    );
  }

  //method to convert the MindfullExerciseModel object to a json
  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'name': name,
      'description': description,
      'instructions': instructions,
      'duration': duration,
      'instruction_url': instructionsUrl,
      'image_path': imagePath,
    };
  }
}
