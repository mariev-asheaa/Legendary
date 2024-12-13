import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tasks/constants.dart';
import 'package:tasks/presentation/views/detailed.dart';

import '../../../models/favorites_provider.dart';

class PopularItem extends StatefulWidget {
  const PopularItem({super.key, required this.image, required this.name,
    required this.department, required this.popularity, required this.id
  });
final String image;
  final String name;
  final String department;
final num popularity;
final num id;
  @override
  State<PopularItem> createState() => _PopularItemState();
}

class _PopularItemState extends State<PopularItem> {

  @override
  Widget build(BuildContext context) {

    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    bool isFavorite = favoritesProvider.favoriteItems.contains(widget.id);

    final String fullImageUrl = widget.image.isNotEmpty
        ? 'https://image.tmdb.org/t/p/w500${widget.image}'
        : 'assets/placeholder.png';
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:(builder) =>
            Detailed(id: widget.id)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 16),
        child: SizedBox(
          height: 160,
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),

            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                   imageUrl: fullImageUrl,
                    fit: BoxFit.fill,
                    height: 150,
                    width: 140,
                    placeholder: (context, url) =>  Skeletonizer(child: Image.asset('assets/Photo Collage Instagram Post1.png',height: 150,width: 140,)), // For loading
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                const SizedBox(width: 10),

                 Expanded(
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 3,
                            child: Text(
                              widget.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25,
                                color:kred
                              ),
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              setState(() {
                                if (isFavorite) {
                                  favoritesProvider.removeFavorite(widget.id);
                                } else {
                                  favoritesProvider.addFavorite(widget.id);
                                }
                              });
                              },
                            child: isFavorite
                                ? const Icon(Icons.favorite, color: kred)
                                : const Icon(Icons.favorite_border),)
                        ],
                      ),
                      Text(widget.department,style:
                      const TextStyle( fontSize: 20,color: kprimary)
                        ,),
                      const SizedBox(height: 5,),
                      Text('Popularity:${widget.popularity}',style:
                      const TextStyle( fontSize: 20,color: kprimary)
                        ,),
                    ],
                   ),
                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
