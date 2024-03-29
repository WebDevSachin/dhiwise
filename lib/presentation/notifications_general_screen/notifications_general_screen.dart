import '../notifications_general_screen/widgets/listuser1_item_widget.dart';
import 'bloc/notifications_general_bloc.dart';
import 'models/listuser1_item_model.dart';
import 'models/notifications_general_model.dart';
import 'package:flutter/material.dart';
import 'package:sachin_s_application1/core/app_export.dart';
import 'package:sachin_s_application1/widgets/app_bar/appbar_image.dart';
import 'package:sachin_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:sachin_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:sachin_s_application1/widgets/custom_button.dart';

class NotificationsGeneralScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<NotificationsGeneralBloc>(
        create: (context) => NotificationsGeneralBloc(NotificationsGeneralState(
            notificationsGeneralModelObj: NotificationsGeneralModel()))
          ..add(NotificationsGeneralInitialEvent()),
        child: NotificationsGeneralScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA70002,
            appBar: CustomAppBar(
                height: getVerticalSize(50),
                leadingWidth: 48,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 24, top: 13, bottom: 13),
                    onTap: () {
                      onTapArrowleft9(context);
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_notifications".tr),
                actions: [
                  AppbarImage(
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgSettings,
                      margin:
                          getMargin(left: 24, top: 13, right: 24, bottom: 13),
                      onTap: () {
                        onTapSettings(context);
                      })
                ]),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, top: 30, right: 24, bottom: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(children: [
                        CustomButton(
                            height: getVerticalSize(44),
                            width: getHorizontalSize(79),
                            text: "lbl_general".tr,
                            shape: ButtonShape.RoundedBorder12,
                            padding: ButtonPadding.PaddingAll16,
                            fontStyle: ButtonFontStyle
                                .PlusJakartaSansSemiBold12WhiteA700_1),
                        CustomButton(
                            height: getVerticalSize(44),
                            width: getHorizontalSize(111),
                            text: "lbl_my_proposals".tr,
                            margin: getMargin(left: 12),
                            variant: ButtonVariant.OutlineBluegray50,
                            shape: ButtonShape.RoundedBorder12,
                            padding: ButtonPadding.PaddingAll16,
                            fontStyle: ButtonFontStyle
                                .PlusJakartaSansSemiBold12Gray600_1,
                            onTap: () {
                              onTapMyproposals(context);
                            })
                      ]),
                      Padding(
                          padding: getPadding(top: 24, bottom: 117),
                          child: BlocSelector<
                                  NotificationsGeneralBloc,
                                  NotificationsGeneralState,
                                  NotificationsGeneralModel?>(
                              selector: (state) =>
                                  state.notificationsGeneralModelObj,
                              builder: (context, notificationsGeneralModelObj) {
                                return ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    separatorBuilder: (context, index) {
                                      return Padding(
                                          padding: getPadding(
                                              top: 15.5, bottom: 15.5),
                                          child: SizedBox(
                                              width: getHorizontalSize(323),
                                              child: Divider(
                                                  height: getVerticalSize(1),
                                                  thickness: getVerticalSize(1),
                                                  color:
                                                      ColorConstant.indigo50)));
                                    },
                                    itemCount: notificationsGeneralModelObj
                                            ?.listuser1ItemList.length ??
                                        0,
                                    itemBuilder: (context, index) {
                                      Listuser1ItemModel model =
                                          notificationsGeneralModelObj
                                                  ?.listuser1ItemList[index] ??
                                              Listuser1ItemModel();
                                      return Listuser1ItemWidget(model);
                                    });
                              }))
                    ]))));
  }

  onTapMyproposals(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.notificationsMyProposalsScreen,
    );
  }

  onTapArrowleft9(BuildContext context) {
    NavigatorService.goBack();
  }

  onTapSettings(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.settingsScreen,
    );
  }
}
