import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';
import 'package:favorite_places/screens/favorite_place.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
          child: Text(
        'No places added yet',
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Theme.of(context).colorScheme.onSurface),
      ));
    }

    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            radius: 26,
            backgroundImage: FileImage(places[index].image),
          ),
          title: Text(places[index].title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface)),
          subtitle: Text(places[index].location.address,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface)),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FavoritePlace(
                      place: places[index],
                    )));
          },
        );
      },
    );
  }
}
