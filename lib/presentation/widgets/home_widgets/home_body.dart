import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/presentation/widgets/home_widgets/populars_list_view.dart';
import 'package:tasks/presentation/widgets/home_widgets/search.dart';
import '../../../constants.dart';
import '../../../models/favorites_provider.dart';
import '../../../models/popular_model.dart';
import '../../views/favourite.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key,});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    super.initState();

    Provider.of<PopularProvider>(context, listen: false).fetchPopularItems();
  }

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
    SliverToBoxAdapter(
    child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              const Search(),
      IconButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Builder(
                builder: (context) => const Favourite(),
              ),
            ),
          );
        },
        icon: const Icon(
          Icons.favorite,
          color: kred,
          size: 35,
        ),
      )
            ],
          ),
         const PopularsListView(),
        ],
      )
      ,)
        ,]
    );
  }
}
