import 'bloc/apply_job_popup_bloc.dart';
import 'models/apply_job_popup_model.dart';
import 'package:flutter/material.dart';
import 'package:sachin_s_application1/core/app_export.dart';
import 'package:sachin_s_application1/widgets/custom_button.dart';

class ApplyJobPopupDialog extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<ApplyJobPopupBloc>(
        create: (context) => ApplyJobPopupBloc(
            ApplyJobPopupState(applyJobPopupModelObj: ApplyJobPopupModel()))
          ..add(ApplyJobPopupInitialEvent()),
        child: ApplyJobPopupDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: getHorizontalSize(302),
        padding: getPadding(all: 32),
        decoration: AppDecoration.fillWhiteA700
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgThumbsup11,
                  height: getSize(101),
                  width: getSize(101)),
              Padding(
                  padding: getPadding(top: 25),
                  child: Text("lbl_success".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPlusJakartaSansBold18
                          .copyWith(letterSpacing: getHorizontalSize(0.09)))),
              Padding(
                  padding: getPadding(top: 9),
                  child: Text("msg_your_applicatio".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPlusJakartaSansSemiBold14Bluegray400
                          .copyWith(letterSpacing: getHorizontalSize(0.07)))),
              CustomButton(
                  height: getVerticalSize(46),
                  width: getHorizontalSize(127),
                  text: "lbl_continue".tr,
                  margin: getMargin(top: 23),
                  shape: ButtonShape.RoundedBorder20,
                  padding: ButtonPadding.PaddingAll16,
                  fontStyle: ButtonFontStyle.PlusJakartaSansSemiBold14Gray50,
                  onTap: () {
                    onTapContinue(context);
                  })
            ]));
  }

  onTapContinue(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.appliedJobScreen,
    );
  }
}
