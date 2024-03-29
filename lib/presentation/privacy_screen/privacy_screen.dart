import 'bloc/privacy_bloc.dart';
import 'models/privacy_model.dart';
import 'package:flutter/material.dart';
import 'package:sachin_s_application1/core/app_export.dart';
import 'package:sachin_s_application1/widgets/app_bar/appbar_image.dart';
import 'package:sachin_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:sachin_s_application1/widgets/app_bar/custom_app_bar.dart';

class PrivacyScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<PrivacyBloc>(
        create: (context) =>
            PrivacyBloc(PrivacyState(privacyModelObj: PrivacyModel()))
              ..add(PrivacyInitialEvent()),
        child: PrivacyScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrivacyBloc, PrivacyState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: ColorConstant.whiteA70002,
              appBar: CustomAppBar(
                  height: getVerticalSize(51),
                  leadingWidth: 48,
                  leading: AppbarImage(
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgArrowleft,
                      margin: getMargin(left: 24, top: 13, bottom: 14),
                      onTap: () {
                        onTapArrowleft17(context);
                      }),
                  centerTitle: true,
                  title: AppbarTitle(text: "msg_legel_and_polic".tr)),
              body: Container(
                  width: double.maxFinite,
                  padding: getPadding(left: 24, right: 24),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: getPadding(top: 30),
                            child: Text("lbl_terms".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPlusJakartaSansBold16
                                    .copyWith(
                                        letterSpacing:
                                            getHorizontalSize(0.08)))),
                        Container(
                            width: getHorizontalSize(307),
                            margin: getMargin(top: 11, right: 19),
                            child: Text("msg_lorem_ipsum_dol8".tr,
                                maxLines: null,
                                textAlign: TextAlign.left,
                                style: AppStyle
                                    .txtPlusJakartaSansMedium14Bluegray40087
                                    .copyWith(
                                        letterSpacing:
                                            getHorizontalSize(0.07)))),
                        Container(
                            width: getHorizontalSize(307),
                            margin: getMargin(top: 4, right: 19),
                            child: Text("msg_lorem_ipsum_dol8".tr,
                                maxLines: null,
                                textAlign: TextAlign.left,
                                style: AppStyle
                                    .txtPlusJakartaSansMedium14Bluegray40087
                                    .copyWith(
                                        letterSpacing:
                                            getHorizontalSize(0.07)))),
                        Padding(
                            padding: getPadding(top: 21),
                            child: Text("msg_changes_to_the".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPlusJakartaSansBold16
                                    .copyWith(
                                        letterSpacing:
                                            getHorizontalSize(0.08)))),
                        Container(
                            height: getVerticalSize(298),
                            width: getHorizontalSize(307),
                            margin: getMargin(top: 7),
                            child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                          width: getHorizontalSize(307),
                                          child: Text("msg_lorem_ipsum_dol8".tr,
                                              maxLines: null,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPlusJakartaSansMedium14Bluegray40087
                                                  .copyWith(
                                                      letterSpacing:
                                                          getHorizontalSize(
                                                              0.07))))),
                                  Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                          width: getHorizontalSize(307),
                                          child: Text("msg_lorem_ipsum_dol8".tr,
                                              maxLines: null,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPlusJakartaSansMedium14Bluegray40087
                                                  .copyWith(
                                                      letterSpacing:
                                                          getHorizontalSize(
                                                              0.07)))))
                                ]))
                      ]))));
    });
  }

  onTapArrowleft17(BuildContext context) {
    NavigatorService.goBack();
  }
}
