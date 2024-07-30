import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class FavoritePlace extends StatelessWidget {
  const FavoritePlace({super.key, required this.place});
  final Place place;


  String get locationImage{
    
    final lat = place.location.latitude;
    final lng = place.location.longitude;
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$lng&key=AIzaSyD49vqirOkEhoPOC9_GAQBC5JJhtzu1WTQ';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '${place.title}',
              style: Theme.of(context)
                  .textTheme
                  .apply(
                    bodyColor: Theme.of(context).colorScheme.onSurface,
                  )
                  .titleLarge,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Image.file(
            place.image,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(children: [
              GestureDetector
              (onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapScreen(location: place.location,isSelecting: false,)));
              },child: CircleAvatar(radius: 70,backgroundImage: NetworkImage(locationImage),)),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                 gradient: LinearGradient(
                    colors: [Colors.black54, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Text(
                  place.location.address,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
