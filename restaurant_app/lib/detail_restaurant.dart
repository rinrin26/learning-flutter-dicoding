import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant_model.dart';

class DetailRestaurant extends StatefulWidget {
  static const routeName = '/article_detail';
  final RestaurantModel restaurant;
  const DetailRestaurant({super.key, required this.restaurant});

  @override
  State<StatefulWidget> createState() => _DetailRestaurantState();
}

class _DetailRestaurantState extends State<DetailRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 250.0,
                  child: Image.network(
                    widget.restaurant.pictureId,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  widget.restaurant.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_on),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.restaurant.city,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 18,
                          ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  widget.restaurant.description,
                  style: const TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 7,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Menu',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Foods',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Flexible(
                        fit: FlexFit.loose,
                        child: _renderMenus(
                            context, widget.restaurant.menu.foods)),
                    const Text(
                      'Drinks',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Flexible(
                        fit: FlexFit.loose,
                        child: _renderMenus(
                            context, widget.restaurant.menu.drinks))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
Widget _renderMenus(BuildContext context, List<dynamic> items) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: items.length,
        shrinkWrap: true, 
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            color: const Color(0xFFCFD2E4),
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Icon(Icons.food_bank,size: 50,), 
                  const SizedBox(height: 8.0), 
                  Text(
                    item.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

 }
