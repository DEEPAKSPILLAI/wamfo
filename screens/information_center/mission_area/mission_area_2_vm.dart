import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:wamfo/base/base_view_model.dart';
import 'package:wamfo/models/mission_area_specified_model.dart';
import 'package:wamfo/screens/information_center/mission_area/confirmation.dart';

class MissionAreaPage2VM extends BaseViewModel {
  @override
  void onInit() async {
    await postMissionAreaSpec();
  }

  //final GlobalKey<SfPdfViewerState> pdfViewerKey = GlobalKey();
  MissionAreaSpecifiedModel? missionAreaSpecifiedModel;
  int? id;
  String? type;
  String? stringDate;
  DateTime? date;
  String? tempType;
  DateTime? tempDate;

  postMissionAreaSpec() async {
    final body = {"id": id, "user_id": prefs.user?.id};
    showLoading();
    final res = await api.missionAreaSpecifiedRepo
        .postMissionAreaSpec(jsonEncode(body));
    if (res.data['success'] == true) {
      hideLoading();
      print(res);
      print(id);

      final details = res.data['data'];
      missionAreaSpecifiedModel = MissionAreaSpecifiedModel.fromJson(details);
      print(missionAreaSpecifiedModel?.servingFromTime);
      tempType = missionAreaSpecifiedModel?.serviceType;

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

  postAcceptData(context) async {
    final body = {"application_service_id": id, "student_id": prefs.user?.id};

    showLoading();

    final res =
        await api.missionAreaAcceptRepo.postMissionAreaAccept(jsonEncode(body));

    if (res.data['success'] == true) {
      hideLoading();
      print(res);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Confirmation(),
        ),
      );
    } else {
      showError(res.data['message'] ?? "");
    }
  }
}
