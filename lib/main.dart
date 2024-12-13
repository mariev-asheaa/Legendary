import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tasks/cubit/detailes_cubit/detailes_cubit.dart';
import 'package:tasks/cubit/images_cubit/images_cubit.dart';
import 'package:tasks/cubit/popular_cubit/popular_cubit.dart';
import 'package:tasks/presentation/views/home.dart';
import 'package:tasks/presentation/views/splash.dart';
import 'constants.dart';
import 'cubit/search_cubit/search_cubit.dart';
import 'models/favorites_provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoritesProvider()),
        ChangeNotifierProvider(create: (context) => PopularProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PopularCubit()),
        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(create: (context) => DetailesCubit()),
        BlocProvider(create: (context) => ImagesCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: ksecondary,
        ),
        debugShowCheckedModeBanner: false,
        home: const Splash(),
        routes: {
          Splash.id: (context) => const Splash(),
          Home.id: (context) =>const Home(),
           },
      ),
    );
  }
}
