import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_api_demo/app/core/mobx/common/common_store.dart';
import 'package:mock_api_demo/app/core/mobx/dashboard/products/product_store.dart';
import 'package:mock_api_demo/app/routes/paths.dart';
import 'package:mock_api_demo/utils/colors.dart';
import 'package:mock_api_demo/utils/dimensions.dart';
import 'package:mock_api_demo/utils/text_styles.dart';
import 'package:mock_api_demo/view/commonWidget/custom_loader.dart';
import 'package:mock_api_demo/view/commonWidget/empty_screen.dart';
import 'package:mock_api_demo/view/commonWidget/load_image.dart';
import 'package:provider/provider.dart';

import '../../../app/core/models/product/product_data.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  final productStore = ProductStore();
  CommonStore? commonStore;

  @override
  Widget build(BuildContext context) {
    commonStore = Provider.of<CommonStore>(context);
    productStore.loadInitProduct(commonStore!);
    return Scaffold(
      body: SafeArea(child: Observer(
        builder: (_) {
          return Stack(
            children: [
              RefreshIndicator(
                onRefresh: () async {
                  commonStore!.authRepository.getProducts();
                },
                child: ListView.separated(
                  itemCount: productStore.products.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return productItemView(
                        context, productStore.products[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: Dimensions.size_10,
                    );
                  },
                ),
              ),
              if (productStore.products.isEmpty) const EmptyScreen(),
              (productStore.subLoaderShow)
                  ? const Center(child: CustomLoader())
                  : const SizedBox(),
            ],
          );
        },
      )),
    );
  }

  productItemView(BuildContext context, ProductData product) {
    return GestureDetector(
      onTap: () {
        var data = {"product": product};
        Navigator.pushNamed(context, Paths.productDetailScreen,
            arguments: data);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.globalHorizontalPadding),
        child: Container(
          color: ColorPalettes.itemViewColor,
          height: Dimensions.size_120,
          width: Dimensions.width!.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: Dimensions.width!.w * 0.25,
                child: Center(
                  child: LoadImage(
                    width: Dimensions.width!.w * 0.25,
                    height: Dimensions.size_120,
                    imageUrl: product.image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: Dimensions.size_10.w,
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product.name!,
                    style: TextStyles.black16w400,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text("${product.shortDescription}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.grey10W400),
                  const SizedBox(
                    height: Dimensions.size_2,
                  ),
                  Text("₹ ${product.price}", style: TextStyles.blue12w700),
                  const SizedBox(
                    height: Dimensions.size_5,
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
