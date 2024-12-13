import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/constants.dart';
import '../../models/favorites_provider.dart';
import 'detailed.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    final favoriteItems = Provider.of<FavoritesProvider>(context).favoriteItems;
    final popularItems = Provider.of<PopularProvider>(context).popularItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: ksecondary,
      ),
      body: favoriteItems.isNotEmpty
          ? ListView.builder(
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          final id = favoriteItems[index];


          final allResults = popularItems.expand((model) => model.results!).toList();

          final item = allResults.firstWhere(
                (result) => result.id == id,
          );

          if (item == null) {
            // If item is not found, return a message
            return const ListTile(
              title: Text('Item not found'),
            );
          }

          // Construct the image URL
          final String fullImageUrl = item.profilePath != null
              ? 'https://image.tmdb.org/t/p/w500${item.profilePath}'
              : 'assets/placeholder.png';

          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: fullImageUrl,
                fit: BoxFit.fill,
                height: 50,
                width: 50,
                placeholder: (context, url) =>
                const CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error),
              ),
            ),
            title: Text(item.name ?? ''), // Accessing name directly
            subtitle: Text(item.knownForDepartment ?? ''), // Direct access
            trailing: Text('Popularity: ${item.popularity}'), // Direct access to popularity
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Detailed(id: id),
                ),
              );
            },
          );
        },
      )
          : const Center(child: Text('No favorite items')),
    );
  }
}
