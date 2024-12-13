import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tasks/constants.dart';
import 'package:tasks/cubit/images_cubit/images_cubit.dart';
import 'package:tasks/presentation/views/full_image.dart';
import '../../cubit/detailes_cubit/detailes_cubit.dart';

class Detailed extends StatefulWidget {
   Detailed({super.key,required this.id});
  num id;
  @override
  State<Detailed> createState() => _DetailedState();
}

class _DetailedState extends State<Detailed> {
  @override
  void initState() {
    BlocProvider.of<DetailesCubit>(context).detailes(id: widget.id);
    BlocProvider.of<ImagesCubit>(context).images(id: widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:  BlocBuilder<DetailesCubit, DetailesState>(
  builder: (context, state) {
    if(state is DetailesLoading){
      return const Center(child: CircularProgressIndicator(),);
    }

    else if(state is DetailesSucces){
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               IconButton(icon:const Icon(Icons.arrow_back,size: 30),
                onPressed: () {
                 Navigator.pop(context);
                },),
               Text(state.detailesModel.name??'More info about:',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,fontSize: 40,
                    fontStyle:FontStyle.italic,
                color: kred
                ),),
              SizedBox(
                height: 400,
                child: BlocBuilder<ImagesCubit, ImagesState>(
                 builder: (context, state) {
                      if(state is ImagesLoading){
                  return Skeletonizer(
                      child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return Image.asset('assets/Photo Collage Instagram Post1.png',height: 150,width: 100,);
                  }
                  ));
                }
                 else if(state is ImagesSuccess){
                     return ListView.builder(
                   scrollDirection: Axis.horizontal,
                     itemCount:state.imagesModel.profiles!.length,
                    itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: InkWell(
                          onTap: (){
                           Navigator.push(context, MaterialPageRoute(
                             builder: (context) =>FullImage(imageurl: "https://image.tmdb.org/t/p/w500${state.imagesModel.profiles![index].filePath ?? ''}",
                               hieght: state.imagesModel.profiles![index].height??0, width: state.imagesModel.profiles![index].width??0,
                             ),
                           ));
                          },
                          child: CachedNetworkImage(
                            imageUrl: "https://image.tmdb.org/t/p/w500${state.imagesModel.profiles![index].filePath ?? ''}",
                               ),
                        ),
                      ),
                    );
                    });
                    }else{
                       return const Icon(Icons.error);
                         }
                },),
              ),
              const SizedBox(height: 30,),
              const Text('More Info About',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle:FontStyle.italic,
                color: kprimary
                ),
              ),
              const SizedBox(height: 20,),
              Text("Birthday: ${state.detailesModel.birthday??'Unknown'}",
                style: const TextStyle(fontSize: 22,color: korange),
              ),
              Text("Born at: ${state.detailesModel.placeOfBirth??'Unknown'}",
                style: const TextStyle(fontSize: 22,color:korange),
              ),

               Padding(
                 padding: const EdgeInsets.only(bottom: 10),
                 child: Text("Known as: ${state.detailesModel.alsoKnownAs?[0]??'Unknown'}",
                  style: const TextStyle(fontSize: 22,color: korange),
                               ),
               ),

              Text(state.detailesModel.biography??'',
                style: const TextStyle(
                    fontSize: 18,
                color: kprimary
                ),
              ),
            ],
          ),
        ),
      );
    }
    else{
      return const Text('There was an error');
    }
  },
)
      ),
    );
  }
}
