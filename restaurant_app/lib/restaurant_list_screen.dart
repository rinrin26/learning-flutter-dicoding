import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_app/detail_restaurant.dart';
import 'package:restaurant_app/model/restaurant_model.dart';

class RestaurantListScreen extends StatelessWidget {
  static const routeName = '/restaura_list';
  const RestaurantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: const Text(
            'Restaurant App',
          ),
        ),
        body: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/local_restaurant.json'),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final List<RestaurantModel> restaurants =
                  parseRestaurantData(snapshot.data);
              print('data ===== ${restaurants}');
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Restaurant',
                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                    child: Text(
                      'Recomendation restaurant for you!',
                      style: Theme.of(context).textTheme.bodyLarge
                    ),
                  ),
                  Expanded(
                    child: buildListView(restaurants),
                  ),
                ],
              );
            } else {
              return const Center(child: Text('No data found.'));
            }
          },
        ));
  }

  Widget buildListView(List<RestaurantModel> restaurants) {
    return ListView.builder(
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        return _buildItemRestaurant(context, restaurants[index]);
      },
    );
  }

  Widget _buildItemRestaurant(
      BuildContext context, RestaurantModel restaurant) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Container(
        width: 100,
        height: 150,
        child: Image.network(
          restaurant.pictureId,
          fit: BoxFit.cover,
          width: 100,
          height: 100,
        ),
      ),
      title: Text(
        restaurant.name,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on),
              Text(
                restaurant.city,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 18,
                    ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Text(restaurant.rating.toString())
            ],
          )
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, DetailRestaurant.routeName,
            arguments: restaurant);
      },
    );
  }
}
