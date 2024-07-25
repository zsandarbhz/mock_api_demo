import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_api_demo/app/core/local_db/entity/cart_item.dart';
import 'package:mock_api_demo/app/core/mobx/dashboard/cart/cart_store.dart';
import 'package:mock_api_demo/utils/app_toast.dart';
import 'package:mock_api_demo/utils/colors.dart';
import 'package:mock_api_demo/utils/dimensions.dart';
import 'package:mock_api_demo/utils/text_styles.dart';
import 'package:mock_api_demo/view/commonWidget/buttons/add_button.dart';
import 'package:mock_api_demo/view/commonWidget/buttons/primary_button.dart';
import 'package:mock_api_demo/view/commonWidget/custom_loader.dart';
import 'package:mock_api_demo/view/commonWidget/header/header.dart';
import 'package:mock_api_demo/view/commonWidget/load_image.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartStore store;

  @override
  void didChangeDependencies() {
    store = Provider.of<CartStore>(context, listen: false);
    store.loadInitData(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Observer(builder: (_) {
        return Stack(
          children: [
            _body(),
            (store.showLoader)
                ? const Center(child: CustomLoader())
                : const SizedBox(),
          ],
        );
      })),
    );
  }

  productItemView(BuildContext context, CartItem item) {
    return SizedBox(
      // height: Dimensions.size_100,
      width: Dimensions.width!.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            // color: Colors.amber,
            height: 75,
            width: 75,
            child: LoadImage(imageUrl: item.imageUrl),
          ),
          SizedBox(
            width: Dimensions.size_10.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: Dimensions.size_10,
                ),
                Text(
                  item.name,
                  style: TextStyles.blue11w700,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: Dimensions.size_2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "₹ ${item.price}",
                      style: TextStyles.blue11w700,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: Dimensions.size_15.w,
          ),
          Center(
            child: AddButton(
              count: item.quantity,
              increment: () {
                // commonStore.addProductInCart(product, qty);
                // setState(() {});
              },
              decrement: () {
                // if (item.quantity! >= 1) {
                //   store.removeToCart(item);
                //   setState(() {});
                // }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    return Observer(builder: (_) {
      return Stack(
        children: [
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: Dimensions.size_10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.globalHorizontalPadding),
                  child: Text(
                    'items'.tr(),
                    style: TextStyles.blue16w700,
                  ),
                ),
                const SizedBox(
                  height: Dimensions.size_5,
                ),
                Container(
                    color: ColorPalettes.itemViewColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.globalHorizontalPadding,
                        vertical: Dimensions.globalHorizontalPadding),
                    child: ListView.separated(
                      itemCount: store.cartList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return productItemView(context, store.cartList[index]);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                    )),
                const SizedBox(
                  height: Dimensions.size_10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.globalHorizontalPadding),
                    child: Text('order_details'.tr(),
                        style: TextStyles.blue11w700)),
                const SizedBox(
                  height: Dimensions.size_10,
                ),
                _orderDetailView(),
                const SizedBox(height: Dimensions.size_20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.globalHorizontalPadding),
                  child: PrimaryButton(btnName: "Confirm", action: (){
                    store.confirmOrder(context);
                  } ),
                ),
                const SizedBox(height: Dimensions.size_20,),
              ],
            ),
          ),
        ],
      );
    });
  }

  _orderDetailView() {
    return Container(
      color: ColorPalettes.itemViewColor,
      padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.globalHorizontalPadding,
          vertical: Dimensions.globalHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('item_total'.tr(), style: TextStyles.blue10w700),
              const Spacer(),
              Text('₹ ${store.totalPrice}', style: TextStyles.blue10w700),
            ],
          ),
          const SizedBox(height: Dimensions.size_2),
          Divider(
            color: ColorPalettes.greyColor,
            thickness: 1,
          ),
          const SizedBox(height: Dimensions.size_2),
          Row(
            children: [
              Text('total_pay'.toString().tr(), style: TextStyles.blue10w700),
              const Spacer(),
              Text('₹ ${store.totalPrice}', style: TextStyles.blue10w700),
            ],
          ),
        ],
      ),
    );
  }
}
