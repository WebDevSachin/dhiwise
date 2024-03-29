import 'bloc/sign_up_create_acount_bloc.dart';
import 'models/sign_up_create_acount_model.dart';
import 'package:flutter/material.dart';
import 'package:sachin_s_application1/core/app_export.dart';
import 'package:sachin_s_application1/widgets/custom_button.dart';
import 'package:sachin_s_application1/widgets/custom_text_form_field.dart';
import 'package:sachin_s_application1/domain/googleauth/google_auth_helper.dart';

class SignUpCreateAcountScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<SignUpCreateAcountBloc>(
        create: (context) => SignUpCreateAcountBloc(SignUpCreateAcountState(
            signUpCreateAcountModelObj: SignUpCreateAcountModel()))
          ..add(SignUpCreateAcountInitialEvent()),
        child: SignUpCreateAcountScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA70001,
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, top: 13, right: 24, bottom: 13),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                          svgPath: ImageConstant.imgArrowleft,
                          height: getSize(24),
                          width: getSize(24),
                          alignment: Alignment.centerLeft,
                          onTap: () {
                            onTapImgArrowleft(context);
                          }),
                      Padding(
                          padding: getPadding(top: 44),
                          child: Text("lbl_create_account".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPlusJakartaSansBold24.copyWith(
                                  letterSpacing: getHorizontalSize(0.12)))),
                      Padding(
                          padding: getPadding(top: 11),
                          child: Text("msg_lorem_ipsum_dol6".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPlusJakartaSansMedium16
                                  .copyWith(
                                      letterSpacing: getHorizontalSize(0.08)))),
                      CustomButton(
                          height: getVerticalSize(56),
                          text: "msg_continue_with_g".tr,
                          margin: getMargin(top: 28),
                          variant: ButtonVariant.OutlineGray900,
                          padding: ButtonPadding.PaddingT17,
                          fontStyle: ButtonFontStyle
                              .PlusJakartaSansSemiBold16Gray900_1,
                          prefixWidget: Container(
                              margin: getMargin(right: 12),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgGoogle)),
                          onTap: () {
                            onTapContinuewithgoogle(context);
                          }),
                      CustomButton(
                          height: getVerticalSize(56),
                          text: "msg_continue_with_a".tr,
                          margin: getMargin(top: 16),
                          variant: ButtonVariant.OutlineGray900,
                          padding: ButtonPadding.PaddingT17,
                          fontStyle: ButtonFontStyle
                              .PlusJakartaSansSemiBold16Gray900_1,
                          prefixWidget: Container(
                              margin: getMargin(right: 12),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgFire))),
                      Padding(
                          padding: getPadding(left: 33, top: 26, right: 33),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: getPadding(top: 8, bottom: 8),
                                    child: SizedBox(
                                        width: getHorizontalSize(62),
                                        child: Divider(
                                            height: getVerticalSize(1),
                                            thickness: getVerticalSize(1),
                                            color: ColorConstant.indigo50))),
                                Padding(
                                    padding: getPadding(left: 12),
                                    child: Text("msg_or_continue_wit".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPlusJakartaSansSemiBold14Bluegray300
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.07)))),
                                Padding(
                                    padding: getPadding(top: 8, bottom: 8),
                                    child: SizedBox(
                                        width: getHorizontalSize(74),
                                        child: Divider(
                                            height: getVerticalSize(1),
                                            thickness: getVerticalSize(1),
                                            color: ColorConstant.indigo50,
                                            indent: getHorizontalSize(12))))
                              ])),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(top: 28),
                              child: Text("lbl_email".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPlusJakartaSansMedium14
                                      .copyWith(
                                          letterSpacing:
                                              getHorizontalSize(0.07))))),
                      BlocSelector<SignUpCreateAcountBloc,
                              SignUpCreateAcountState, TextEditingController?>(
                          selector: (state) => state.frameOneController,
                          builder: (context, frameOneController) {
                            return CustomTextFormField(
                                focusNode: FocusNode(),
                                controller: frameOneController,
                                hintText: "msg_enter_your_emai".tr,
                                margin: getMargin(top: 9),
                                padding: TextFormFieldPadding.PaddingT15,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.emailAddress);
                          }),
                      CustomButton(
                          height: getVerticalSize(56),
                          text: "msg_continue_with_e".tr,
                          margin: getMargin(top: 40),
                          padding: ButtonPadding.PaddingAll17,
                          fontStyle:
                              ButtonFontStyle.PlusJakartaSansSemiBold16Gray50,
                          onTap: () {
                            onTapContinuewithemail(context);
                          }),
                      Padding(
                          padding: getPadding(left: 40, top: 28, right: 40),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("msg_already_have_an2".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPlusJakartaSansSemiBold16
                                        .copyWith(
                                            letterSpacing:
                                                getHorizontalSize(0.08))),
                                GestureDetector(
                                    onTap: () {
                                      onTapTxtLogin(context);
                                    },
                                    child: Padding(
                                        padding: getPadding(left: 3),
                                        child: Text("lbl_login".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtPlusJakartaSansSemiBold16Gray900
                                                .copyWith(
                                                    letterSpacing:
                                                        getHorizontalSize(
                                                            0.08)))))
                              ])),
                      Container(
                          width: getHorizontalSize(245),
                          margin: getMargin(
                              left: 40, top: 84, right: 40, bottom: 5),
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "msg_by_signing_up_y2".tr,
                                    style: TextStyle(
                                        color: ColorConstant.blueGray400,
                                        fontSize: getFontSize(14),
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontWeight: FontWeight.w600,
                                        letterSpacing:
                                            getHorizontalSize(0.07))),
                                TextSpan(
                                    text: "lbl_terms".tr,
                                    style: TextStyle(
                                        color: ColorConstant.gray90001,
                                        fontSize: getFontSize(14),
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontWeight: FontWeight.w600,
                                        letterSpacing:
                                            getHorizontalSize(0.07))),
                                TextSpan(
                                    text: "lbl_and".tr,
                                    style: TextStyle(
                                        color: ColorConstant.blueGray400,
                                        fontSize: getFontSize(14),
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontWeight: FontWeight.w600,
                                        letterSpacing:
                                            getHorizontalSize(0.07))),
                                TextSpan(
                                    text: "msg_conditions_of_u".tr,
                                    style: TextStyle(
                                        color: ColorConstant.gray90001,
                                        fontSize: getFontSize(14),
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: getHorizontalSize(0.07)))
                              ]),
                              textAlign: TextAlign.center))
                    ]))));
  }

  onTapImgArrowleft(BuildContext context) {
    NavigatorService.goBack();
  }

  onTapContinuewithgoogle(BuildContext context) async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('user data is empty')));
      }
    }).catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }

  onTapContinuewithemail(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signUpCompleteAccountScreen,
    );
  }

  onTapTxtLogin(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
