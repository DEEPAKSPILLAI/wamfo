import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:wamfo/base/base_view_model.dart';

import '../../../../models/service_record_detailed_view_model.dart';

class ServiceRecordDetailedViewVM extends BaseViewModel {
  @override
  void onInit() async {
    getRecordDetails();
  }

  ServiceRecordDetailedViewModel? serviceDetailedView;
  int? id;
  String? type;
  String? stringDate;
  DateTime? date;
  String? tempType;

  getRecordDetails() async {
    final body = {"id": id};
    showLoading();
    final res = await api.serviceRecordDetailedViewRepo
        .viewServiceRecordDetails(jsonEncode(body));
    if (res.data['success'] == true) {
      hideLoading();
      print(res);
      print(id);

      final details = res.data['data'];
      serviceDetailedView = ServiceRecordDetailedViewModel.fromJson(details);
      print(serviceDetailedView?.servingFromTime);
      tempType = serviceDetailedView?.serviceType;

      if (tempType == "home") {
        type = "Home Service";
      } else if (tempType == "school") {
        type = "School Service";
      } else if (tempType == "community") {
        type = "Community Service";
      }
      print(tempType);
    } else {
      showError(res.data['message'] ?? "");
    }
  }

  share() async {
    final body = {"id": id};
    showLoading();
    final res = await api.shareToCanteenRepo.shareToCanteen(jsonEncode(body));
    if (res.data['success'] == true) {
      hideLoading();
      print(res);
    } else {
      showError(res.data['message'] ?? "");
    }
  }
}
