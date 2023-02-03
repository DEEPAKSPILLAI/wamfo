import 'dart:convert';

import 'package:wamfo/base/base_view_model.dart';
import 'package:wamfo/models/my_mission_specified_model.dart';
import 'package:wamfo/models/mymission_list_model.dart';

class MyMissionSpecifiedVM extends BaseViewModel {
  @override
  void onInit() async {
    await myMissionSpecified();
  }

  MyMissionSpecifiedModel? myMissionSpecifiedModel;
  int? id;
  String? type;
  String? stringDate;
  DateTime? date;
  String? tempType;
  DateTime? tempDate;
  String? statusType;
  String? type1;

  myMissionSpecified() async {
    final body = {"id": id};
    showLoading();
    final res =
        await api.myMissionSpecifiedRepo.myMissionSpecified(jsonEncode(body));
    if (res.data['success'] == true) {
      hideLoading();
      print(res);
      print(id);

      final details = res.data['data'];
      myMissionSpecifiedModel = MyMissionSpecifiedModel.fromJson(details);
      print(myMissionSpecifiedModel?.servingFromTime);
      statusType = myMissionSpecifiedModel?.status;

      if (statusType == "approved") {
        type1 = "Approve";
      } else if (statusType == "waiting") {
        type1 = "Waiting for approval";
      } else if (statusType == "disapproved") {
        type1 = "Disapprove";
      } else {
        type1 = "";
      }

      tempType = myMissionSpecifiedModel?.serviceType;

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
}
