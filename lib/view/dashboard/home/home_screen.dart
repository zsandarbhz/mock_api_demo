import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mock_api_demo/app/core/mobx/common/common_store.dart';
import 'package:mock_api_demo/app/core/mobx/dashboard/dashboard_store.dart';
import 'package:mock_api_demo/utils/common_functions.dart';
import 'package:mock_api_demo/view/commonWidget/custom_loader.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final DashboardStore store;

  const HomeScreen({super.key, required this.store});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CommonStore? commonStore;

  @override
  void didChangeDependencies() {
    commonStore = Provider.of<CommonStore>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Observer(
        builder: (context) {
          CommonFunctions.printLog("Observer-${commonStore!.showLoader}");
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                ),
              ),
              (commonStore!.showLoader)
                  ? const Center(child: CustomLoader())
                  : const SizedBox()
            ],
          );
        },
      ),
    ));
  }
}
