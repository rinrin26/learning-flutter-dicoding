import 'package:flutter/material.dart';
import 'package:restaurant_app/detail_restaurant.dart';
import 'package:restaurant_app/model/restaurant_model.dart';
import 'package:restaurant_app/restaurant_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Restaurant app',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const RestaurantListScreen(),
      initialRoute: RestaurantListScreen.routeName ,
      routes: {
        RestaurantListScreen.routeName: (context) => const RestaurantListScreen(),
        DetailRestaurant.routeName: (context) => DetailRestaurant(
              restaurant: ModalRoute.of(context)?.settings.arguments as RestaurantModel,
            ),
      },
      
    );
  }
}
