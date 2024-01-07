import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/listlocation_item_model.dart';
import 'package:sachin_s_application1/presentation/notifications_my_proposals_screen/models/notifications_my_proposals_model.dart';
part 'notifications_my_proposals_event.dart';
part 'notifications_my_proposals_state.dart';

class NotificationsMyProposalsBloc
    extends Bloc<NotificationsMyProposalsEvent, NotificationsMyProposalsState> {
  NotificationsMyProposalsBloc(NotificationsMyProposalsState initialState)
      : super(initialState) {
    on<NotificationsMyProposalsInitialEvent>(_onInitialize);
  }

  _onInitialize(
    NotificationsMyProposalsInitialEvent event,
    Emitter<NotificationsMyProposalsState> emit,
  ) async {
    emit(state.copyWith(
        notificationsMyProposalsModelObj: state.notificationsMyProposalsModelObj
            ?.copyWith(listlocationItemList: fillListlocationItemList())));
  }

  List<ListlocationItemModel> fillListlocationItemList() {
    return List.generate(3, (index) => ListlocationItemModel());
  }
}
