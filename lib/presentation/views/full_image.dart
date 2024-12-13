import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:tasks/constants.dart';


class FullImage extends StatelessWidget {
  const FullImage({Key? key, required this.imageurl,required this.hieght, required this.width,}) : super(key: key);

  final String imageurl;
  final num hieght;
  final num width;

  Future<void> downloadImage(BuildContext context, String url) async {
    try {
      final Directory downloadsDir = Directory('/storage/emulated/0/Download');
      String filePath = '${downloadsDir.path}/image_${DateTime.now().millisecondsSinceEpoch}.jpg';
      await Dio().download(url, filePath);
      showSnackBar(context, 'Download completed: $filePath');
    } catch (e) {
      showSnackBar(context, 'Error downloading image: $e');
    }
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ksecondary,
        actions: [
          IconButton(
            icon: const Icon(Icons.download,size: 35,color: korange,),
            onPressed: () {
              downloadImage(context, imageurl);
            },
          ),
        ],
      ),
      body: SizedBox(
        height: hieght.toDouble(),
        width: width.toDouble(),
        child: PhotoView(
          backgroundDecoration: const BoxDecoration(color: ksecondary),
          imageProvider: CachedNetworkImageProvider(imageurl),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 4.0,
          enableRotation: true,
          initialScale: PhotoViewComputedScale.contained,
        ),
      ),
    );
  }
}