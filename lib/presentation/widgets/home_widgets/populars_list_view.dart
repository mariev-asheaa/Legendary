import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tasks/cubit/popular_cubit/popular_cubit.dart';
import 'package:tasks/presentation/widgets/home_widgets/popular_item.dart';

class PopularsListView extends StatefulWidget {
  const PopularsListView({super.key});

  @override
  State<PopularsListView> createState() => _PopularsListViewState();
}

class _PopularsListViewState extends State<PopularsListView> {
  @override
  void initState() {
    BlocProvider.of<PopularCubit>(context).Persondata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<PopularCubit, PopularState>(
      builder: (context, state) {
        if(state is PopularLoading){
          return Container(
            height: MediaQuery.of(context).size.height , // Set a fixed height
            width: MediaQuery.of(context).size.width,
            child: Skeletonizer(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                return const PopularItem(image: 'assets/Photo Collage Instagram Post1.png',
                  name: 'majkdk', department: 'makks', popularity: 0, id: 0,);
              }),
            ),
          );
        }
        else if(state is PopularSuccess){
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                shrinkWrap: true,
              itemCount: state.popularModel.results!.length,
                itemBuilder: (context, index) {
                  return PopularItem(image:
                  'https://image.tmdb.org/t/p/w500${state.popularModel.results![index].profilePath ?? ''}',
                      name: state.popularModel.results![index].name??'',
                      department: state.popularModel.results![index].knownForDepartment??'',
                      popularity: state.popularModel.results![index].popularity??0,
                    id: state.popularModel.results![index].id??0,
                    );
                }),
          );
        }
        else{
          return const Text('There was an error loading data',style: TextStyle(
            color: Colors.black
          ),);
        }
      },
    );
  }
}
