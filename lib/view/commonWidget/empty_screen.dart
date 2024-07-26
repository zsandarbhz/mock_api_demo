
import 'package:mock_api_demo/utils/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('list_is_empty'.tr(),
        style: TextStyles.grey13w600,
      ),
    );
  }
}
