import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoOverview extends StatelessWidget {
  const PhotoOverview({super.key, required this.imgPath});

  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
              alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      child: PhotoView(
        minScale: 0.4,
        imageProvider: CachedNetworkImageProvider(imgPath),
      ),
    )));
  }
}
