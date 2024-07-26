import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mock_api_demo/utils/image_resource.dart';

class LoadImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final BoxFit fit;

  const LoadImage(
      {super.key,
      required this.imageUrl,
      this.height = 100,
      this.width = 100,
      this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => const Center(
        child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeAlign: 1,
            )),
      ),
      errorWidget: (context, url, error) => Image.asset(
        ImageResource.getImagePath('product.png'),
        fit: BoxFit.cover,
      ),
    );
  }
}
