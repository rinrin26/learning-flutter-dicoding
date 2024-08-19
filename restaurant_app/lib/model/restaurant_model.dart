import 'dart:convert';

class RestaurantModel {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  Menu menu;
  RestaurantModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.pictureId,
      required this.city,
      required this.rating,
      required this.menu});

  factory RestaurantModel.fromJson(Map<String, dynamic> restaurant) {
    double parsedRating;
    if (restaurant['rating'] is int) {
      parsedRating = (restaurant['rating'] as int).toDouble();
    } else {
      parsedRating = restaurant['rating'];
    }
      return RestaurantModel(
          id: restaurant['id'],
          name: restaurant['name'],
          description: restaurant['description'],
          pictureId: restaurant['pictureId'],
          city: restaurant['city'],
          rating: parsedRating,
          menu: Menu.fromJson(restaurant['menus']));
}
}

class Menu {
  List<Food> foods;
  List<Drink> drinks;
  Menu({required this.foods, required this.drinks});

  factory Menu.fromJson(Map<String, dynamic> menu) => Menu(
        foods:
            List<Food>.from(menu['foods'].map((item) => Food.fromJson(item))),
        drinks: List<Drink>.from(
            menu['drinks'].map((item) => Drink.fromJson(item))),
      );
}

class Food {
  String name;
  Food({required this.name});
  factory Food.fromJson(Map<String, dynamic> food) => Food(
        name: food['name'],
      );
}

class Drink {
  String name;
  Drink({required this.name});
  factory Drink.fromJson(Map<String, dynamic> drink) => Drink(
        name: drink['name'],
      );
}


List<RestaurantModel> parseRestaurantData(String? json) {
  if (json == null) {
    return [];
  }
   final Map<String, dynamic> jsonMap = jsonDecode(json);

  // Access the 'restaurants' list inside the Map
  final List<dynamic> restaurantsJson = jsonMap['restaurants'];

  // Parse the list into a list of RestaurantModel objects
  return restaurantsJson
      .map<RestaurantModel>((json) => RestaurantModel.fromJson(json))
      .toList();
  // print('data RestaurantModel==== ${json}');
  // final List parsed = jsonDecode(json);
  //  print('data RestaurantModel==== ${parsed}');
  // return parsed.map((json) => RestaurantModel.fromJson(json)).toList();
}
