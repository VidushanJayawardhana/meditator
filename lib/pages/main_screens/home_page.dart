import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:meditator/models/meditation_exercise_model.dart';
import 'package:meditator/models/mindfull_exercise_model.dart';
import 'package:meditator/provider/filter_provider.dart';
import 'package:meditator/utils/colors.dart';
import 'package:meditator/utils/text_styles.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<FilterProvider>(
          context,
          listen: false,
        ).getData(context),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primaryPurple),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error Loading Data"));
          } else {
            return Consumer<FilterProvider>(
              builder: (context, filterProvider, child) {
                final compleData = filterProvider.filterData;

                //shuffle data
                compleData.shuffle();

                return SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //App bar
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/meditation.png",
                                width: MediaQuery.of(context).size.width * 0.09,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "Meditator",
                                style: TextStyle(
                                  fontSize: 29,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryPurple,
                                ),
                              ),
                            ],
                          ),

                          //Select category text
                          const SizedBox(height: 10),
                          Text(
                            "Select a category to explore!",
                            style: AppTextStyle.subTitleStyle.copyWith(
                              color: AppColors.primaryDarkBlue,
                            ),
                          ),
                          const SizedBox(height: 10),

                          //Filter chips
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryPurple.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    //All
                                    FilterChip(
                                      label: Text(
                                        "All",
                                        style: TextStyle(
                                          color:
                                              filterProvider
                                                          .getSelectedCategory() ==
                                                      "All"
                                                  ? AppColors.primaryWhite
                                                  : Colors.black,
                                        ),
                                      ),
                                      onSelected: (bool value) {
                                        filterProvider.filteredData("All");
                                      },
                                      selected:
                                          filterProvider
                                              .getSelectedCategory() ==
                                          "All",
                                      selectedColor: AppColors.primaryPurple,
                                      showCheckmark: false,
                                      side: BorderSide(
                                        width: 2,
                                        color: AppColors.primaryPurple,
                                      ),
                                    ),
                                    const SizedBox(width: 10),

                                    //Mindfullness chip
                                    FilterChip(
                                      label: Text(
                                        "Mindfullness",
                                        style: TextStyle(
                                          color:
                                              filterProvider
                                                          .getSelectedCategory() ==
                                                      "Mindfull"
                                                  ? AppColors.primaryWhite
                                                  : Colors.black,
                                        ),
                                      ),
                                      onSelected: (value) {
                                        filterProvider.filteredData("Mindfull");
                                      },
                                      selected:
                                          filterProvider
                                              .getSelectedCategory() ==
                                          "Mindfull",
                                      selectedColor: AppColors.primaryPurple,
                                      showCheckmark: false,
                                      side: BorderSide(
                                        width: 2,
                                        color: AppColors.primaryPurple,
                                      ),
                                    ),
                                    const SizedBox(width: 10),

                                    //Meditation chip
                                    FilterChip(
                                      label: Text(
                                        "Meditation",
                                        style: TextStyle(
                                          color:
                                              filterProvider
                                                          .getSelectedCategory() ==
                                                      "Meditation"
                                                  ? AppColors.primaryWhite
                                                  : Colors.black,
                                        ),
                                      ),
                                      onSelected: (value) {
                                        filterProvider.filteredData(
                                          "Meditation",
                                        );
                                      },
                                      selected:
                                          filterProvider
                                              .getSelectedCategory() ==
                                          "Meditation",
                                      selectedColor: AppColors.primaryPurple,
                                      showCheckmark: false,
                                      side: BorderSide(
                                        width: 2,
                                        color: AppColors.primaryPurple,
                                      ),
                                    ),
                                    const SizedBox(width: 10),

                                    //Sleep chip
                                    FilterChip(
                                      label: Text(
                                        "Sleep Stories",
                                        style: TextStyle(
                                          color:
                                              filterProvider
                                                          .getSelectedCategory() ==
                                                      "Sleep"
                                                  ? AppColors.primaryWhite
                                                  : Colors.black,
                                        ),
                                      ),
                                      onSelected: (value) {
                                        filterProvider.filteredData("Sleep");
                                      },
                                      selected:
                                          filterProvider
                                              .getSelectedCategory() ==
                                          "Sleep",
                                      selectedColor: AppColors.primaryPurple,
                                      showCheckmark: false,
                                      side: BorderSide(
                                        width: 2,
                                        color: AppColors.primaryPurple,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          //Staggered grid
                          const SizedBox(height: 10),
                          if (compleData.isNotEmpty)
                            StaggeredGrid.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              children: [
                                ...filterProvider.filterData.map((data) {
                                  return GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            data is MeditationExerciseModel
                                                ? AppColors.primaryPurple
                                                : data is MindfullExerciseModel
                                                ? AppColors.primaryGreen
                                                : AppColors.primaryDarkBlue
                                                    .withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 10),
                                            Text(
                                              data.name,
                                              style: AppTextStyle.mainTitleStyle
                                                  .copyWith(
                                                    color:
                                                        AppColors.primaryWhite,
                                                  ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              "${data.duration.toString()} mins",
                                            ),
                                            const SizedBox(height: 10),
                                            Text(data.description),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
