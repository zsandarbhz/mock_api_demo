import 'package:flutter/material.dart';
import 'package:mock_api_demo/utils/dimensions.dart';
import 'package:mock_api_demo/utils/text_styles.dart';

import '../../../utils/colors.dart';

class AddButton extends StatelessWidget {
  final bool isDisable;
  final String btnName;
  final Color txtColor;
  final Color bgColor;
  final int count;
  final dynamic increment;
  final dynamic decrement;

  const AddButton(
      {super.key,
      this.isDisable = false,
      this.btnName = "Add",
      this.txtColor = ColorPalettes.primaryColor,
      this.bgColor = ColorPalettes.whiteColor,
      this.count = 0,
      required this.increment,
      required this.decrement});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimensions.size_5),
      child: Material(
        color: bgColor,
        borderRadius: BorderRadius.circular(Dimensions.size_5),
        child: Container(
          width: Dimensions.width! * 0.25,
          height: Dimensions.size_28,
          // padding: const EdgeInsets.symmetric(horizontal: Dimensions.size_5, vertical: Dimensions.size_5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.size_5),
              border: Border.all(
                  color: isDisable
                      ? ColorPalettes.borderColor
                      : ColorPalettes.primaryColor,
                  width: 1)),
          child: count == 0
              ? InkWell(
                  onTap: isDisable ? null : increment,
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.size_5,
                          vertical: Dimensions.size_5),
                      child: Text(btnName.toUpperCase(),
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: isDisable
                              ? TextStyles.grey11w700
                              : TextStyles.blue11w700),
                    ),
                  ),
                )
              : Row(
                  children: [
                    GestureDetector(
                      onTap: decrement,
                      child: SizedBox(
                          height: Dimensions.size_30,
                          width: Dimensions.size_30,
                          child: Center(
                            child: Icon(
                              Icons.remove,
                              color: isDisable
                                  ? ColorPalettes.greyColor
                                  : ColorPalettes.primaryColor,
                              size: 20,
                            ),
                          )),
                    ),
                    Expanded(
                        child: Center(
                            child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.size_5,
                          vertical: Dimensions.size_5),
                      child: Text(
                        "$count",
                        style: isDisable
                            ? TextStyles.grey11w700
                            : TextStyles.blue11w700,
                      ),
                    ))),
                    GestureDetector(
                        onTap: increment,
                        child: SizedBox(
                            height: Dimensions.size_30,
                            width: Dimensions.size_30,
                            child: Center(
                              child: Icon(Icons.add,
                                  color: isDisable
                                      ? ColorPalettes.gray
                                      : ColorPalettes.primaryColor,
                                  size: 20),
                            )))
                  ],
                ),
        ),
      ),
    );
  }
}
