import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:meal_app/providers/language_provider.dart';
import 'package:meal_app/used_data.dart';
import 'package:provider/provider.dart';
import 'package:meal_app/providers/meal_provider.dart';

class MealDetailsScreen extends StatelessWidget {
  static const String id = 'MealDetailsScreen';
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = usedMeals.firstWhere((meal) {
      return meal.id == mealId;
    });
    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    double screenWidth = MediaQuery.of(context).size.width;
    var langProvider = Provider.of<LanguageProvider>(context);
    List<String> ingredientList =
        langProvider.getTexts('ingredients-$mealId') as List<String>;
    List<String> stepsList =
        langProvider.getTexts('steps-$mealId') as List<String>;

    var ingredientsTitle = titleContainer(
      context,
      langProvider.getTexts('Ingredients'),
    );

    var ingredientsContent = Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      height: 190,
      width: isLandScape ? (screenWidth / 2) - 20 : screenWidth - 40,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListView.builder(
        padding: EdgeInsets.all(0.0),
        itemCount: ingredientList.length,
        itemBuilder: (context, index) {
          return Card(
            color: Theme.of(context).accentColor,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Text(
                ingredientList[index],
                style: TextStyle(
                    color: useWhiteForeground(Theme.of(context).accentColor)
                        ? Colors.white
                        : Colors.black),
              ),
            ),
          );
        },
      ),
    );
    var stepsTitle = titleContainer(
      context,
      langProvider.getTexts('Steps'),
    );
    var stepsContent = Container(
      height: isLandScape ? 190 : 228,
      width: isLandScape ? (screenWidth / 2) - 20 : screenWidth,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListView.builder(
        padding: EdgeInsets.all(0.0),
          itemCount: stepsList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor:
                        Theme.of(context).primaryColor.withOpacity(0.9),
                  ),
                  title: Text(
                    '${stepsList[index]}',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Divider(
                  height: 3.0,
                  thickness: 2.0,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ],
            );
          }),
    );

    return Directionality(
      textDirection:
          langProvider.isEnglish ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     langProvider.getTexts('meal-$mealId'),
        //   ),
        // ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: false,
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  langProvider.getTexts('meal-$mealId'),
                ),
                background: InteractiveViewer(
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder:
                        AssetImage('assets/images/alternative_image.png'),
                    image: NetworkImage(
                      selectedMeal.imageUrl,
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  if (isLandScape)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            ingredientsTitle,
                            ingredientsContent,
                          ],
                        ),
                        Column(
                          children: [
                            stepsTitle,
                            stepsContent,
                          ],
                        ),
                      ],
                    ),
                  if (!isLandScape)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ingredientsTitle,
                        ingredientsContent,
                        stepsTitle,
                        stepsContent,
                      ],
                    ),
                  SizedBox(
                    height: 15.0,
                  )
                ],
              ),
            ),
          ],
        ),
        // body: SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       Container(
        //         height: 200,
        //         width: double.infinity,
        //         margin: EdgeInsets.only(bottom: 20.0),
        //         child: Hero(
        //           tag: 'mealImage$mealId',
        //           child: InteractiveViewer(
        //
        //             child: FadeInImage(
        //               fit: BoxFit.cover,
        //               placeholder: AssetImage('assets/images/alternative_image.png'),
        //               image:NetworkImage(
        //                 selectedMeal.imageUrl,
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //       if (isLandScape)
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Column(
        //               children: [
        //                 ingredientsTitle,
        //                 ingredientsContent,
        //               ],
        //             ),
        //             Column(
        //               children: [
        //                 stepsTitle,
        //                 stepsContent,
        //               ],
        //             ),
        //           ],
        //         ),
        //       if (!isLandScape)
        //         Column(
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             ingredientsTitle,
        //             ingredientsContent,
        //             stepsTitle,
        //             stepsContent,
        //           ],
        //         ),
        //       SizedBox(
        //         height: 20.0,
        //       )
        //     ],
        //   ),
        // ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).accentColor,
          onPressed: () {
            Provider.of<MealProvider>(context, listen: false)
                .toggleFavorites(mealId);
          },
          child: Provider.of<MealProvider>(context, listen: true)
                  .isFavoriteMeal(mealId)
              ? Icon(
                  Icons.star,
                  color: Theme.of(context).primaryColor,
                )
              : Icon(Icons.star_border),
        ),
      ),
    );
  }

  Container titleContainer(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
