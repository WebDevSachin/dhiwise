import '../message_action_screen/widgets/message_action_item_widget.dart';
import 'bloc/message_action_bloc.dart';
import 'models/message_action_item_model.dart';
import 'models/message_action_model.dart';
import 'package:flutter/material.dart';
import 'package:sachin_s_application1/core/app_export.dart';
import 'package:sachin_s_application1/presentation/home_page/home_page.dart';
import 'package:sachin_s_application1/presentation/message_page/message_page.dart';
import 'package:sachin_s_application1/presentation/profile_page/profile_page.dart';
import 'package:sachin_s_application1/presentation/saved_page/saved_page.dart';
import 'package:sachin_s_application1/widgets/app_bar/appbar_image.dart';
import 'package:sachin_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:sachin_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:sachin_s_application1/widgets/custom_bottom_bar.dart';
import 'package:sachin_s_application1/widgets/custom_button.dart';
import 'package:sachin_s_application1/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class MessageActionScreen extends StatelessWidget {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<MessageActionBloc>(
        create: (context) => MessageActionBloc(
            MessageActionState(messageActionModelObj: MessageActionModel()))
          ..add(MessageActionInitialEvent()),
        child: MessageActionScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA70002,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                height: getVerticalSize(51),
                leadingWidth: 48,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 24, top: 13, bottom: 14),
                    onTap: () {
                      onTapArrowleft3(context);
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_message".tr)),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(top: 24, bottom: 24),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BlocSelector<MessageActionBloc, MessageActionState,
                              TextEditingController?>(
                          selector: (state) => state.frameOneController,
                          builder: (context, frameOneController) {
                            return CustomSearchView(
                                focusNode: FocusNode(),
                                controller: frameOneController,
                                hintText: "msg_search_message".tr,
                                margin: getMargin(left: 24, top: 4, right: 24),
                                padding: SearchViewPadding.PaddingT15,
                                prefix: Container(
                                    margin: getMargin(
                                        left: 16,
                                        top: 17,
                                        right: 8,
                                        bottom: 17),
                                    child: CustomImageView(
                                        svgPath: ImageConstant.imgSearch)),
                                prefixConstraints: BoxConstraints(
                                    maxHeight: getVerticalSize(52)),
                                suffix: Container(
                                    margin: getMargin(
                                        left: 30,
                                        top: 17,
                                        right: 16,
                                        bottom: 17),
                                    child: CustomImageView(
                                        svgPath: ImageConstant.imgInfo)),
                                suffixConstraints: BoxConstraints(
                                    maxHeight: getVerticalSize(52)));
                          }),
                      Padding(
                          padding: getPadding(top: 24),
                          child: BlocSelector<MessageActionBloc,
                                  MessageActionState, MessageActionModel?>(
                              selector: (state) => state.messageActionModelObj,
                              builder: (context, messageActionModelObj) {
                                return ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    separatorBuilder: (context, index) {
                                      return Padding(
                                          padding:
                                              getPadding(top: 7.5, bottom: 7.5),
                                          child: SizedBox(
                                              width: getHorizontalSize(327),
                                              child: Divider(
                                                  height: getVerticalSize(1),
                                                  thickness: getVerticalSize(1),
                                                  color:
                                                      ColorConstant.indigo50)));
                                    },
                                    itemCount: messageActionModelObj
                                            ?.messageActionItemList.length ??
                                        0,
                                    itemBuilder: (context, index) {
                                      MessageActionItemModel model =
                                          messageActionModelObj
                                                      ?.messageActionItemList[
                                                  index] ??
                                              MessageActionItemModel();
                                      return MessageActionItemWidget(model,
                                          onTapChat: () {
                                        onTapChat(context);
                                      }, onTapRowdot: () {
                                        onTapRowdot(context);
                                      });
                                    });
                              })),
                      Spacer(),
                      CustomButton(
                          height: getVerticalSize(46),
                          width: getHorizontalSize(137),
                          text: "lbl_new_chat".tr,
                          margin: getMargin(right: 24),
                          shape: ButtonShape.RoundedBorder20,
                          padding: ButtonPadding.PaddingT14,
                          fontStyle:
                              ButtonFontStyle.PlusJakartaSansSemiBold14Gray50,
                          prefixWidget: Container(
                              margin: getMargin(right: 4),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgPlus18x18)),
                          alignment: Alignment.centerRight)
                    ])),
            bottomNavigationBar:
                CustomBottomBar(onChanged: (BottomBarEnum type) {
              Navigator.pushNamed(
                  navigatorKey.currentContext!, getCurrentRoute(type));
            })));
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePage;
      case BottomBarEnum.Message:
        return AppRoutes.messagePage;
      case BottomBarEnum.Saved:
        return AppRoutes.savedPage;
      case BottomBarEnum.Profile:
        return AppRoutes.profilePage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage.builder(context);
      case AppRoutes.messagePage:
        return MessagePage.builder(context);
      case AppRoutes.savedPage:
        return SavedPage.builder(context);
      case AppRoutes.profilePage:
        return ProfilePage.builder(context);
      default:
        return DefaultWidget();
    }
  }

  onTapChat(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.chatScreen);
  }

  onTapRowdot(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.chatScreen);
  }

  onTapArrowleft3(BuildContext context) {
    NavigatorService.goBack();
  }
}
