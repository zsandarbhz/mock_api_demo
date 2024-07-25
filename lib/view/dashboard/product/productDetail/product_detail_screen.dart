import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_api_demo/app/core/mobx/dashboard/products/productDetail/product_detail_store.dart';
import 'package:mock_api_demo/utils/colors.dart';
import 'package:mock_api_demo/utils/dimensions.dart';
import 'package:mock_api_demo/utils/text_styles.dart';
import 'package:mock_api_demo/view/commonWidget/buttons/add_button.dart';
import 'package:mock_api_demo/view/commonWidget/custom_loader.dart';
import 'package:mock_api_demo/view/commonWidget/header/header.dart';
import 'package:mock_api_demo/view/commonWidget/load_image.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final Map data;

  const ProductDetailScreen({super.key, required this.data});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late ProductDetailStore store;

  BuildContext? con;

  @override
  void didChangeDependencies() {
    store = Provider.of<ProductDetailStore>(context);
    store.loadInitData(widget.data["product"]);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    con = context;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Header(),
          Expanded(child: _productDetailsBody(context))
        ],
      )),
    );
  }

  _productDetailsBody(BuildContext context) {
    return Observer(builder: (_) {
      return Stack(children: <Widget>[
        SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _productView(),
            Divider(
              color: ColorPalettes.greyColor,
              thickness: 1,
            ),
            _description(),
            const SizedBox(
              height: 20,
            )
          ],
        )),
        (store.cartStore.showLoader)
            ? const Center(child: CustomLoader())
            : const SizedBox()
      ]);
    });
  }

  _productView() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.globalHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Dimensions.size_10.h,
          ),
          Center(
            child: LoadImage(
                height: Dimensions.width! * 0.9,
                width: Dimensions.width! * 0.9,
                imageUrl: store.product.image!),
          ),
          //customPlan(),
          SizedBox(
            height: Dimensions.size_20.h,
          ),
          Text(store.product.name!.toUpperCase(), style: TextStyles.blue20w800),
          // Text("${store.product.weight} ${store.product.unit}",
          //     style: TextStyles.blue14w400),
          const SizedBox(
            height: Dimensions.size_10,
          ),
          Row(
            children: [
              Text("₹ ${store.product.price!}", style: TextStyles.blue13w700),
              SizedBox(
                width: Dimensions.size_10.w,
              ),
              const Spacer(),
              AddButton(
                  count: store.productCount,
                  increment: () {
                    store.addToCart();
                  },
                  decrement: () {
                    // store.productCount = store.productCount - 1;
                  }),
            ],
          ),
          SizedBox(
            height: Dimensions.size_10.h,
          ),
        ],
      ),
    );
  }

  _description() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.globalHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Dimensions.size_5.h,
          ),
          Text("PRODUCT DESCRIPTION", style: TextStyles.blue10w700),
          SizedBox(
            height: Dimensions.size_5.h,
          ),
          Text(store.product.description!, style: TextStyles.grey10W400),
        ],
      ),
    );
  }
}
