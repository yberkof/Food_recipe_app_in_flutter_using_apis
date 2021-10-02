import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipe_app/configuration/app_config.dart';
import 'package:recipe_app/models/recipe.dart';

import 'recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    if (AppConfig.instance.isDemo) {
      List<Recipe> _temp = [];
      _temp.add(Recipe(
          name: 'basta',
          totalTime: '20 Minutes',
          rating: 4.5,
          image:
              'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F9%2F2020%2F09%2F17%2Fcream-tomato-rigatoni-FT-RECIPE1020.jpg',
          cookDetails: [
            'In a deep frying pan, sauté steak in sunflower oil to desired doneness. Add garlic, tomato paste and cook for an additional 1 min.',
            'Add mushroom and crumble MAGGI® Chicken Stock with Natural Herbs over the steak and mushroom mixture. Add cooked pasta and toss together over medium heat for 1-2 mins.',
            'Stir in Parmesan cheese, remove from heat and serve.'
          ]));
      return _temp;
    }
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "HERE PUT YOUR RAPID API KEY",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}
