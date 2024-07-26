import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mock_api_demo/app/core/mobx/dashboard/dashboard_store.dart';
import 'package:mock_api_demo/utils/colors.dart';
import 'package:mock_api_demo/utils/dimensions.dart';
import 'package:mock_api_demo/utils/image_resource.dart';
import 'package:mock_api_demo/utils/text_styles.dart';
import 'package:mock_api_demo/view/commonWidget/buttons/primary_button.dart';
import 'package:mock_api_demo/view/commonWidget/header/header.dart';
import 'package:mock_api_demo/view/dashboard/cart/cart_screen.dart';
import 'package:mock_api_demo/view/dashboard/product/product_screen.dart';

class DashboardScreen extends StatefulWidget {
  final int selectedIndex;

  const DashboardScreen({super.key, this.selectedIndex = 0});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  var store = DashboardStore();

  @override
  void initState() {
    store.setCurrentIndex(widget.selectedIndex, 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: ColorPalettes.whiteColor,
        key: scaffoldKey,
        body: Observer(builder: (_) {
          return SafeArea(
            child: Column(
              children: [
                const Header(
                  showBackBtn: false,
                ),
                Expanded(child: body())
              ],
            ),
          );
        }),
        bottomNavigationBar: bottomNavCustom(),
      ),
    );
  }

  body() {
    switch (store.currentIndex) {
      case 0:
        return ProductScreen();
      case 1:
        return CartScreen();
      default:
        return comingSoonBody();
    }
  }

  comingSoonBody() {
    return Center(
      child: Text(
        "Coming Soon..",
        style: TextStyles.grey30014w400,
      ),
    );
  }

  bottomNavCustom() {
    return Observer(builder: (_) {
      return BottomNavigationBar(
          currentIndex: store.currentIndex,
          onTap: (i) => setState(() {
                store.categoryId = 0;
                store.currentIndex = i;
              }),
          backgroundColor: ColorPalettes.greyColorWithOpacity,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorPalettes.primaryColor,
          unselectedItemColor: ColorPalettes.greyColor,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(ImageResource.getImagePath("product.png"),
                    width: 22,
                    height: 22,
                    color: (store.currentIndex == 0)
                        ? ColorPalettes.primaryColor
                        : ColorPalettes.greyColor!),
                label: 'products'.tr()),
            BottomNavigationBarItem(
                icon: Image.asset(ImageResource.getImagePath("cart.png"),
                    width: 22,
                    height: 22,
                    color: (store.currentIndex == 1)
                        ? ColorPalettes.primaryColor
                        : ColorPalettes.greyColor!),
                label: 'cart'.tr()),
          ]);
    });
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) {
            return Container(
              color: Colors.transparent,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.size_30),
                  child: Material(
                    color: ColorPalettes.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.size_10),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Dimensions.globalHorizontalPadding,
                            vertical: Dimensions.size_15),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('exit'.tr(),
                                textAlign: TextAlign.center,
                                style: TextStyles.blue16w700),
                            const SizedBox(
                              height: Dimensions.size_10,
                            ),
                            Text('exit_message'.tr(),
                                textAlign: TextAlign.center,
                                style: TextStyles.grey12W400),
                            const SizedBox(
                              height: Dimensions.size_15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: PrimaryButton(
                                        btnName: 'no'.tr(),
                                        action: () {
                                          Navigator.of(context).pop(false);
                                        })),
                                const SizedBox(
                                  width: Dimensions.size_10,
                                ),
                                Expanded(
                                    child: PrimaryButton(
                                        btnName: 'yes'.tr(),
                                        action: () {
                                          Navigator.of(context).pop(true);
                                        }))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        )) ??
        false;
  }
}
