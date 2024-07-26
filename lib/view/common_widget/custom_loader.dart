import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_api_demo/utils/colors.dart';
import 'package:mock_api_demo/utils/dimensions.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 7.0,
        color: ColorPalettes.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.size_25),
          child: Lottie.asset('assets/animations/loader.json', height: 80),
        ),
      ),
    );
  }
}
