import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasks/presentation/widgets/home_widgets/home_body.dart';


class Home extends StatelessWidget {
  const Home({super.key});
static String id='home';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
     body:SafeArea(child: HomeBody())
    );
  }
}
