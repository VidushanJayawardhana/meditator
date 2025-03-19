import 'package:flutter/material.dart';
import 'package:meditator/provider/mindfull_exercise_provider.dart';
import 'package:meditator/utils/colors.dart';
import 'package:meditator/utils/text_styles.dart';
import 'package:provider/provider.dart';

class MindfullExercisePage extends StatelessWidget {
  const MindfullExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mindfull Exercises",
          style: TextStyle(
            color: AppColors.primaryPurple,
            fontSize: 29,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(color: AppColors.primaryPurple),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(color: AppColors.primaryPurple),
                    ),
                  ),
                  onChanged: (value) {
                    Provider.of<MindfullExerciseProvider>(
                      context,
                      listen: false,
                    ).findMindfullExercise(value);
                  },
                ),
                const SizedBox(height: 10),

                //Search list
                Consumer<MindfullExerciseProvider>(
                  builder: (context, mindfullExerciseProvider, child) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          mindfullExerciseProvider.mindfullExercises.length,
                      itemBuilder: (context, index) {
                        final singleMindfullExercise =
                            mindfullExerciseProvider.mindfullExercises[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryDarkBlue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              leading: ClipRRect(
                                child: Image.asset(
                                  singleMindfullExercise.imagePath,
                                  fit: BoxFit.cover,
                                  width:
                                      MediaQuery.of(context).size.width * 0.14,
                                  height:
                                      MediaQuery.of(context).size.height * 0.8,
                                ),
                              ),
                              title: Text(
                                singleMindfullExercise.name,
                                style: AppTextStyle.mainTitleStyle,
                              ),
                              subtitle: Text(
                                "${singleMindfullExercise.duration.toString()} mins",
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
