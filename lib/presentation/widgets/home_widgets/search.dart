import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/search_cubit/search_cubit.dart';
import '../../views/detailed.dart';


class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal:16,vertical: 16),
        child: IconButton(onPressed: (){
        showSearch(context: context, delegate: CustomSearch());
            }, icon: const Icon(Icons.search_outlined,size: 35,)),
      );
  }
}
class CustomSearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
   return [IconButton(onPressed: (){
     query='';
   },
       icon: const Icon(Icons.close))
   ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      close(context, null);
    },
        icon: const Icon(Icons.arrow_back));

  }

  Widget buildResults(BuildContext context) {
    // Call the search method to get the searched items.
    BlocProvider.of<SearchCubit>(context).getSearchedpopular(query: query);

    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchSuccess) {
          final results = state.popularModel.results;

          if (results == null || results.isEmpty) {
            return const Center(child: Text('No results found.'));
          }

          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              final person = results[index];
              final String fullImageUrl = person.profilePath != null
                  ? 'https://image.tmdb.org/t/p/w500${person.profilePath}'
                  : 'assets/placeholder.png';

              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: fullImageUrl,
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                title: Text(person.name ?? ''),
                subtitle: Text(person.knownForDepartment ?? ''),
                onTap: () {
                  // Navigate to the Detailed widget when an item is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Detailed(id: person.id!), // Pass the person's ID to the Detailed widget
                    ),
                  );
                },
              );
            },
          );
        } else if (state is SearchFauilre) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(child: Text('Start typing to search.'));
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(child: Text(''));
    }

    // Call the search method to get suggestions when the query is not empty
    BlocProvider.of<SearchCubit>(context).getSearchedpopular(query: query);

    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchSuccess) {
          final results = state.popularModel.results!.where((person) =>
              person.name!.toLowerCase().startsWith(query.toLowerCase())).toList();

          if (results.isEmpty) {
            return const Center(child: Text('No suggestions.'));
          }

          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              final person = results[index];
              final String fullImageUrl = person.profilePath != null
                  ? 'https://image.tmdb.org/t/p/w500${person.profilePath}'
                  : 'assets/placeholder.png';

              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: fullImageUrl,
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                title: Text(person.name ?? ''),
                subtitle: Text(person.knownForDepartment ?? ''),
                onTap: () {
                  // Navigate to the Detailed widget when an item is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Detailed(id: person.id!), // Pass the person's ID to the Detailed widget
                    ),
                  );
                },
              );
            },
          );
        } else if (state is SearchFauilre) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(child: Text('Search for people...'));
        }
      },
    );
  }
}
