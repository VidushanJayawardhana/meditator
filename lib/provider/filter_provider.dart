import 'package:flutter/material.dart';
import 'package:meditator/models/meditation_exercise_model.dart';
import 'package:meditator/models/mindfull_exercise_model.dart';
import 'package:meditator/models/sleep_exercise_model.dart';
import 'package:meditator/provider/meditation_provider.dart';
import 'package:meditator/provider/mindfull_exercise_provider.dart';
import 'package:meditator/provider/sleep_content_provider.dart';
import 'package:provider/provider.dart';

class FilterProvider extends ChangeNotifier {
  List<dynamic> _allData = [];
  List<dynamic> _filterData = [];
  String _selectedCategory = "All";

  //Get data from other providers
  Future<void> getData(BuildContext context) async {
    //wait until build method is running
    await Future.delayed(Duration.zero);

    //mindfull exercises
    final List<MindfullExerciseModel> mindfullExercises =
        Provider.of<MindfullExerciseProvider>(
          context,
          listen: false,
        ).mindfullExercises;
    //mindfull exercises
    final List<MeditationExerciseModel> meditationExercises =
        Provider.of<MeditationProvider>(
          context,
          listen: false,
        ).meditationExercise;

    //mindfull exercises
    final List<SleepExerciseModel> sleepExercises =
        Provider.of<SleepContentProvider>(
          context,
          listen: false,
        ).sleepExercises;

    _allData = [
      ...mindfullExercises,
      ...meditationExercises,
      ...sleepExercises,
    ];

    _filterData = _allData;

    notifyListeners();
  }

  //Getter
  List<dynamic> get filterData => _filterData;

  //method to filter data
  void filteredData(String category) {
    _selectedCategory = category;

    if (_selectedCategory == "All") {
      _filterData = _allData;
    } else if (_selectedCategory == "Meditation") {
      _filterData = _allData.whereType<MeditationExerciseModel>().toList();
    } else if (_selectedCategory == "Sleep") {
      _filterData = _allData.whereType<SleepExerciseModel>().toList();
    } else if (_selectedCategory == "Mindfull") {
      _filterData = _allData.whereType<MindfullExerciseModel>().toList();
    }

    notifyListeners();
  }

  //method to return selected category
  String getSelectedCategory() {
    return _selectedCategory;
  }
}
