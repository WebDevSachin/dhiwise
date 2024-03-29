import '../models/listchineses_item_model.dart';
import 'package:flutter/material.dart';
import 'package:sachin_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class ListchinesesItemWidget extends StatelessWidget {
  ListchinesesItemWidget(this.listchinesesItemModelObj);

  ListchinesesItemModel listchinesesItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Text(
      listchinesesItemModelObj.chinesesTxt,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.left,
      style: AppStyle.txtPlusJakartaSansSemiBold16Gray900.copyWith(
        letterSpacing: getHorizontalSize(
          0.08,
        ),
      ),
    );
  }
}
