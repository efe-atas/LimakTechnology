import 'package:favorite_places/providers/place_provider.dart';
import 'package:favorite_places/screens/add_place.dart';
import 'package:favorite_places/widgets/favorite_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritePlaces extends ConsumerStatefulWidget {
  const FavoritePlaces({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PlacesScreenState();
  }

}
class _PlacesScreenState extends ConsumerState<FavoritePlaces> {

  late Future<void> _placesFuture; 

  @override
  void initState() {
    super.initState();
    _placesFuture = ref.read(favoritePlacesProvider.notifier).loadPlaces();
  }

  @override
  @override
  Widget build(BuildContext context) {

    final favoritePlaces = ref.watch(favoritePlacesProvider);



    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Your Places',
              style: Theme.of(context)
                  .textTheme
                  .apply(
                    bodyColor: Theme.of(context).colorScheme.onSurface,
                  )
                  .titleLarge,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AddPlace()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(future: _placesFuture ,builder: (context,snapshot) => snapshot.connectionState == ConnectionState.waiting ? const Center(child:  CircularProgressIndicator()) : FavoriteList(places: favoritePlaces )),),
      );
  }
}

