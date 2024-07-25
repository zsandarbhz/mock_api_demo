import 'package:flutter/material.dart';
import 'package:mock_api_demo/app/core/mobx/common/common_store.dart';
import 'package:mock_api_demo/utils/colors.dart';
import 'package:mock_api_demo/utils/dimensions.dart';
import 'package:mock_api_demo/utils/text_styles.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Dimensions.height = MediaQuery.of(context).size.height;
    Dimensions.width = MediaQuery.of(context).size.width;
    Provider.of<CommonStore>(context).initializeServices(context);
    return Scaffold(
      backgroundColor: ColorPalettes.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.height! * (0.05)),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Splash',
              style: TextStyles.blue20w800,
            )
          ],
          // height: 250,
        )),
      ),
    );
  }
}
