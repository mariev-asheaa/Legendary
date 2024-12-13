import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasks/constants.dart';
import 'package:tasks/presentation/views/home.dart';
import 'package:tasks/core/button.dart';
import 'package:tasks/presentation/widgets/splash_widgets/animated_text.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});
static String id ='splash';
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool _imageLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  // Function to load the image
  void _loadImage() async {
    await precacheImage(const AssetImage('assets/Photo Collage Instagram Post1.png'
    ), context);
    setState(() {
      _imageLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Stack(
    children: [
       Align(
      child: Image.asset('assets/Photo Collage Instagram Post1.png',
    fit: BoxFit.fitHeight,
        height: MediaQuery.of(context).size.height,
       ),
         ),

    Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: button(ontap: (){
          Navigator.pushNamed(context, Home.id);
        },
            label: 'Get Start',
            color: ksecondary,style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
              color: kprimary
          ),
        h:55 ,w: 360,
        ),
      ),
    ),
      const Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: 190),
          child:AnimatedText(),
        ),
      ),
    ],
    ),
    );
  }
}
