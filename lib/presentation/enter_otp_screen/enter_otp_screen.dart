import 'bloc/enter_otp_bloc.dart';
import 'models/enter_otp_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sachin_s_application1/core/app_export.dart';
import 'package:sachin_s_application1/widgets/custom_button.dart';

class EnterOtpScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<EnterOtpBloc>(
        create: (context) =>
            EnterOtpBloc(EnterOtpState(enterOtpModelObj: EnterOtpModel()))
              ..add(EnterOtpInitialEvent()),
        child: EnterOtpScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA70002,
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
                          child: Text("lbl_enter_otp".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPlusJakartaSansBold24.copyWith(
                                  letterSpacing: getHorizontalSize(0.12)))),
                      Container(
                          width: getHorizontalSize(282),
                          margin: getMargin(left: 22, top: 10, right: 22),
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "msg_we_have_just_se2".tr,
                                    style: TextStyle(
                                        color: ColorConstant.blueGray400,
                                        fontSize: getFontSize(14),
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontWeight: FontWeight.w500,
                                        letterSpacing:
                                            getHorizontalSize(0.07))),
                                TextSpan(
                                    text: "msg_example_gmail_c".tr,
                                    style: TextStyle(
                                        color: ColorConstant.gray900,
                                        fontSize: getFontSize(14),
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: getHorizontalSize(0.07)))
                              ]),
                              textAlign: TextAlign.center)),
                      Padding(
                          padding: getPadding(left: 16, top: 38, right: 15),
                          child: BlocSelector<EnterOtpBloc, EnterOtpState,
                                  TextEditingController?>(
                              selector: (state) => state.otpController,
                              builder: (context, otpController) {
                                return PinCodeTextField(
                                    appContext: context,
                                    controller: otpController,
                                    length: 4,
                                    obscureText: false,
                                    obscuringCharacter: '*',
                                    keyboardType: TextInputType.number,
                                    autoDismissKeyboard: true,
                                    enableActiveFill: true,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    onChanged: (value) {
                                      otpController?.text = value;
                                    },
                                    textStyle: TextStyle(
                                        color: ColorConstant.gray900,
                                        fontSize: getFontSize(24),
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: getHorizontalSize(0.12)),
                                    pinTheme: PinTheme(
                                        fieldHeight: getHorizontalSize(56),
                                        fieldWidth: getHorizontalSize(56),
                                        shape: PinCodeFieldShape.box,
                                        borderRadius: BorderRadius.circular(
                                            getHorizontalSize(24)),
                                        selectedFillColor:
                                            ColorConstant.whiteA700,
                                        activeFillColor:
                                            ColorConstant.whiteA700,
                                        inactiveFillColor:
                                            ColorConstant.whiteA700,
                                        inactiveColor: ColorConstant.indigo50,
                                        selectedColor: ColorConstant.indigo50,
                                        activeColor: ColorConstant.indigo50));
                              })),
                      CustomButton(
                          height: getVerticalSize(56),
                          text: "lbl_continue".tr,
                          margin: getMargin(top: 40),
                          padding: ButtonPadding.PaddingAll17,
                          fontStyle:
                              ButtonFontStyle.PlusJakartaSansSemiBold16Gray50,
                          onTap: () {
                            onTapContinue(context);
                          }),
                      Padding(
                          padding: getPadding(
                              left: 30, top: 26, right: 30, bottom: 5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("msg_didn_t_receive_code".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPlusJakartaSansSemiBold16
                                        .copyWith(
                                            letterSpacing:
                                                getHorizontalSize(0.08))),
                                Text("lbl_resend_code".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtPlusJakartaSansSemiBold16Gray900
                                        .copyWith(
                                            letterSpacing:
                                                getHorizontalSize(0.08)))
                              ]))
                    ]))));
  }

  onTapImgArrowleft(BuildContext context) {
    NavigatorService.goBack();
  }

  onTapContinue(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.jobTypeScreen,
    );
  }
}
