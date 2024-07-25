import 'package:mock_api_demo/utils/dimensions.dart';
import 'package:mock_api_demo/utils/text_styles.dart';
import 'package:flutter/material.dart';
import '../../../utils/colors.dart';

class PrimaryButton extends StatelessWidget {
  final bool isDisable;
  final String btnName;
  final Color txtColor;
  final Color bgColor;
  final bool isExpend;
  final dynamic action;
  const PrimaryButton(
  {super.key,
        this.isDisable = false,
        required this.btnName,
        this.txtColor = Colors.white,
        this.bgColor = ColorPalettes.primaryColor,
        this.isExpend = false,
        required this.action});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimensions.size_5),
      child: Material(
        color: isDisable ? ColorPalettes.gray400 : bgColor,
        borderRadius: BorderRadius.circular(Dimensions.size_5),
        child: InkWell(
          onTap: isDisable ? null : action,
          child: isExpend ? Container(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.size_40, vertical: Dimensions.size_10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.size_5),
            ),
            child: Text(btnName,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.white13W700,
            ),
          ):Container(
            width: Dimensions.width,
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.size_40, vertical: Dimensions.size_10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.size_5),
            ),
            child: Text(btnName,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.white13W700,
            ),
          ),
        ),
      ),
    );
  }
}
