import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mock_api_demo/app/core/mobx/common/common_store.dart';
import 'package:mock_api_demo/utils/colors.dart';
import 'package:mock_api_demo/utils/dimensions.dart';
import 'package:mock_api_demo/utils/image_resource.dart';
import 'package:mock_api_demo/utils/text_styles.dart';
import 'package:provider/provider.dart';

class Header extends StatefulWidget {
  final String title;
  final bool showBackBtn;

  const Header({super.key, this.title = "", this.showBackBtn = true});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  late CommonStore commonStore;

  @override
  void didChangeDependencies() {
    commonStore = Provider.of<CommonStore>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.size_50,
      child: Observer(builder: (_) {
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Dimensions.size_10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.showBackBtn)
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                          height: Dimensions.size_50,
                          width: Dimensions.size_22,
                          child: Center(
                            child: Image.asset(
                              ImageResource.getImagePath("back.png"),
                              height: Dimensions.size_22,
                              width: Dimensions.size_22,
                            ),
                          ),
                        ),
                      ),
                    if (!widget.showBackBtn)
                      Text(
                        "Hi, Guest",
                        style: TextStyles.blue11w700,
                      ),
                    const Spacer()
                  ],
                ),
              ),
            ),
            Container(
              height: 1,
              width: Dimensions.width!,
              color: ColorPalettes.borderColor,
            )
          ],
        );
      }),
    );
  }

}
